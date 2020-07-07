// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStoreBase, Store {
  Computed<int> _$currentStepComputed;

  @override
  int get currentStep =>
      (_$currentStepComputed ??= Computed<int>(() => super.currentStep,
              name: '_LoginStoreBase.currentStep'))
          .value;
  Computed<LoginState> _$getStateComputed;

  @override
  LoginState get getState =>
      (_$getStateComputed ??= Computed<LoginState>(() => super.getState,
              name: '_LoginStoreBase.getState'))
          .value;

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

  final _$verifyPhoneAsyncAction = AsyncAction('_LoginStoreBase.verifyPhone');

  @override
  Future<dynamic> verifyPhone() {
    return _$verifyPhoneAsyncAction.run(() => super.verifyPhone());
  }

  final _$_LoginStoreBaseActionController =
      ActionController(name: '_LoginStoreBase');

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
state: ${state},
currentStep: ${currentStep},
getState: ${getState}
    ''';
  }
}
