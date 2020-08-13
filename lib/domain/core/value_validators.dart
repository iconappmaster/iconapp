import 'package:dartz/dartz.dart';

import 'failures.dart';

const minPhoneLength = 8;
const minCodeLength = 4;
const minAge = 12;

Either<ValueFailure<String>, String> validateNumberLength(String number, int length) {
  if (number.length >= length) {
    return right(number);
  } else {
    return left(ValueFailure.shortNumber(failedValue: number));
  }
}

bool validateAge(int age) => age >= minAge;

bool validateName(String name) {
  final words = name.split(' ');
  return words.length > 1 && !words.any((word) => word.length == 0);
}