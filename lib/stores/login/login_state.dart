import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iconapp/data/models/user_model.dart';
part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @required String prefix,
    @required String phone,
    @required String code,
    @required bool loading,
    @required String errorMessage,
    @required PhoneOnboardingState phonePageState,
    @required UserModel userModel,
  }) = _LoginState;

  factory LoginState.initial() => LoginState(
        prefix: '',
        phone: '',
        code: '',
        loading: false,
        errorMessage: '',
        phonePageState: PhoneOnboardingState.idle,
        userModel: UserModel(),
      );
}

/// [idle] is when the user didn't sent the number
/// [sent] is when the user already sent the number and waiting for SMS
enum PhoneOnboardingState { idle, sent }
