import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iconapp/data/models/user_model.dart';

part 'onboarding_state.freezed.dart';


@freezed
abstract class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    @required bool loading,
    @required String errorMessage,
    @required UserModel userModel,
  }) = _OnboardingState;

  factory OnboardingState.initial() => OnboardingState(
        loading: false,
        errorMessage: '',
        userModel: UserModel(
          gender: UserGender.male
        ),
      );
}
