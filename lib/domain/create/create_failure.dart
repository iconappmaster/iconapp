import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_failure.freezed.dart';

@freezed
abstract class CreateFailure with _$CreateFailure {
  const factory CreateFailure.wrongName() = NameTaken;
  const factory CreateFailure.generalError() = GeneralError;
  const factory CreateFailure.notAnIcon() = NotAnIcon;
}
