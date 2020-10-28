// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_icon_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateIconStore on _CreateIconStoreBase, Store {
  Computed<List<UserModel>> _$getIconsComputed;

  @override
  List<UserModel> get getIcons =>
      (_$getIconsComputed ??= Computed<List<UserModel>>(() => super.getIcons,
              name: '_CreateIconStoreBase.getIcons'))
          .value;
  Computed<List<UserModel>> _$getSelectedIconsComputed;

  @override
  List<UserModel> get getSelectedIcons => (_$getSelectedIconsComputed ??=
          Computed<List<UserModel>>(() => super.getSelectedIcons,
              name: '_CreateIconStoreBase.getSelectedIcons'))
      .value;
  Computed<bool> _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_CreateIconStoreBase.isLoading'))
          .value;
  Computed<SearchMode> _$getSearchModeComputed;

  @override
  SearchMode get getSearchMode => (_$getSearchModeComputed ??=
          Computed<SearchMode>(() => super.getSearchMode,
              name: '_CreateIconStoreBase.getSearchMode'))
      .value;
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??= Computed<bool>(() => super.isValid,
          name: '_CreateIconStoreBase.isValid'))
      .value;
  Computed<int> _$countComputed;

  @override
  int get count => (_$countComputed ??=
          Computed<int>(() => super.count, name: '_CreateIconStoreBase.count'))
      .value;

  final _$_iconsAtom = Atom(name: '_CreateIconStoreBase._icons');

  @override
  ObservableList<UserModel> get _icons {
    _$_iconsAtom.reportRead();
    return super._icons;
  }

  @override
  set _icons(ObservableList<UserModel> value) {
    _$_iconsAtom.reportWrite(value, super._icons, () {
      super._icons = value;
    });
  }

  final _$_selectedAtom = Atom(name: '_CreateIconStoreBase._selected');

  @override
  ObservableList<UserModel> get _selected {
    _$_selectedAtom.reportRead();
    return super._selected;
  }

  @override
  set _selected(ObservableList<UserModel> value) {
    _$_selectedAtom.reportWrite(value, super._selected, () {
      super._selected = value;
    });
  }

  final _$_isLoadingAtom = Atom(name: '_CreateIconStoreBase._isLoading');

  @override
  bool get _isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_CreateIconStoreBase.init');

  @override
  Future<dynamic> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$searchAsyncAction = AsyncAction('_CreateIconStoreBase.search');

  @override
  Future<dynamic> search(String query) {
    return _$searchAsyncAction.run(() => super.search(query));
  }

  final _$updateSelectedAsyncAction =
      AsyncAction('_CreateIconStoreBase.updateSelected');

  @override
  Future<dynamic> updateSelected(UserModel icon) {
    return _$updateSelectedAsyncAction.run(() => super.updateSelected(icon));
  }

  final _$_CreateIconStoreBaseActionController =
      ActionController(name: '_CreateIconStoreBase');

  @override
  void clear() {
    final _$actionInfo = _$_CreateIconStoreBaseActionController.startAction(
        name: '_CreateIconStoreBase.clear');
    try {
      return super.clear();
    } finally {
      _$_CreateIconStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
getIcons: ${getIcons},
getSelectedIcons: ${getSelectedIcons},
isLoading: ${isLoading},
getSearchMode: ${getSearchMode},
isValid: ${isValid},
count: ${count}
    ''';
  }
}
