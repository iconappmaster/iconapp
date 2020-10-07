// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStoreBase, Store {
  Computed<bool> _$isNotificationComputed;

  @override
  bool get isNotification =>
      (_$isNotificationComputed ??= Computed<bool>(() => super.isNotification,
              name: '_UserStoreBase.isNotification'))
          .value;
  Computed<String> _$getSessionTokenComputed;

  @override
  String get getSessionToken => (_$getSessionTokenComputed ??= Computed<String>(
          () => super.getSessionToken,
          name: '_UserStoreBase.getSessionToken'))
      .value;
  Computed<UserModel> _$getUserComputed;

  @override
  UserModel get getUser =>
      (_$getUserComputed ??= Computed<UserModel>(() => super.getUser,
              name: '_UserStoreBase.getUser'))
          .value;
  Computed<dynamic> _$notificationStateComputed;

  @override
  dynamic get notificationState => (_$notificationStateComputed ??=
          Computed<dynamic>(() => super.notificationState,
              name: '_UserStoreBase.notificationState'))
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

  final _$_sessionTokenAtom = Atom(name: '_UserStoreBase._sessionToken');

  @override
  String get _sessionToken {
    _$_sessionTokenAtom.reportRead();
    return super._sessionToken;
  }

  @override
  set _sessionToken(String value) {
    _$_sessionTokenAtom.reportWrite(value, super._sessionToken, () {
      super._sessionToken = value;
    });
  }

  final _$_isNotificationAtom = Atom(name: '_UserStoreBase._isNotification');

  @override
  bool get _isNotification {
    _$_isNotificationAtom.reportRead();
    return super._isNotification;
  }

  @override
  set _isNotification(bool value) {
    _$_isNotificationAtom.reportWrite(value, super._isNotification, () {
      super._isNotification = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_UserStoreBase.init');

  @override
  Future<dynamic> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$saveAsyncAction = AsyncAction('_UserStoreBase.save');

  @override
  Future<bool> save(UserModel user) {
    return _$saveAsyncAction.run(() => super.save(user));
  }

  final _$saveSessionTokenAsyncAction =
      AsyncAction('_UserStoreBase.saveSessionToken');

  @override
  Future<bool> saveSessionToken(String sessionToken) {
    return _$saveSessionTokenAsyncAction
        .run(() => super.saveSessionToken(sessionToken));
  }

  final _$updateUserAsyncAction = AsyncAction('_UserStoreBase.updateUser');

  @override
  Future<bool> updateUser(UserModel user) {
    return _$updateUserAsyncAction.run(() => super.updateUser(user));
  }

  final _$setNotificationAsyncAction =
      AsyncAction('_UserStoreBase.setNotification');

  @override
  Future<dynamic> setNotification(bool value) {
    return _$setNotificationAsyncAction.run(() => super.setNotification(value));
  }

  final _$updatePushTokenAsyncAction =
      AsyncAction('_UserStoreBase.updatePushToken');

  @override
  Future<dynamic> updatePushToken(String pushToken) {
    return _$updatePushTokenAsyncAction
        .run(() => super.updatePushToken(pushToken));
  }

  final _$reportUserAsyncAction = AsyncAction('_UserStoreBase.reportUser');

  @override
  Future<dynamic> reportUser(UserModel user, String explanation) {
    return _$reportUserAsyncAction
        .run(() => super.reportUser(user, explanation));
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
isNotification: ${isNotification},
getSessionToken: ${getSessionToken},
getUser: ${getUser},
notificationState: ${notificationState}
    ''';
  }
}
