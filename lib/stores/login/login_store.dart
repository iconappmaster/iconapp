import 'dart:async';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/data/repositories/auth_repository.dart';
import 'package:iconapp/domain/auth/auth_failure.dart';
import 'package:mobx/mobx.dart';
import 'login_state.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

const defaultCountTimeSec = 17;

abstract class _LoginStoreBase with Store {
  AuthRepository _repository;
  Timer _timer;

  _LoginStoreBase() {
    _repository = sl<AuthRepository>();
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

  // 
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
      (success) => print('success'),
    );
  }

  @action
  Future verifySms() async {
    state = state.copyWith(loading: true);

    final handleFailure = (AuthFailure failure) {
      state = state.copyWith(
          errorMessage: failure.maybeWhen(
              wrongCode: () => 'wrong code', orElse: () => null));
    };

    final handleSuccess = (_) {};

    final fullNumber = state.prefix + state.phone;
    final code = state.code;

    final failureOrSuccess = await _repository.verifyCode(fullNumber, code);
    failureOrSuccess.fold(
      handleFailure,
      handleSuccess,
    );
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

 