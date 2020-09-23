import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:iconapp/core/dependencies/locator.dart';
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
    getConversations();
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
  Future getCachedHome() async {
    final cached = await _repository.getCachedHome();
    if (cached != null) {
      updateUi(cached);
    }
  }

  @action
  Future<Either<ServerError, List<Conversation>>> getConversations() async {
    try {
      _loading = true;
      final conversations = await _repository.getConversations();
      if (conversations.isNotEmpty) {
        updateUi(conversations);
        _markHomeTimestamp();
        return right(conversations);
      } else {
        return right([]);
      }
    } on ServerError catch (e) {
      return left(e);
    } finally {
      _loading = false;
    }
  }

  void _markHomeTimestamp() {
    final ts = DateTime.now().microsecondsSinceEpoch;
    _sp.setInt(StorageKey.homeTimestamp, ts);
  }

  @action
  void updateSingleConversation(Conversation conversation) {
    final index = _conversations.indexWhere((c) => c.id == conversation.id);
    _conversations[index] = conversation;
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
        _repository.watchConversation().listen((conversation) {
      final conversationIndex =
          _conversations.indexWhere((c) => c.id == conversation.id);

      if (conversationIndex != -1) {
        // stroy already exists, replace it.
        _conversations[conversationIndex] = conversation;
      } else {
        // add a new story
        _conversations.add(conversation);
      }

      _repository.cacheHome(_conversations);
    });
  }

  void dispose() async {
    _conversationChangedSubscription?.cancel();
  }
}
