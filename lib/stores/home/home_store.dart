import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:iconapp/core/ads/fullscreen_ad.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/firebase/crashlytics.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/data/repositories/home_repository.dart';
import 'package:iconapp/data/sources/local/shared_preferences.dart';
import 'package:iconapp/domain/core/errors.dart';
import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  HomeRepository _repository;
  SharedPreferencesService _sp;
  StreamSubscription<Conversation> _conversationChangedSubscription;
  InterstitialAd interstitialAd;

  _HomeStoreBase() {
    _sp = sl<SharedPreferencesService>();
    _repository = sl<HomeRepository>();
    _shouldShowWelcomeDialog();
    interstitialAd = InterstitialAd(adUnitId: '/22166703028/icon_start_splash');
  }

  void _shouldShowWelcomeDialog() {
    _showWelcomeDialog = _sp.getBool(StorageKey.welcomeDialog, true);
  }

  @observable
  bool _loading = false;

  @observable
  ObservableList<Conversation> _conversations = ObservableList.of([]);

  @observable
  bool _showWelcomeDialog = true;

  @computed
  bool get showWelcomeDialog => _showWelcomeDialog;

  @computed
  bool get isLoading => _loading;

  @computed
  List<Conversation> get conversations => _conversations;

  @action
  Future<Either<ServerError, List<Conversation>>> getConversations() async {
    try {
      _loading = true;

      // try to render the cached conversations if
      await getCachedAndRender();

      // backend will check if there are any changes since the last time waw fetched and return.
      final remote = await _repository.getConversations();

      // save and render only if there's an update.
      if (remote.isNotEmpty) {
        _repository.saveHome(remote);
        updateUi(remote);
      }
      return right(remote);
    } on ServerError catch (e) {
      Crash.report(e.message);
      return left(e);
    } finally {
      _loading = false;
    }
  }

  @action
  void addConversation(Conversation conversation) {
    _conversations.add(conversation);
    _repository.saveHome(_conversations);
  }

  @action
  void removeConversation(int conversationId) {
    _conversations.removeWhere((c) => c.id == conversationId);
    _repository.saveHome(_conversations);
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

  // will update the conversation with the pinned state and move it to the top
  // of the list.
  @action
  void setConversationPinned(bool pinned, Conversation conversation) {
    final index = _conversations.indexWhere((c) => c.id == conversation.id);

    if (index != -1)
      _conversations
        ..removeAt(index)
        ..insert(pinned ? 0 : _conversations.length, conversation);
  }

  @action
  void updateConversation(Conversation conversation) {
    final index = _conversations.indexWhere((c) => c.id == conversation.id);

    if (index != -1) _conversations[index] = conversation;
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
    _conversationChangedSubscription ??=
        _repository.watchConversation().listen((socketData) {
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
        );

        _conversations[index] = updatedConversation;
        _reorderListWherePinnedAtTop(index, _conversations[index]);
      }
    });
  }

  void _reorderListWherePinnedAtTop(int index, Conversation conversation) {
    if (conversation.isPinned) {
      // if the conversation is piined just move it to the top
      _conversations
        ..removeAt(index)
        ..insert(0, conversation);
    } else {
      // if conversation is not pinned then relocate it under all the pinned
      // ones.
      final pinnedAmount =
          _conversations.where((element) => element.isPinned).length;

      _conversations
        ..removeAt(index)
        ..insert(pinnedAmount > 0 ? pinnedAmount : 0, conversation);
    }
  }

  @action
  void hideBadge(int index) {
    _conversations[index] = _conversations[index].copyWith(
      shouldShowNewBadge: false,
    );
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
