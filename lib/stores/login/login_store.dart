import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/repositories/auth_repository.dart';
import 'package:iconapp/domain/auth/auth_failure.dart';
import 'package:mobx/mobx.dart';

import 'login_state.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  AuthRepository _repository;

  _LoginStoreBase() {
    _repository = sl<AuthRepository>();
  }

  @observable
  LoginState state = LoginState.initial();

  @computed
  int get currentStep => state.currentStep;

  @computed
  LoginState get getState => state;

  @action
  updatePhone(String phone) {
    state = state.copyWith(phone: phone);
  }

  @action
  updateCode(String code) {
    state = state.copyWith(code: code);
  }

  @action
  Future verifyPhone() async {
    state = state.copyWith(loading: true);

    final handleFailure = (AuthFailure failure) {
      state = state.copyWith(
          errorMessage: failure.maybeWhen(
              serverError: () => 'Server error',
              phoneAlreadyTaken: () => 'phone has been taken',
              orElse: () => null));
    };

    final handleSuccess = (_) {
      
    };

    final fullNumber = state.phonePrefix + state.phone;

    final failureOrSuccess = await _repository.verifyPhone(fullNumber);
    failureOrSuccess.fold(
      handleFailure,
      handleSuccess,
    );
  }

  Future verifySms() async {
    state = state.copyWith(loading: true);

    final handleFailure = (AuthFailure failure) {
      state = state.copyWith(
          errorMessage: failure.maybeWhen(
              wrongCode: () => 'wrong code', orElse: () => null));
    };

    final handleSuccess = (_) {
      var currentStep = state.currentStep;
      state = state.copyWith(currentStep: currentStep += 1);
    };

    final fullNumber = state.phonePrefix + state.phone;
    final code = state.code;

    final failureOrSuccess = await _repository.verifyCode(fullNumber, code);
    failureOrSuccess.fold(
      handleFailure,
      handleSuccess,
    );
  }
}