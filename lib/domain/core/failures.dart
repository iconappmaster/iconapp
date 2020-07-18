import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.shortNumber({
    @required T failedValue,
  }) = InvalidEmail<T>;

  const factory ValueFailure.tooYoung({
    @required T failedValue,
  }) = InvalidAge<T>;
  
  const factory ValueFailure.lastNameMissing({
    @required T failedValue,
  }) = LastNameMissing<T>;
}

