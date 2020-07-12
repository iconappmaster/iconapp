// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchStore on _SearchStoreBase, Store {
  Computed<List<UserModel>> _$getContactsComputed;

  @override
  List<UserModel> get getContacts => (_$getContactsComputed ??=
          Computed<List<UserModel>>(() => super.getContacts,
              name: '_SearchStoreBase.getContacts'))
      .value;

  final _$_contactsAtom = Atom(name: '_SearchStoreBase._contacts');

  @override
  List<UserModel> get _contacts {
    _$_contactsAtom.reportRead();
    return super._contacts;
  }

  @override
  set _contacts(List<UserModel> value) {
    _$_contactsAtom.reportWrite(value, super._contacts, () {
      super._contacts = value;
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

  final _$searchModeAtom = Atom(name: '_SearchStoreBase.searchMode');

  @override
  SearchMode get searchMode {
    _$searchModeAtom.reportRead();
    return super.searchMode;
  }

  @override
  set searchMode(SearchMode value) {
    _$searchModeAtom.reportWrite(value, super.searchMode, () {
      super.searchMode = value;
    });
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
searchMode: ${searchMode},
getContacts: ${getContacts}
    ''';
  }
}
