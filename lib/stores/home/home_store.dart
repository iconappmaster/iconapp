import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/firebase/crashlytics.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/data/repositories/home_repository.dart';
import 'package:iconapp/data/sources/local/shared_preferences.dart';
import 'package:iconapp/domain/core/errors.dart';
import 'package:iconapp/widgets/home/home_filter.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;
enum ViewHomeMode { staggered, list }
enum TabMode { conversation, media }

abstract class _HomeStoreBase with Store {
  HomeRepository _repository;
  SharedPreferencesService _sp;
  StreamSubscription<Conversation> _conversationChangedSubscription;

  _HomeStoreBase() {
    _sp = sl<SharedPreferencesService>();
    _repository = sl<HomeRepository>();
    _shouldShowWelcomeDialog();

    if (_sp.contains(StorageKey.homeViewMode)) {
      _viewMode = (_sp.getString(StorageKey.homeViewMode) == 'list' ? ViewHomeMode.list : ViewHomeMode.staggered);
    } else {
      _viewMode = ViewHomeMode.staggered;
    }
  }

  void _shouldShowWelcomeDialog() {
    _showWelcomeDialog = _sp.getBool(StorageKey.welcomeDialog, true);
  }

  @observable
  TabMode _tabMode = TabMode.conversation;

  @observable
  HomeFilterType _type = HomeFilterType.forYou;

  @observable
  ViewHomeMode _viewMode = ViewHomeMode.staggered;

  @observable
  ObservableList<MessageModel> _media = ObservableList.of([]);

  @observable
  ObservableList<Conversation> _conversationSubscribed = ObservableList.of([]);

  @observable
  ObservableList<Conversation> _conversationPopular = ObservableList.of([]);

  @observable
  bool _loading = false;

  @observable
  bool _showForceUpdate = false;

  @observable
  ObservableList<Conversation> _conversations = ObservableList.of([]);

  @observable
  bool _showWelcomeDialog = true;

  @observable
  String _conversationCode = '';

  @computed
  String get conversationCode => _conversationCode;

  @computed
  HomeFilterType get type => _type;

  @computed
  List<Conversation> get conversationSubscribed => _conversationSubscribed;

  @computed
  List<Conversation> get conversationPopular => _conversationPopular;

  @computed
  TabMode get tabMode => _tabMode;

  @computed
  int get getCurrentTabIndex => tabMode == TabMode.conversation ? 0 : 1;

  @computed
  bool get showWelcomeDialog => _showWelcomeDialog;

  @computed
  bool get showForceUpdate => _showForceUpdate;

  @computed
  bool get isLoading => _loading;

  @computed
  HomeFilterType get filterType => _type;

  @computed
  ViewHomeMode get viewMode => _viewMode;

  @computed
  List<MessageModel> get userMedia => _media;

  @computed
  List<Conversation> get conversations => _conversations;

  @action
  void setFilterType(HomeFilterType type) {
    _type = type;
  }

  @action
  void setConversationCode(String code) {
    _conversationCode = code;
  }

  @action
  Future getUserMedia() async {
    try {
      _loading = true;
      final media = await _repository.getMedia();
      _media
        ..clear()
        ..addAll(media);
    } on DioError catch (e) {
      Crash.report(e.message);
    } finally {
      _loading = false;
    }
  }

  @action
  void setTabMode(TabMode tabMode) {
    _tabMode = tabMode;
  }

  @action
  void addConversation(Conversation conversation) {
    _conversations.add(conversation);
    _repository.saveHome(_conversations);
  }

  @action
  void remove(int conversationId) {
    _conversations.removeWhere((c) => c.id == conversationId);
    _repository.saveHome(_conversations);
  }

  @action
  void removeMessageInConversation(int conversationId, int messageId) {
    final index = _conversations.indexWhere((c) => c.id == conversationId);
    if (index != -1) {
      final messages = (_conversations[index].messages);
      messages.removeWhere((m) => m.id == messageId);

      _conversations[index] = _conversations[index].copyWith(messages: messages);
    }
  }

  @action
  Future<List<Conversation>> getCachedAndRender() async {
    final cached = await _repository.getCachedHome();
    if (cached != null) {
      updateUi(cached);
      return cached;
    } else
      return [];
  }

  @action
  Future checkAppVersion() async {
    try {
      final showForceUpdate = await _repository.updateAppVersion();
      _showForceUpdate = showForceUpdate;
    } on ServerError catch (e) {
      Crash.report(e.message);
    }
  }

  @action
  Future<Either<ServerError, List<Conversation>>> getConversations() async {
    try {
      _loading = true;

      // try to render the cached conversations if
      await getCachedAndRender();

      // backend will check if there are any changes since the last time waw fetched and return.
      final conversation = await _repository.getConversations();

      // save and render only if there's an update.
      if (conversation.isNotEmpty) {
        _repository.saveHome(conversation);
        updateUi(conversation);
      }

      // return the conversations
      return right(conversation);
    } on ServerError catch (e) {
      Crash.report(e.message);
      return left(e);
    } finally {
      _loading = false;
    }
  }

  @action
  Future getPopularConversation() async {
    try {
      _loading = true;
      final popular = await _repository.getConversationPopular();

      _conversationPopular
        ..clear()
        ..addAll(popular);
    } on ServerError catch (e) {
      Crash.report(e.message);
      return left(e);
    } finally {
      _loading = false;
    }
  }

  @action
  void setConversationPinned(bool pinned, Conversation conversation) {
    final index = _conversations.indexWhere((c) => c.id == conversation.id);

    if (index != -1)
      _conversations
        ..removeAt(index)
        ..insert(pinned ? 0 : _conversations.length, conversation);
  }

  @action
  void setConversation(Conversation conversation) {
    final index = _conversations.indexWhere((c) => c.id == conversation.id);
    if (index != -1) _conversations[index] = conversation;
  }

  @action
  void moveConversationToIndex(Conversation conversation, int index) {
    final i = _conversations.indexWhere((c) => c.id == conversation.id);

    _conversations
      ..removeAt(i)
      ..insert(index, conversation);
  }

  @action
  void updateUi(List<Conversation> conversations) {
    _conversations.clear();
    _conversations.addAll(conversations);
  }

  @action
  Future saveWelcomeSeen() async {
    await _sp.setBool(StorageKey.welcomeDialog, false);
    _showWelcomeDialog = false;
  }

  @action
  void watchConversation() {
    _conversationChangedSubscription ??= _repository.watchConversation().listen(
      (socketData) {
        // Find index of the conversation based on id
        final index = _conversations.indexWhere((c) => c.id == socketData.id);

        // if the conversation exists the replace the payload with the incoming
        // socket conversation, if the index not found then add a new conversation
        // in the list
        if (index != -1) {
          final updatedConversation = _conversations[index].copyWith(
            messages: socketData.messages,
            lastMessage: socketData.lastMessage,
            shouldShowNewBadge: true,
            media: socketData.media,
          );

          _conversations[index] = updatedConversation;

          _reorderListWhereSubscribeAtTop(index, _conversations[index]);
        }
      },
    );
  }

  @action
  Future<bool> verifyConversationCode(int conversationId) async {
    try {
      _loading = true;
      final conversation = await _repository.verifyConversationCode(conversationId, conversationCode);
      setConversation(conversation);
      return true;
    } on DioError catch (e) {
      Crash.report(e.message);
      return false;
    } finally {
      _loading = false;
    }
  }

  void _reorderListWhereSubscribeAtTop(int index, Conversation conversation) {
    if (conversation.isSubscribed) {
      // if the conversation is piined just move it to the top
      _conversations
        ..removeAt(index)
        ..insert(0, conversation);
    } else {
      // if conversation is not pinned then relocate it under all the pinned
      // ones.
      final subscribedConversationAmount = _conversations.where((c) => c.isSubscribed).length;

      _conversations
        ..removeAt(index)
        ..insert(
          subscribedConversationAmount > 0 ? subscribedConversationAmount : 0,
          conversation,
        );
    }
  }

  @action
  void hideNewBadge(int index) {
    _conversations[index] = _conversations[index].copyWith(
      shouldShowNewBadge: false,
    );
  }

  @action
  void switchViewMode() {
    _viewMode = _viewMode == ViewHomeMode.staggered ? ViewHomeMode.list : ViewHomeMode.staggered;
  }

  @action
  Future<Conversation> getCachedConversationById(int id) async {
    try {
      final cached = await _repository.getCachedHome();
      return cached.firstWhere((c) => c.id == id);
    } on Exception catch (e) {
      Crash.report(e.toString());
      return null;
    }
  }

  void dispose() async {
    _conversationChangedSubscription?.cancel();
    
  }
}
