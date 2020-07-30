// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStoreBase, Store {
  Computed<String> _$getTokenComputed;

  @override
  String get getToken =>
      (_$getTokenComputed ??= Computed<String>(() => super.getToken,
              name: '_UserStoreBase.getToken'))
          .value;
  Computed<UserModel> _$getUserComputed;

  @override
  UserModel get getUser =>
      (_$getUserComputed ??= Computed<UserModel>(() => super.getUser,
              name: '_UserStoreBase.getUser'))
          .value;

  final _$_userModelAtom = Atom(name: '_UserStoreBase._userModel');

  @override
  UserModel get _userModel {
    _$_userModelAtom.reportRead();
    return super._userModel;
  }

  @override
  set _userModel(UserModel value) {
    _$_userModelAtom.reportWrite(value, super._userModel, () {
      super._userModel = value;
    });
  }

  final _$persistUserAsyncAction = AsyncAction('_UserStoreBase.persistUser');

  @override
  Future<bool> persistUser(UserModel user) {
    return _$persistUserAsyncAction.run(() => super.persistUser(user));
  }

  final _$updateUserAsyncAction = AsyncAction('_UserStoreBase.updateUser');

  @override
  Future<bool> updateUser(UserModel user) {
    return _$updateUserAsyncAction.run(() => super.updateUser(user));
  }

  final _$getPersistentUserAsyncAction =
      AsyncAction('_UserStoreBase.getPersistentUser');

  @override
  Future<UserModel> getPersistentUser() {
    return _$getPersistentUserAsyncAction.run(() => super.getPersistentUser());
  }

  final _$initAsyncAction = AsyncAction('_UserStoreBase.init');

  @override
  Future<dynamic> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$_UserStoreBaseActionController =
      ActionController(name: '_UserStoreBase');

  @override
  void setUser(UserModel user) {
    final _$actionInfo = _$_UserStoreBaseActionController.startAction(
        name: '_UserStoreBase.setUser');
    try {
      return super.setUser(user);
    } finally {
      _$_UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
getToken: ${getToken},
getUser: ${getUser}
    ''';
  }
}
