import 'package:mobx/mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/repositories/auth_repository.dart';
import 'package:iconapp/stores/auth/auth_state.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  AuthRepository _repository;

  _AuthStoreBase() {
    _repository = sl<AuthRepository>();
  }

  @observable
  AuthState _authState = AuthState.initial();

  @computed
  AuthState get state => _authState;

  @action
  Future setSignedIn() async {
    await _repository.setSignIn();
    _authState = AuthState.authenticated();
  }

  @action
  void checkCurrentAuthState() {
    final isSignedIn = _repository.isSignIn();

    _authState =
        isSignedIn ? AuthState.authenticated() : AuthState.unauthenticated();
  }
}
