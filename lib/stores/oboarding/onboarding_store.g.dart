// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OnboardingStore on _OnboardingStoreBase, Store {
  Computed<OnboardingState> _$getStateComputed;

  @override
  OnboardingState get getState =>
      (_$getStateComputed ??= Computed<OnboardingState>(() => super.getState,
              name: '_OnboardingStoreBase.getState'))
          .value;
  Computed<String> _$getUserPhotoComputed;

  @override
  String get getUserPhoto =>
      (_$getUserPhotoComputed ??= Computed<String>(() => super.getUserPhoto,
              name: '_OnboardingStoreBase.getUserPhoto'))
          .value;
  Computed<bool> _$isUserImageAvailableComputed;

  @override
  bool get isUserImageAvailable => (_$isUserImageAvailableComputed ??=
          Computed<bool>(() => super.isUserImageAvailable,
              name: '_OnboardingStoreBase.isUserImageAvailable'))
      .value;

  final _$_stateAtom = Atom(name: '_OnboardingStoreBase._state');

  @override
  OnboardingState get _state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  set _state(OnboardingState value) {
    _$_stateAtom.reportWrite(value, super._state, () {
      super._state = value;
    });
  }

  final _$pickPhotoAsyncAction = AsyncAction('_OnboardingStoreBase.pickPhoto');

  @override
  Future<dynamic> pickPhoto([bool upload = false]) {
    return _$pickPhotoAsyncAction.run(() => super.pickPhoto(upload));
  }

  final _$createUserAsyncAction =
      AsyncAction('_OnboardingStoreBase.createUser');

  @override
  Future<dynamic> createUser() {
    return _$createUserAsyncAction.run(() => super.createUser());
  }

  final _$_OnboardingStoreBaseActionController =
      ActionController(name: '_OnboardingStoreBase');

  @override
  bool validateUserAge() {
    final _$actionInfo = _$_OnboardingStoreBaseActionController.startAction(
        name: '_OnboardingStoreBase.validateUserAge');
    try {
      return super.validateUserAge();
    } finally {
      _$_OnboardingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateUserName() {
    final _$actionInfo = _$_OnboardingStoreBaseActionController.startAction(
        name: '_OnboardingStoreBase.validateUserName');
    try {
      return super.validateUserName();
    } finally {
      _$_OnboardingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateUserGender(UserGender gender) {
    final _$actionInfo = _$_OnboardingStoreBaseActionController.startAction(
        name: '_OnboardingStoreBase.updateUserGender');
    try {
      return super.updateUserGender(gender);
    } finally {
      _$_OnboardingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateUserName(String fullName) {
    final _$actionInfo = _$_OnboardingStoreBaseActionController.startAction(
        name: '_OnboardingStoreBase.updateUserName');
    try {
      return super.updateUserName(fullName);
    } finally {
      _$_OnboardingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateUserAge(int age) {
    final _$actionInfo = _$_OnboardingStoreBaseActionController.startAction(
        name: '_OnboardingStoreBase.updateUserAge');
    try {
      return super.updateUserAge(age);
    } finally {
      _$_OnboardingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
getState: ${getState},
getUserPhoto: ${getUserPhoto},
isUserImageAvailable: ${isUserImageAvailable}
    ''';
  }
}
