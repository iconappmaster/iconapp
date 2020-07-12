import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/category_model.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/data/repositories/search_repository.dart';
import 'package:mobx/mobx.dart';
part 'search_store.g.dart';

class SearchStore = _SearchStoreBase with _$SearchStore;

enum SearchMode { contacts, categories }

abstract class _SearchStoreBase with Store {
  SearchRepository _repository;

  _SearchStoreBase() {
    _repository = sl<SearchRepository>();
  }

  @observable
  List<UserModel> _contacts = [];

  @observable
  List<CategoryModel> _categories = [];

  @observable
  SearchMode searchMode = SearchMode.contacts;

  @computed
  List<UserModel> get getContacts => _contacts;

  @action
  Future searchContacts(String query) async {
    final contacts = await _repository.searchContacts(query);
    contacts.fold(
      (error) => print(error),
      (contacts) => _contacts = contacts,
    );
  }

  @action
  Future searchCategories(String query) async {
    final categories = await _repository.searchCategories(query);
    categories.fold(
      (error) => print(error),
      (categories) => _categories = categories,
    );
  }
}
