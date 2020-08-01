// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_category_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateCategoryStore on _CreateCategoryStoreBase, Store {
  Computed<List<CategoryModel>> _$getCategoriesComputed;

  @override
  List<CategoryModel> get getCategories => (_$getCategoriesComputed ??=
          Computed<List<CategoryModel>>(() => super.getCategories,
              name: '_CreateCategoryStoreBase.getCategories'))
      .value;
  Computed<List<CategoryModel>> _$getSelectedCategoriesComputed;

  @override
  List<CategoryModel> get getSelectedCategories =>
      (_$getSelectedCategoriesComputed ??= Computed<List<CategoryModel>>(
              () => super.getSelectedCategories,
              name: '_CreateCategoryStoreBase.getSelectedCategories'))
          .value;
  Computed<int> _$getItemCountComputed;

  @override
  int get getItemCount =>
      (_$getItemCountComputed ??= Computed<int>(() => super.getItemCount,
              name: '_CreateCategoryStoreBase.getItemCount'))
          .value;

  final _$_selectedAtom = Atom(name: '_CreateCategoryStoreBase._selected');

  @override
  List<CategoryModel> get _selected {
    _$_selectedAtom.reportRead();
    return super._selected;
  }

  @override
  set _selected(List<CategoryModel> value) {
    _$_selectedAtom.reportWrite(value, super._selected, () {
      super._selected = value;
    });
  }

  final _$_categoriesAtom = Atom(name: '_CreateCategoryStoreBase._categories');

  @override
  List<CategoryModel> get _categories {
    _$_categoriesAtom.reportRead();
    return super._categories;
  }

  @override
  set _categories(List<CategoryModel> value) {
    _$_categoriesAtom.reportWrite(value, super._categories, () {
      super._categories = value;
    });
  }

  final _$_CreateCategoryStoreBaseActionController =
      ActionController(name: '_CreateCategoryStoreBase');

  @override
  void addOrRemoveItem(CategoryModel category) {
    final _$actionInfo = _$_CreateCategoryStoreBaseActionController.startAction(
        name: '_CreateCategoryStoreBase.addOrRemoveItem');
    try {
      return super.addOrRemoveItem(category);
    } finally {
      _$_CreateCategoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
getCategories: ${getCategories},
getSelectedCategories: ${getSelectedCategories},
getItemCount: ${getItemCount}
    ''';
  }
}
