// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStoreBase, Store {
  final _$isLoadingAtom = Atom(name: '_LoginStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$phoneCodeAtom = Atom(name: '_LoginStoreBase.phoneCode');

  @override
  String get phoneCode {
    _$phoneCodeAtom.reportRead();
    return super.phoneCode;
  }

  @override
  set phoneCode(String value) {
    _$phoneCodeAtom.reportWrite(value, super.phoneCode, () {
      super.phoneCode = value;
    });
  }

  final _$phoneAtom = Atom(name: '_LoginStoreBase.phone');

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  final _$smsCodeAtom = Atom(name: '_LoginStoreBase.smsCode');

  @override
  String get smsCode {
    _$smsCodeAtom.reportRead();
    return super.smsCode;
  }

  @override
  set smsCode(String value) {
    _$smsCodeAtom.reportWrite(value, super.smsCode, () {
      super.smsCode = value;
    });
  }

  final _$currentStepAtom = Atom(name: '_LoginStoreBase.currentStep');

  @override
  int get currentStep {
    _$currentStepAtom.reportRead();
    return super.currentStep;
  }

  @override
  set currentStep(int value) {
    _$currentStepAtom.reportWrite(value, super.currentStep, () {
      super.currentStep = value;
    });
  }

  final _$verifyPhoneAsyncAction = AsyncAction('_LoginStoreBase.verifyPhone');

  @override
  Future<dynamic> verifyPhone() {
    return _$verifyPhoneAsyncAction.run(() => super.verifyPhone());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
phoneCode: ${phoneCode},
phone: ${phone},
smsCode: ${smsCode},
currentStep: ${currentStep}
    ''';
  }
}
