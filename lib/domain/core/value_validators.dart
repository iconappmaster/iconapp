import 'package:dartz/dartz.dart';

import 'failures.dart';

const minPhoneLength = 8;
const minCodeLength = 4;

Either<ValueFailure<String>, String> validateNumberLength(
    String number, int length) {
  if (number.length >= length) {
    return right(number);
  } else {
    return left(ValueFailure.shortNumber(failedValue: number));
  }
}
