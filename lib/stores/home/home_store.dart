import 'package:dartz/dartz.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/data/repositories/home_repository.dart';
import 'package:iconapp/data/sources/local/shared_preferences.dart';
import 'package:iconapp/domain/core/errors.dart';
import 'package:iconapp/stores/home/home_state.dart';
import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  HomeRepository _repository;
  SharedPreferencesService _preferencesService;

  _HomeStoreBase() {
    _preferencesService = sl<SharedPreferencesService>();
    _repository = sl<HomeRepository>();

    _shouldShowWelcomeDialog();
    getHome();
  }

  void _shouldShowWelcomeDialog() {
    _showWelcomeDialog =
        _preferencesService.getBool(StorageKey.welcomeDialog, true);
  }

  @observable
  HomeState _state = HomeState.initial();

  @observable
  ObservableList<Conversation> _categories = ObservableList.of([]);

  @observable
  bool _showWelcomeDialog = true;

  @computed
  bool get showWelcomeDialog => _showWelcomeDialog;

  @computed
  bool get isLoading => _state.loading;

  @computed
  List<Conversation> get conversations => _categories;

  @action
  void addConversation(Conversation category) {
    _categories.add(category);
  }

  @action
  Future<Either<ServerError, Unit>> getHome() async {
    try {
      _state = _state.copyWith(loading: true);
      final categories = await _repository.getHome();
      _categories.clear();
      _categories.addAll(categories);

      return right(unit);
    } on ServerError catch (e) {
      return left(e);
    } finally {
      _state = _state.copyWith(loading: false);
    }
  }

  @action
  Future hideWelcomeDialog() async {
    await _preferencesService.setBool(StorageKey.welcomeDialog, false);
    _showWelcomeDialog = false;
  }
}
