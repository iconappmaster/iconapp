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

  final _$userModelAtom = Atom(name: '_UserStoreBase.userModel');

  @override
  UserModel get userModel {
    _$userModelAtom.reportRead();
    return super.userModel;
  }

  @override
  set userModel(UserModel value) {
    _$userModelAtom.reportWrite(value, super.userModel, () {
      super.userModel = value;
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

  final _$getCurrentUserAsyncAction =
      AsyncAction('_UserStoreBase.getCurrentUser');

  @override
  Future<dynamic> getCurrentUser() {
    return _$getCurrentUserAsyncAction.run(() => super.getCurrentUser());
  }

  @override
  String toString() {
    return '''
userModel: ${userModel},
getToken: ${getToken}
    ''';
  }
}
