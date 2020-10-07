import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/firebase/crashlytics.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/data/repositories/home_repository.dart';
import 'package:iconapp/data/sources/local/shared_preferences.dart';
import 'package:iconapp/domain/core/errors.dart';
import 'package:iconapp/stores/user/user_store.dart';
import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  HomeRepository _repository;
  UserStore user;
  SharedPreferencesService _sp;
  StreamSubscription<Conversation> _conversationChangedSubscription;

  _HomeStoreBase() {
    _sp = sl<SharedPreferencesService>();
    _repository = sl<HomeRepository>();
    _shouldShowWelcomeDialog();
    // getConversations();
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
  void addConversation(Conversation conversation) {
    _conversations.add(conversation);
  }

  @action
  Future<List<Conversation>> getCachedAndRender() async {
    final cached = await _repository.getCachedHome();
    if (cached != null) {
      updateUi(cached);
      return cached;
    }
    return [];
  }

  @action
  Future<Either<ServerError, List<Conversation>>> getConversations(
      {bool force = false}) async {
    try {
      _loading = true;

      // get the last timestamp it's the first time then return 0 as default
      final timestamp = _sp.getInt(StorageKey.homeTimestamp) ?? 0;
      _saveFetchTimestamp();

      // try to render the cached conversations if
      await getCachedAndRender();

      // backend will check if there are any changes since the last time waw fetched and return.
      final remote = await _repository.getConversations(force ? 0 : timestamp);

      // save and render only if there's an update.
      if (remote.isNotEmpty) {
        _repository.saveHome(remote);
        updateUi(remote);
      }

      // return the conversations
      return right(remote);
    } on ServerError catch (e) {
      Crash.report(e.message);
      return left(e);
    } finally {
      _loading = false;
    }
  }

  void _saveFetchTimestamp() {
    final ts = DateTime.now().microsecondsSinceEpoch;
    _sp.setInt(StorageKey.homeTimestamp, ts);
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
    _conversationChangedSubscription =
        _repository.watchConversation().listen((conversationEvent) {
      final index =
          _conversations.indexWhere((c) => c.id == conversationEvent.id);

      if (index != -1) {
        // stroy already exists, replace it.

        final c = _conversations[index];

        _conversations[index] = conversationEvent.copyWith(
          userRole: c.userRole,
          isSubscribed: c.isSubscribed,
          isPinned: c.isPinned,
        );
      } else {
        // add a new story
        _conversations.add(conversationEvent);
      }

      _repository.saveHome(_conversations);
    });
  }

  @action
  void resetCount(int index) {
    _conversations[index] =
        _conversations[index].copyWith(numberOfUnreadMessages: 0);
  }

  @action
  Conversation getConversationById(int id) {
    return _conversations.firstWhere((c) => c.id == id);
  }

  void dispose() async {
    _conversationChangedSubscription?.cancel();
  }
}
