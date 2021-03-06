import 'package:flutter/services.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/stores/search/search_store.dart';
import 'package:mobx/mobx.dart';

part 'create_category_store.g.dart';

class CreateCategoryStore = _CreateCategoryStoreBase with _$CreateCategoryStore;

abstract class _CreateCategoryStoreBase with Store {
  _CreateCategoryStoreBase() {
    _init();
  }

  @observable
  ObservableList<Conversation> _categories = ObservableList.of([]);

  @observable
  Conversation _selectedCategory;

  @computed
  List<Conversation> get getCategories => _categories;

  @computed
  Conversation get getSelectedCategory => _selectedCategory;

  @computed
  bool get isValid => _selectedCategory != null;

  @computed
  int get count => _categories.length;

  @action
  _init() async {
    final categories = await sl<SearchStore>()?.searchCategories('');
    final result = categories.getOrElse(() => []);
    if (_categories.isNotEmpty) _categories.clear();
    _categories.addAll(result);
  }

  @action
  Future updateSelected(Conversation category) async {
     HapticFeedback.lightImpact();
    _selectedCategory = category;
  }

  @action
  void clear() {
    _selectedCategory = null;
  }
}
