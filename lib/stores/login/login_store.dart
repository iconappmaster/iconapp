import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/repositories/login_repository.dart';
import 'package:iconapp/domain/auth/auth_failure.dart';
import 'package:mobx/mobx.dart';
import '../user/user_store.dart';
import 'login_state.dart';

part 'login_store.g.dart';

// CHANGE NAME TO - OnboardinPhoneStore
class LoginStore = _LoginStoreBase with _$LoginStore;

const defaultCountTimeSec = 17;

abstract class _LoginStoreBase with Store {
  LoginRepository _repository;
  UserStore _userStore;
  Timer _timer;

  _LoginStoreBase() {
    _repository = sl<LoginRepository>();
    _userStore = sl<UserStore>();
  }

  @observable
  int _currentCountDown = 0;

  @observable
  LoginState _state = LoginState.initial();

  @computed
  String get displayCountdown =>
      (defaultCountTimeSec - _currentCountDown).toString();

  @computed
  bool get counterReachedZero => _currentCountDown == 0;

  @computed
  bool get isPhoneMode => _state.phonePageState == PhoneOnboardingState.idle;

  @computed
  bool get isPinCodeMode => _state.phonePageState == PhoneOnboardingState.sent;

  @computed
  bool get numberValid => _state.prefix.length == 3 && _state.phone.length >= 7;

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
  void updatePhonePrefix(String prefix) {
    _state = _state.copyWith(prefix: prefix);
  }

  @action
  void updateCode(String code) {
    _state = _state.copyWith(code: code);
  }

  @action
  Future verifyPhone() async {
    startCountDown();

    _state = _state.copyWith(
      loading: true,
      phonePageState: PhoneOnboardingState.sent,
    );

    final failureOrSuccess = await _repository.verifyPhone(
      "+" + _state.countryCode + _state.prefix + _state.phone,
    );

    failureOrSuccess.fold(
      (failure) {
        _state = _state.copyWith(
            loading: false,
            phonePageState: PhoneOnboardingState.idle,
            errorMessage: failure.maybeWhen(
              serverError: () => 'תקלה בשרת',
              orElse: () => null,
            ));
      },
      (_) {
        /// Success
        _state = _state.copyWith(
          loading: false,
          phonePageState: PhoneOnboardingState.sent,
        );
      },
    );
  }

  @action
  Future<Either<AuthFailure, bool>> verifySms() async {
    _state = _state.copyWith(loading: true);

    final fullNumber = _state.prefix + _state.phone;
    final code = _state.code;

    try {
      final user = await _repository.verifyCode(fullNumber, code);
      final success = await _userStore.persistUser(user);
      _userStore.userModel = user;
      return right(success);
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
  Future sendAgain() async {
    _state = _state.copyWith(
      phonePageState: PhoneOnboardingState.idle,
      code: '',
    );
  }

  void startCountDown() {
    if (_timer == null) {
      _timer = Timer.periodic(
        Duration(seconds: 1),
        (time) {
          _currentCountDown = time.tick;
          if (time.tick == defaultCountTimeSec) {
            time.cancel();
          }
        },
      );
    }
  }

  void dispose() {
    _state = LoginState.initial();
    _currentCountDown = 0;
    _timer.cancel();
    _timer = null;
  }
}
