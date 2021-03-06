// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStoreBase, Store {
  Computed<AuthState> _$stateComputed;

  @override
  AuthState get state => (_$stateComputed ??=
          Computed<AuthState>(() => super.state, name: '_AuthStoreBase.state'))
      .value;
  Computed<bool> _$isSignedInComputed;

  @override
  bool get isSignedIn =>
      (_$isSignedInComputed ??= Computed<bool>(() => super.isSignedIn,
              name: '_AuthStoreBase.isSignedIn'))
          .value;

  final _$_authStateAtom = Atom(name: '_AuthStoreBase._authState');

  @override
  AuthState get _authState {
    _$_authStateAtom.reportRead();
    return super._authState;
  }

  @override
  set _authState(AuthState value) {
    _$_authStateAtom.reportWrite(value, super._authState, () {
      super._authState = value;
    });
  }

  final _$setSignedInAsyncAction = AsyncAction('_AuthStoreBase.setSignedIn');

  @override
  Future<dynamic> setSignedIn() {
    return _$setSignedInAsyncAction.run(() => super.setSignedIn());
  }

  final _$logoutAsyncAction = AsyncAction('_AuthStoreBase.logout');

  @override
  Future<dynamic> logout(bool updateBackend) {
    return _$logoutAsyncAction.run(() => super.logout(updateBackend));
  }

  final _$_AuthStoreBaseActionController =
      ActionController(name: '_AuthStoreBase');

  @override
  void validateAuthState() {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.validateAuthState');
    try {
      return super.validateAuthState();
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAuthState(AuthState state) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setAuthState');
    try {
      return super.setAuthState(state);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
isSignedIn: ${isSignedIn}
    ''';
  }
}
