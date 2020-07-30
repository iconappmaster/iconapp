import 'package:dartz/dartz.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/category_model.dart';
import 'package:iconapp/data/repositories/home_repository.dart';
import 'package:iconapp/data/repositories/search_repository.dart';
import 'package:iconapp/data/sources/local/shared_preferences.dart';
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

    _showWelcomeDialog =
        _preferencesService.getBool(StorageKey.welcomeDialog, true);

    getHome();
  }
  @observable
  HomeState _state = HomeState.initial();

  @observable
  bool _showWelcomeDialog = true;

  @computed
  bool get showWelcomeDialog => _showWelcomeDialog;

  @computed
  bool get isLoading => _state.loading;

  @computed
  List<CategoryModel> get conversations => _state.categories;

  @action
  Future<Either<ServerError, Unit>> getHome() async {
    try {
      _state = _state.copyWith(loading: true);
      final categories = await _repository.getHome();
      _state = _state.copyWith(categories: categories);
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
