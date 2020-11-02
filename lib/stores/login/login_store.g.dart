// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStoreBase, Store {
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
  Computed<bool> _$isPhoneModeComputed;

  @override
  bool get isPhoneMode =>
      (_$isPhoneModeComputed ??= Computed<bool>(() => super.isPhoneMode,
              name: '_LoginStoreBase.isPhoneMode'))
          .value;
  Computed<bool> _$isPinCodeModeComputed;

  @override
  bool get isPinCodeMode =>
      (_$isPinCodeModeComputed ??= Computed<bool>(() => super.isPinCodeMode,
              name: '_LoginStoreBase.isPinCodeMode'))
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

  final _$agreeTermsAtom = Atom(name: '_LoginStoreBase.agreeTerms');

  @override
  bool get agreeTerms {
    _$agreeTermsAtom.reportRead();
    return super.agreeTerms;
  }

  @override
  set agreeTerms(bool value) {
    _$agreeTermsAtom.reportWrite(value, super.agreeTerms, () {
      super.agreeTerms = value;
    });
  }

  final _$_stateAtom = Atom(name: '_LoginStoreBase._state');

  @override
  LoginState get _state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  set _state(LoginState value) {
    _$_stateAtom.reportWrite(value, super._state, () {
      super._state = value;
    });
  }

  final _$verifyPhoneAsyncAction = AsyncAction('_LoginStoreBase.verifyPhone');

  @override
  Future<dynamic> verifyPhone() {
    return _$verifyPhoneAsyncAction.run(() => super.verifyPhone());
  }

  final _$verifySmsAsyncAction = AsyncAction('_LoginStoreBase.verifySms');

  @override
  Future<Either<AuthFailure, AuthSuccess>> verifySms() {
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
  void updatePhone(String phone) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.updatePhone');
    try {
      return super.updatePhone(phone);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateCountryCode(String countryCode) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.updateCountryCode');
    try {
      return super.updateCountryCode(countryCode);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateCode(String code) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.updateCode');
    try {
      return super.updateCode(code);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateTerms(bool value) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.updateTerms');
    try {
      return super.updateTerms(value);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
agreeTerms: ${agreeTerms},
displayCountdown: ${displayCountdown},
counterReachedZero: ${counterReachedZero},
isPhoneMode: ${isPhoneMode},
isPinCodeMode: ${isPinCodeMode},
numberValid: ${numberValid},
getState: ${getState}
    ''';
  }
}
