import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/notifications/fcm.dart';
import 'package:iconapp/data/repositories/login_repository.dart';
import 'package:iconapp/domain/auth/auth_failure.dart';
import 'package:iconapp/domain/auth/auth_success.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:mobx/mobx.dart';
import '../analytics/analytics_firebase.dart';
import '../user/user_store.dart';
import 'login_state.dart';
import 'package:easy_localization/easy_localization.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

const defaultCountTimeSec = 17;

abstract class _LoginStoreBase with Store {
  LoginRepository _repository;
  UserStore _store;

  _LoginStoreBase() {
    _repository = sl<LoginRepository>();
    _store = sl<UserStore>();
  }

  @observable
  bool _agreeTerms = false;

  @computed
  bool get agreeterms => _agreeTerms;

  @observable
  LoginState _state = LoginState.initial();

  @computed
  bool get isPhoneMode => _state.phonePageState == PhoneOnboardingState.idle;

  @computed
  bool get isPinCodeMode => _state.phonePageState == PhoneOnboardingState.sent;

  @computed
  bool get numberValid {
    if (_state.countryCode == '+972') {
      return _state.phone.length >= 10;
    } else {
      return _state.phone.length >= 7 && _state.phone.length <= 15;
    }
  }

  @computed
  LoginState get getState => _state;

  @action
  void updatePhone(String phone) {
    _state = _state.copyWith(phone: phone);
  }

  @action
  void updateCountryCode(String countryCode) {
    _state = _state.copyWith(countryCode: countryCode);
  }

  @action
  void updateCode(String code) {
    _state = _state.copyWith(code: code);
  }

  @action
  Future verifyPhone() async {
    _state = _state.copyWith(
      loading: true,
      phonePageState: PhoneOnboardingState.sent,
    );

    final failureOrSuccess = await _repository.verifyPhone(_state.countryCode + _state.phone);

    failureOrSuccess.fold(
      (failure) {
        _state = _state.copyWith(
            loading: false,
            phonePageState: PhoneOnboardingState.idle,
            errorMessage: failure.maybeWhen(
              serverError: () => LocaleKeys.general_server_error.tr(),
              orElse: () => null,
            ));
      },
      (_) {
        _state = _state.copyWith(loading: false, phonePageState: PhoneOnboardingState.sent);
      },
    );
  }

  @action
  Future<Either<AuthFailure, AuthSuccess>> verifySms() async {
    _state = _state.copyWith(loading: true);
    try {
      final user = await _repository.verifyCode(_state.countryCode + _state.phone, _state.code);

      _store
        ..save(user)
        ..saveSessionToken(user.sessionToken)
        ..setUser(user);

      messaging.getToken().then((token) => _store.updatePushToken(token));

      analytics.userFinishedOnboarind(user);

      return right(user.didCompleteRegistration ? AuthSuccess.navigateHome() : AuthSuccess.navigateProfile());
    } on DioError catch (error) {
      if (error.response.data['error'] == "ERROR_WRONG_SMS") {
        return left(const AuthFailure.wrongCode());
      } else {
        return left(const AuthFailure.serverError());
      }
    } finally {
      _state = _state.copyWith(loading: false);
    }
  }

  @action
  void updateTerms(bool value) {
    _agreeTerms = value;
  }

  @action
  Future sendAgain() async {
    _state = _state.copyWith(
      phonePageState: PhoneOnboardingState.idle,
      code: '',
    );
  }

  // void startCountDown() {
  //   if (_timer == null) {
  //     _timer = Timer.periodic(
  //       Duration(seconds: 1),
  //       (time) {
  //         _currentCountDown = time.tick;
  //         if (time.tick == defaultCountTimeSec) {
  //           time.cancel();
  //         }
  //       },
  //     );
  //   }
  // }

  void dispose() {
    _state = LoginState.initial();
    // _currentCountDown = 0;
    // _timer.cancel();
    // _timer = null;
  }
}
