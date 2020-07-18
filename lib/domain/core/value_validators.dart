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

const minAge = 10;

bool validateAge(int age) => age >= minAge;

bool validateName(String name) {
  final words = name.split(' ');
  return words.length > 1 && !words.any((word) => word.length == 0);
  // return (name.trim().contains(' ') && name.trim().length > 0);
}
