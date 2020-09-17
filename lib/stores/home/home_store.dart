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
  SharedPreferencesService _preferencesService;
  StreamSubscription<Conversation> _conversationChangedSubscription;

  _HomeStoreBase() {
    _preferencesService = sl<SharedPreferencesService>();
    _repository = sl<HomeRepository>();
    _shouldShowWelcomeDialog();
    getConversations();
  }

  void _shouldShowWelcomeDialog() {
    _showWelcomeDialog =
        _preferencesService.getBool(StorageKey.welcomeDialog, true);
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
      await getCachedHome();
      final conversations = await _repository.getHome();
      _repository.cacheHome(conversations);
      updateUi(conversations);

      return right(conversations);
    } on ServerError catch (e) {
      return left(e);
    } finally {
      _loading = false;
    }
  }

  @action
  void updateUi(List<Conversation> conversations) {
    _conversations.clear();
    _conversations.addAll(conversations);
  }

  @action
  Future saveWelcomeSeen() async {
    await _preferencesService.setBool(StorageKey.welcomeDialog, false);
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
    });
  }

  void dispose() async {
    _conversationChangedSubscription?.cancel();
  }
}
