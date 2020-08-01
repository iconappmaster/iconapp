import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/category_model.dart';
import 'package:iconapp/stores/search/search_store.dart';
import 'package:mobx/mobx.dart';
import 'package:vibration/vibration.dart';

part 'create_category_store.g.dart';

class CreateCategoryStore = _CreateCategoryStoreBase with _$CreateCategoryStore;

abstract class _CreateCategoryStoreBase with Store {
  _CreateCategoryStoreBase() {
    _init();
  }

  @observable
  ObservableList<CategoryModel> _categories = ObservableList.of([]);

  @observable
  ObservableList<CategoryModel> _selected = ObservableList.of([]);

  @computed
  List<CategoryModel> get getCategories => _categories;

  @computed
  List<CategoryModel> get getSelectedCategories => _selected;

  @computed
  bool get isValid => getSelectedCategories.length > 0;

  @computed
  int get count => _categories.length;

  @action
  _init() async {
    final categories = await sl<SearchStore>()?.searchCategories('');
    final result = categories.getOrElse(() => []);
    _categories.addAll(result);
  }

  @action
  Future updateSelected(CategoryModel category) async {
    await Vibration.vibrate();
    
    
    _selected.contains(category)
        ? _selected.remove(category)
        : _selected.add(category);
    print('categories ${_selected.length}');
  }
}
