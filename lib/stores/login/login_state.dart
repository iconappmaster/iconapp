import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @required String phone,
    @required String phonePrefix,
    @required String code,
    @required bool loading,
    @required int currentStep,
    @required String errorMessage,
  }) = _LoginState;

  factory LoginState.initial() => LoginState(
      phone: '',
      code: '',
      phonePrefix: '+927',
      loading: false,
      currentStep: 0,
      errorMessage: '');
}
