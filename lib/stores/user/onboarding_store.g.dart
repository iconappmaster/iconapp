// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OnboardingStore on _UserStoreBase, Store {
  final _$userModelAtom = Atom(name: '_OnboardingStoreBase.userModel');

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

  final _$uploadUserPhotoAsyncAction =
      AsyncAction('_OnboardingStoreBase.uploadUserPhoto');

  @override
  Future<String> uploadUserPhoto(File original, String path, String fileName) {
    return _$uploadUserPhotoAsyncAction
        .run(() => super.uploadUserPhoto(original, path, fileName));
  }

  final _$updateUserAsyncAction =
      AsyncAction('_OnboardingStoreBase.updateUser');

  @override
  Future<dynamic> updateUser(UserModel user) {
    return _$updateUserAsyncAction.run(() => super.updateUser(user));
  }

  final _$getCurrentUserAsyncAction =
      AsyncAction('_OnboardingStoreBase.getCurrentUser');

  @override
  Future<dynamic> getCurrentUser() {
    return _$getCurrentUserAsyncAction.run(() => super.getCurrentUser());
  }

  @override
  String toString() {
    return '''
userModel: ${userModel}
    ''';
  }
}
