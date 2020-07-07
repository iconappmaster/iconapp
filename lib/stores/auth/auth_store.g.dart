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

  final _$authStateAtom = Atom(name: '_AuthStoreBase.authState');

  @override
  AuthState get authState {
    _$authStateAtom.reportRead();
    return super.authState;
  }

  @override
  set authState(AuthState value) {
    _$authStateAtom.reportWrite(value, super.authState, () {
      super.authState = value;
    });
  }

  final _$_AuthStoreBaseActionController =
      ActionController(name: '_AuthStoreBase');

  @override
  void checkCurrentAuthState() {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.checkCurrentAuthState');
    try {
      return super.checkCurrentAuthState();
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
authState: ${authState},
state: ${state}
    ''';
  }
}
