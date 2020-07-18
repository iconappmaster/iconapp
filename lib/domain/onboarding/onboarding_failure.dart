import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_failure.freezed.dart';

@freezed
abstract class OnboardinFailure with _$OnboardinFailure {
  const factory OnboardinFailure.wrongName() = WrongName;
  const factory OnboardinFailure.wrongAge() = WrongAge;
}
