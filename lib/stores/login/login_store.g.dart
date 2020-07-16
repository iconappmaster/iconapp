// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStoreBase, Store {
  Computed<SexType> _$getSexTypeComputed;

  @override
  SexType get getSexType =>
      (_$getSexTypeComputed ??= Computed<SexType>(() => super.getSexType,
              name: '_LoginStoreBase.getSexType'))
          .value;
  Computed<String> _$displayCountdownComputed;

  @override
  String get displayCountdown => (_$displayCountdownComputed ??=
          Computed<String>(() => super.displayCountdown,
              name: '_LoginStoreBase.displayCountdown'))
      .value;
  Computed<bool> _$counterReachedZeroComputed;

  @override
  bool get counterReachedZero => (_$counterReachedZeroComputed ??=
          Computed<bool>(() => super.counterReachedZero,
              name: '_LoginStoreBase.counterReachedZero'))
      .value;
  Computed<UserModel> _$getUserComputed;

  @override
  UserModel get getUser =>
      (_$getUserComputed ??= Computed<UserModel>(() => super.getUser,
              name: '_LoginStoreBase.getUser'))
          .value;
  Computed<bool> _$isUserImageAvailableComputed;

  @override
  bool get isUserImageAvailable => (_$isUserImageAvailableComputed ??=
          Computed<bool>(() => super.isUserImageAvailable,
              name: '_LoginStoreBase.isUserImageAvailable'))
      .value;
  Computed<bool> _$isIdleComputed;

  @override
  bool get isIdle => (_$isIdleComputed ??=
          Computed<bool>(() => super.isIdle, name: '_LoginStoreBase.isIdle'))
      .value;
  Computed<bool> _$numberValidComputed;

  @override
  bool get numberValid =>
      (_$numberValidComputed ??= Computed<bool>(() => super.numberValid,
              name: '_LoginStoreBase.numberValid'))
          .value;
  Computed<LoginState> _$getStateComputed;

  @override
  LoginState get getState =>
      (_$getStateComputed ??= Computed<LoginState>(() => super.getState,
              name: '_LoginStoreBase.getState'))
          .value;

  final _$_currentCountDownAtom =
      Atom(name: '_LoginStoreBase._currentCountDown');

  @override
  int get _currentCountDown {
    _$_currentCountDownAtom.reportRead();
    return super._currentCountDown;
  }

  @override
  set _currentCountDown(int value) {
    _$_currentCountDownAtom.reportWrite(value, super._currentCountDown, () {
      super._currentCountDown = value;
    });
  }

  final _$selectedSexAtom = Atom(name: '_LoginStoreBase.selectedSex');

  @override
  SexType get selectedSex {
    _$selectedSexAtom.reportRead();
    return super.selectedSex;
  }

  @override
  set selectedSex(SexType value) {
    _$selectedSexAtom.reportWrite(value, super.selectedSex, () {
      super.selectedSex = value;
    });
  }

  final _$stateAtom = Atom(name: '_LoginStoreBase.state');

  @override
  LoginState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(LoginState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$showUserPhotoAsyncAction =
      AsyncAction('_LoginStoreBase.showUserPhoto');

  @override
  Future<dynamic> showUserPhoto(PickedFile file) {
    return _$showUserPhotoAsyncAction.run(() => super.showUserPhoto(file));
  }

  final _$uploadAndShowUserPhotoAsyncAction =
      AsyncAction('_LoginStoreBase.uploadAndShowUserPhoto');

  @override
  Future<dynamic> uploadAndShowUserPhoto(PickedFile file) {
    return _$uploadAndShowUserPhotoAsyncAction
        .run(() => super.uploadAndShowUserPhoto(file));
  }

  final _$verifyPhoneAsyncAction = AsyncAction('_LoginStoreBase.verifyPhone');

  @override
  Future<dynamic> verifyPhone() {
    return _$verifyPhoneAsyncAction.run(() => super.verifyPhone());
  }

  final _$verifySmsAsyncAction = AsyncAction('_LoginStoreBase.verifySms');

  @override
  Future<dynamic> verifySms() {
    return _$verifySmsAsyncAction.run(() => super.verifySms());
  }

  final _$sendAgainAsyncAction = AsyncAction('_LoginStoreBase.sendAgain');

  @override
  Future<dynamic> sendAgain() {
    return _$sendAgainAsyncAction.run(() => super.sendAgain());
  }

  final _$_LoginStoreBaseActionController =
      ActionController(name: '_LoginStoreBase');

  @override
  dynamic setSexType(SexType sexType) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.setSexType');
    try {
      return super.setSexType(sexType);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateUserName(String fullName) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.updateUserName');
    try {
      return super.updateUserName(fullName);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateUserAge(String age) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.updateUserAge');
    try {
      return super.updateUserAge(age);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updatePhone(String phone) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.updatePhone');
    try {
      return super.updatePhone(phone);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updatePhonePrefix(String prefix) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.updatePhonePrefix');
    try {
      return super.updatePhonePrefix(prefix);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateCode(String code) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.updateCode');
    try {
      return super.updateCode(code);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedSex: ${selectedSex},
state: ${state},
getSexType: ${getSexType},
displayCountdown: ${displayCountdown},
counterReachedZero: ${counterReachedZero},
getUser: ${getUser},
isUserImageAvailable: ${isUserImageAvailable},
isIdle: ${isIdle},
numberValid: ${numberValid},
getState: ${getState}
    ''';
  }
}
