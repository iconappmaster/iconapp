// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchStore on _SearchStoreBase, Store {
  Computed<bool> _$isEmptyComputed;

  @override
  bool get isEmpty => (_$isEmptyComputed ??=
          Computed<bool>(() => super.isEmpty, name: '_SearchStoreBase.isEmpty'))
      .value;
  Computed<bool> _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_SearchStoreBase.isLoading'))
          .value;
  Computed<SearchMode> _$getSearchModeComputed;

  @override
  SearchMode get getSearchMode => (_$getSearchModeComputed ??=
          Computed<SearchMode>(() => super.getSearchMode,
              name: '_SearchStoreBase.getSearchMode'))
      .value;
  Computed<List<UserModel>> _$getIconsComputed;

  @override
  List<UserModel> get getIcons =>
      (_$getIconsComputed ??= Computed<List<UserModel>>(() => super.getIcons,
              name: '_SearchStoreBase.getIcons'))
          .value;
  Computed<List<Conversation>> _$getCategoriesComputed;

  @override
  List<Conversation> get getCategories => (_$getCategoriesComputed ??=
          Computed<List<Conversation>>(() => super.getCategories,
              name: '_SearchStoreBase.getCategories'))
      .value;

  final _$_loadingAtom = Atom(name: '_SearchStoreBase._loading');

  @override
  bool get _loading {
    _$_loadingAtom.reportRead();
    return super._loading;
  }

  @override
  set _loading(bool value) {
    _$_loadingAtom.reportWrite(value, super._loading, () {
      super._loading = value;
    });
  }

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
  List<Conversation> get _categories {
    _$_categoriesAtom.reportRead();
    return super._categories;
  }

  @override
  set _categories(List<Conversation> value) {
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

  final _$searchCategoriesAsyncAction =
      AsyncAction('_SearchStoreBase.searchCategories');

  @override
  Future<Either<ServerError, List<Conversation>>> searchCategories(
      String query) {
    return _$searchCategoriesAsyncAction
        .run(() => super.searchCategories(query));
  }

  final _$searchIconsAsyncAction = AsyncAction('_SearchStoreBase.searchIcons');

  @override
  Future<Either<ServerError, List<UserModel>>> searchIcons(String query) {
    return _$searchIconsAsyncAction.run(() => super.searchIcons(query));
  }

  final _$searchAsyncAction = AsyncAction('_SearchStoreBase.search');

  @override
  Future<dynamic> search(String query) {
    return _$searchAsyncAction.run(() => super.search(query));
  }

  final _$_SearchStoreBaseActionController =
      ActionController(name: '_SearchStoreBase');

  @override
  void showAll() {
    final _$actionInfo = _$_SearchStoreBaseActionController.startAction(
        name: '_SearchStoreBase.showAll');
    try {
      return super.showAll();
    } finally {
      _$_SearchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isEmpty: ${isEmpty},
isLoading: ${isLoading},
getSearchMode: ${getSearchMode},
getIcons: ${getIcons},
getCategories: ${getCategories}
    ''';
  }
}
