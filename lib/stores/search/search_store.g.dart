// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchStore on _SearchStoreBase, Store {
  Computed<SearchMode> _$getSearchModeComputed;

  @override
  SearchMode get getSearchMode => (_$getSearchModeComputed ??=
          Computed<SearchMode>(() => super.getSearchMode,
              name: '_SearchStoreBase.getSearchMode'))
      .value;
  Computed<List<UserModel>> _$getIconsSearchResultsComputed;

  @override
  List<UserModel> get getIconsSearchResults =>
      (_$getIconsSearchResultsComputed ??= Computed<List<UserModel>>(
              () => super.getIconsSearchResults,
              name: '_SearchStoreBase.getIconsSearchResults'))
          .value;
  Computed<List<CategoryModel>> _$getCategoriesSearchResultsComputed;

  @override
  List<CategoryModel> get getCategoriesSearchResults =>
      (_$getCategoriesSearchResultsComputed ??= Computed<List<CategoryModel>>(
              () => super.getCategoriesSearchResults,
              name: '_SearchStoreBase.getCategoriesSearchResults'))
          .value;

  final _$_iconsAtom = Atom(name: '_SearchStoreBase._icons');

  @override
  List<UserModel> get _icons {
    _$_iconsAtom.reportRead();
    return super._icons;
  }

  @override
  set _icons(List<UserModel> value) {
    _$_iconsAtom.reportWrite(value, super._icons, () {
      super._icons = value;
    });
  }

  final _$_categoriesAtom = Atom(name: '_SearchStoreBase._categories');

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

  final _$_searchModeAtom = Atom(name: '_SearchStoreBase._searchMode');

  @override
  SearchMode get _searchMode {
    _$_searchModeAtom.reportRead();
    return super._searchMode;
  }

  @override
  set _searchMode(SearchMode value) {
    _$_searchModeAtom.reportWrite(value, super._searchMode, () {
      super._searchMode = value;
    });
  }

  final _$setSearchModeAsyncAction =
      AsyncAction('_SearchStoreBase.setSearchMode');

  @override
  Future<dynamic> setSearchMode(SearchMode mode) {
    return _$setSearchModeAsyncAction.run(() => super.setSearchMode(mode));
  }

  final _$searchContactsAsyncAction =
      AsyncAction('_SearchStoreBase.searchContacts');

  @override
  Future<dynamic> searchContacts(String query) {
    return _$searchContactsAsyncAction.run(() => super.searchContacts(query));
  }

  final _$searchCategoriesAsyncAction =
      AsyncAction('_SearchStoreBase.searchCategories');

  @override
  Future<dynamic> searchCategories(String query) {
    return _$searchCategoriesAsyncAction
        .run(() => super.searchCategories(query));
  }

  @override
  String toString() {
    return '''
getSearchMode: ${getSearchMode},
getIconsSearchResults: ${getIconsSearchResults},
getCategoriesSearchResults: ${getCategoriesSearchResults}
    ''';
  }
}
