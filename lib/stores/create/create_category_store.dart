import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/category_model.dart';
import 'package:iconapp/stores/search/search_store.dart';
import 'package:mobx/mobx.dart';
import 'package:vibration/vibration.dart';

part 'create_category_store.g.dart';

class CreateCategoryStore = _CreateCategoryStoreBase with _$CreateCategoryStore;

abstract class _CreateCategoryStoreBase with Store {
  _CreateCategoryStoreBase() {
    _categories = sl<SearchStore>()?.getCategories ?? [];
  }

  @observable
  List<CategoryModel> _selected = [];

  @observable
  List<CategoryModel> _categories = [];

  @computed
  List<CategoryModel> get getCategories => _categories;

  @computed
  List<CategoryModel> get getSelectedCategories => _selected;

  @computed
  int get getItemCount => _categories.length;

  @action
  void addOrRemoveItem(CategoryModel category) {
    Vibration.vibrate();
    if (_selected.contains(category)) {
      _selected.remove(category);
    } else {
      _selected.add(category);
    }
  }
}
