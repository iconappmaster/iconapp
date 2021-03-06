import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:iconapp/core/firebase/crashlytics.dart';
import 'package:iconapp/data/sources/local/shared_preferences.dart';
import 'package:iconapp/domain/core/errors.dart';
import 'package:iconapp/stores/analytics/analytics_consts.dart';
import 'package:mobx/mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/repositories/auth_repository.dart';
import 'package:iconapp/stores/auth/auth_state.dart';

import '../analytics/analytics_firebase.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  AuthRepository _repository;
  SharedPreferencesService _sp;

  _AuthStoreBase() {
    _repository = sl<AuthRepository>();
    _sp = sl<SharedPreferencesService>();
  }

  @observable
  AuthState _authState = AuthState.initial();

  @computed
  AuthState get state => _authState;

  @computed
  bool get isSignedIn => _repository.isSignIn();

  @action
  Future setSignedIn() async {
    await _repository.setSignIn();
    _authState = AuthState.authenticated();
  }

  @action
  void validateAuthState() {
    final isSignedIn = _repository.isSignIn();
    _authState =
        isSignedIn ? AuthState.authenticated() : AuthState.unauthenticated();
  }

  @action
  Future logout(bool updateBackend) async {
    try {
      if (updateBackend) await _repository.logout();
      await _sp.clear();
      _authState = AuthState.unauthenticated();
      analytics.sendAnalyticsEvent(LOGGED_OUT, {});
      DefaultCacheManager().emptyCache();
    } on ServerError catch (e) {
      Crash.report(e.message);
    }
  }

  @action
  void setAuthState(AuthState state) {
    _authState = state;
  }
}
