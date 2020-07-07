import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/repositories/auth_repository.dart';

import 'package:mobx/mobx.dart';
import 'package:iconapp/stores/auth/auth_state.dart';
part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  AuthRepository _repository;

  _AuthStoreBase() {
    _repository = sl<AuthRepository>();
  }

  @observable
  AuthState authState = AuthState.initial();

  @computed
  AuthState get state => authState;

  @action
  void checkCurrentAuthState() {
    final isSignedIn = _repository.isSignIn();
    if (isSignedIn) {
      authState = _repository.isOboarding()
          ? AuthState.authenticated()
          : AuthState.onboarding();
    } else {
      authState = AuthState.unauthenticated();
    }
  }
}
