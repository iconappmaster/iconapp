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
  Future<Either<ServerError, List<Conversation>>> getConversations() async {
    try {
      setLoading(true);
      final conversations = await _repository.getHome();
      setConversations(conversations);
      setLoading(false);
      return right(conversations);
    } on ServerError catch (e) {
      return left(e);
    }
  }

  @action
  void setConversations(List<Conversation> conversations) {
    if (conversations.isNotEmpty) _conversations.clear();
    _conversations.addAll(conversations);
  }

  @action
  Future setLoading(bool loading) async {
    _loading = loading;
  }

  @action
  Future saveWelcomeSeen() async {
    await _preferencesService.setBool(StorageKey.welcomeDialog, false);
    _showWelcomeDialog = false;
  }
}
