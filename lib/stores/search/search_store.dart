import 'package:dartz/dartz.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/category_model.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/data/repositories/search_repository.dart';
import 'package:mobx/mobx.dart';
part 'search_store.g.dart';

class SearchStore = _SearchStoreBase with _$SearchStore;

enum SearchMode { icons, categories }

abstract class _SearchStoreBase with Store {
  SearchRepository _repository;

  _SearchStoreBase() {
    _repository = sl<SearchRepository>();
    showAll();
  }

  @observable
  bool _loading = false;

  @observable
  List<UserModel> _icons = [];

  @observable
  List<CategoryModel> _categories = [];

  @observable
  SearchMode _searchMode = SearchMode.icons;

  @computed
  bool get isLoading => _loading;

  @computed
  SearchMode get getSearchMode => _searchMode;

  @computed
  List<UserModel> get getIcons => _icons;

  @computed
  List<CategoryModel> get getCategories => _categories ?? [];

  @action
  Future setSearchMode(SearchMode mode) async {
    _searchMode = mode;
  }

  @action
  Future<Either<ServerError, List<CategoryModel>>> searchCategories(
      String query) async {
    try {
      final categories = await _repository.searchCategories(query);

      return categories.fold(
        (error) => left(error),
        (categories) {
          _categories = categories;
          return right(categories);
        },
      );
    } on Exception catch (e) {
      return left(e);
    }
  }

  @action
  Future<Either<ServerError, List<UserModel>>> searchIcons(String query) async {
    try {
      final icons = await _repository.searchIcons(query);

      return icons.fold(
        (error) => left(error),
        (icons) {
          _icons = icons;
          return right(icons);
        },
      );
    } on Exception catch (e) {
      return left(e);
    }
  }

  @action
  void showAll() {
    searchCategories('');
    searchIcons('');
  }

  @action
  search(String query) {
    switch (_searchMode) {
      case SearchMode.icons:
        searchIcons(query);
        break;
      case SearchMode.categories:
        searchCategories(query);
        break;
    }
  }
}
