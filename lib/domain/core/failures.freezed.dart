// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ValueFailureTearOff {
  const _$ValueFailureTearOff();

// ignore: unused_element
  InvalidEmail<T> shortNumber<T>({@required T failedValue}) {
    return InvalidEmail<T>(
      failedValue: failedValue,
    );
  }

// ignore: unused_element
  InvalidAge<T> tooYoung<T>({@required T failedValue}) {
    return InvalidAge<T>(
      failedValue: failedValue,
    );
  }

// ignore: unused_element
  LastNameMissing<T> lastNameMissing<T>({@required T failedValue}) {
    return LastNameMissing<T>(
      failedValue: failedValue,
    );
  }
}

// ignore: unused_element
const $ValueFailure = _$ValueFailureTearOff();

mixin _$ValueFailure<T> {
  T get failedValue;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result shortNumber(T failedValue),
    @required Result tooYoung(T failedValue),
    @required Result lastNameMissing(T failedValue),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result shortNumber(T failedValue),
    Result tooYoung(T failedValue),
    Result lastNameMissing(T failedValue),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result shortNumber(InvalidEmail<T> value),
    @required Result tooYoung(InvalidAge<T> value),
    @required Result lastNameMissing(LastNameMissing<T> value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result shortNumber(InvalidEmail<T> value),
    Result tooYoung(InvalidAge<T> value),
    Result lastNameMissing(LastNameMissing<T> value),
    @required Result orElse(),
  });

  $ValueFailureCopyWith<T, ValueFailure<T>> get copyWith;
}

abstract class $ValueFailureCopyWith<T, $Res> {
  factory $ValueFailureCopyWith(
          ValueFailure<T> value, $Res Function(ValueFailure<T>) then) =
      _$ValueFailureCopyWithImpl<T, $Res>;
  $Res call({T failedValue});
}

class _$ValueFailureCopyWithImpl<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  _$ValueFailureCopyWithImpl(this._value, this._then);

  final ValueFailure<T> _value;
  // ignore: unused_field
  final $Res Function(ValueFailure<T>) _then;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(_value.copyWith(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as T,
    ));
  }
}

abstract class $InvalidEmailCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $InvalidEmailCopyWith(
          InvalidEmail<T> value, $Res Function(InvalidEmail<T>) then) =
      _$InvalidEmailCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

class _$InvalidEmailCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $InvalidEmailCopyWith<T, $Res> {
  _$InvalidEmailCopyWithImpl(
      InvalidEmail<T> _value, $Res Function(InvalidEmail<T>) _then)
      : super(_value, (v) => _then(v as InvalidEmail<T>));

  @override
  InvalidEmail<T> get _value => super._value as InvalidEmail<T>;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(InvalidEmail<T>(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as T,
    ));
  }
}

class _$InvalidEmail<T> implements InvalidEmail<T> {
  const _$InvalidEmail({@required this.failedValue})
      : assert(failedValue != null);

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.shortNumber(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InvalidEmail<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @override
  $InvalidEmailCopyWith<T, InvalidEmail<T>> get copyWith =>
      _$InvalidEmailCopyWithImpl<T, InvalidEmail<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result shortNumber(T failedValue),
    @required Result tooYoung(T failedValue),
    @required Result lastNameMissing(T failedValue),
  }) {
    assert(shortNumber != null);
    assert(tooYoung != null);
    assert(lastNameMissing != null);
    return shortNumber(failedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result shortNumber(T failedValue),
    Result tooYoung(T failedValue),
    Result lastNameMissing(T failedValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (shortNumber != null) {
      return shortNumber(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result shortNumber(InvalidEmail<T> value),
    @required Result tooYoung(InvalidAge<T> value),
    @required Result lastNameMissing(LastNameMissing<T> value),
  }) {
    assert(shortNumber != null);
    assert(tooYoung != null);
    assert(lastNameMissing != null);
    return shortNumber(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result shortNumber(InvalidEmail<T> value),
    Result tooYoung(InvalidAge<T> value),
    Result lastNameMissing(LastNameMissing<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (shortNumber != null) {
      return shortNumber(this);
    }
    return orElse();
  }
}

abstract class InvalidEmail<T> implements ValueFailure<T> {
  const factory InvalidEmail({@required T failedValue}) = _$InvalidEmail<T>;

  @override
  T get failedValue;
  @override
  $InvalidEmailCopyWith<T, InvalidEmail<T>> get copyWith;
}

abstract class $InvalidAgeCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $InvalidAgeCopyWith(
          InvalidAge<T> value, $Res Function(InvalidAge<T>) then) =
      _$InvalidAgeCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

class _$InvalidAgeCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $InvalidAgeCopyWith<T, $Res> {
  _$InvalidAgeCopyWithImpl(
      InvalidAge<T> _value, $Res Function(InvalidAge<T>) _then)
      : super(_value, (v) => _then(v as InvalidAge<T>));

  @override
  InvalidAge<T> get _value => super._value as InvalidAge<T>;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(InvalidAge<T>(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as T,
    ));
  }
}

class _$InvalidAge<T> implements InvalidAge<T> {
  const _$InvalidAge({@required this.failedValue})
      : assert(failedValue != null);

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.tooYoung(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InvalidAge<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @override
  $InvalidAgeCopyWith<T, InvalidAge<T>> get copyWith =>
      _$InvalidAgeCopyWithImpl<T, InvalidAge<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result shortNumber(T failedValue),
    @required Result tooYoung(T failedValue),
    @required Result lastNameMissing(T failedValue),
  }) {
    assert(shortNumber != null);
    assert(tooYoung != null);
    assert(lastNameMissing != null);
    return tooYoung(failedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result shortNumber(T failedValue),
    Result tooYoung(T failedValue),
    Result lastNameMissing(T failedValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (tooYoung != null) {
      return tooYoung(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result shortNumber(InvalidEmail<T> value),
    @required Result tooYoung(InvalidAge<T> value),
    @required Result lastNameMissing(LastNameMissing<T> value),
  }) {
    assert(shortNumber != null);
    assert(tooYoung != null);
    assert(lastNameMissing != null);
    return tooYoung(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result shortNumber(InvalidEmail<T> value),
    Result tooYoung(InvalidAge<T> value),
    Result lastNameMissing(LastNameMissing<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (tooYoung != null) {
      return tooYoung(this);
    }
    return orElse();
  }
}

abstract class InvalidAge<T> implements ValueFailure<T> {
  const factory InvalidAge({@required T failedValue}) = _$InvalidAge<T>;

  @override
  T get failedValue;
  @override
  $InvalidAgeCopyWith<T, InvalidAge<T>> get copyWith;
}

abstract class $LastNameMissingCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $LastNameMissingCopyWith(
          LastNameMissing<T> value, $Res Function(LastNameMissing<T>) then) =
      _$LastNameMissingCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

class _$LastNameMissingCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $LastNameMissingCopyWith<T, $Res> {
  _$LastNameMissingCopyWithImpl(
      LastNameMissing<T> _value, $Res Function(LastNameMissing<T>) _then)
      : super(_value, (v) => _then(v as LastNameMissing<T>));

  @override
  LastNameMissing<T> get _value => super._value as LastNameMissing<T>;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(LastNameMissing<T>(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as T,
    ));
  }
}

class _$LastNameMissing<T> implements LastNameMissing<T> {
  const _$LastNameMissing({@required this.failedValue})
      : assert(failedValue != null);

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.lastNameMissing(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LastNameMissing<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @override
  $LastNameMissingCopyWith<T, LastNameMissing<T>> get copyWith =>
      _$LastNameMissingCopyWithImpl<T, LastNameMissing<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result shortNumber(T failedValue),
    @required Result tooYoung(T failedValue),
    @required Result lastNameMissing(T failedValue),
  }) {
    assert(shortNumber != null);
    assert(tooYoung != null);
    assert(lastNameMissing != null);
    return lastNameMissing(failedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result shortNumber(T failedValue),
    Result tooYoung(T failedValue),
    Result lastNameMissing(T failedValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (lastNameMissing != null) {
      return lastNameMissing(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result shortNumber(InvalidEmail<T> value),
    @required Result tooYoung(InvalidAge<T> value),
    @required Result lastNameMissing(LastNameMissing<T> value),
  }) {
    assert(shortNumber != null);
    assert(tooYoung != null);
    assert(lastNameMissing != null);
    return lastNameMissing(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result shortNumber(InvalidEmail<T> value),
    Result tooYoung(InvalidAge<T> value),
    Result lastNameMissing(LastNameMissing<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (lastNameMissing != null) {
      return lastNameMissing(this);
    }
    return orElse();
  }
}

abstract class LastNameMissing<T> implements ValueFailure<T> {
  const factory LastNameMissing({@required T failedValue}) =
      _$LastNameMissing<T>;

  @override
  T get failedValue;
  @override
  $LastNameMissingCopyWith<T, LastNameMissing<T>> get copyWith;
}
