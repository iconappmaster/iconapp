import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/data/repositories/login_repository.dart';
import 'package:iconapp/domain/auth/auth_failure.dart';
import 'package:mobx/mobx.dart';
import '../user/user_store.dart';
import 'login_state.dart';

part 'login_store.g.dart';

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
  LoginState state = LoginState.initial();

  @computed
  String get displayCountdown =>
      (defaultCountTimeSec - _currentCountDown).toString();

  @computed
  bool get counterReachedZero => _currentCountDown == 0;

  @computed
  UserModel get getUser => state.userModel;

  @computed
  bool get isIdle => state.phonePageState == PhoneOnboardingState.idle;

  @computed
  bool get numberValid => state.prefix.length == 3 && state.phone.length >= 7;

  @computed
  LoginState get getState => state;

  @action
  updatePhone(String phone) {
    state = state.copyWith(phone: phone);
  }

  @action
  updatePhonePrefix(String prefix) {
    state = state.copyWith(prefix: prefix);
  }

  @action
  updateCode(String code) {
    state = state.copyWith(code: code);
  }

  @action
  Future verifyPhone() async {
    startCountDown();

    state = state.copyWith(
      loading: true,
      phonePageState: PhoneOnboardingState.sent,
    );

    final failureOrSuccess = await _repository.verifyPhone(state.prefix + state.phone);
   
    failureOrSuccess.fold(
      (failure) {
        state = state.copyWith(
            loading: false,
            phonePageState: PhoneOnboardingState.idle,
            errorMessage: failure.maybeWhen(
              serverError: () => 'Server error',
              orElse: () => null,
            ));
      },
      (_) => print('success'),
    );
  }

  @action
  Future<Either<AuthFailure, bool>> verifySms() async {
    state = state.copyWith(loading: true);

    final fullNumber = state.prefix + state.phone;
    final code = state.code;

    try {
      final user = await _repository.verifyCode(fullNumber, code);
      final saved = await _userStore.persistUser(user);
      return right(saved);
    } on DioError catch (error) {
      if (error.response.data['error'] == "ERROR_WRONG_SMS") {
        return left(const AuthFailure.wrongCode());
      } else {
        return left(const AuthFailure.serverError());
      }
    } finally {
        state = state.copyWith(loading: false);
    }
  }

  @action
  Future sendAgain() async {
    state = state.copyWith(
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
    state = LoginState.initial();
    _currentCountDown = 0;
    _timer = null;
  }
}
