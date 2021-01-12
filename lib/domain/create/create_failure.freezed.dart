// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'create_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$CreateFailureTearOff {
  const _$CreateFailureTearOff();

// ignore: unused_element
  NameTaken wrongName() {
    return const NameTaken();
  }

// ignore: unused_element
  GeneralError generalError() {
    return const GeneralError();
  }
}

/// @nodoc
// ignore: unused_element
const $CreateFailure = _$CreateFailureTearOff();

/// @nodoc
mixin _$CreateFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult wrongName(),
    @required TResult generalError(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult wrongName(),
    TResult generalError(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult wrongName(NameTaken value),
    @required TResult generalError(GeneralError value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult wrongName(NameTaken value),
    TResult generalError(GeneralError value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $CreateFailureCopyWith<$Res> {
  factory $CreateFailureCopyWith(
          CreateFailure value, $Res Function(CreateFailure) then) =
      _$CreateFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$CreateFailureCopyWithImpl<$Res>
    implements $CreateFailureCopyWith<$Res> {
  _$CreateFailureCopyWithImpl(this._value, this._then);

  final CreateFailure _value;
  // ignore: unused_field
  final $Res Function(CreateFailure) _then;
}

/// @nodoc
abstract class $NameTakenCopyWith<$Res> {
  factory $NameTakenCopyWith(NameTaken value, $Res Function(NameTaken) then) =
      _$NameTakenCopyWithImpl<$Res>;
}

/// @nodoc
class _$NameTakenCopyWithImpl<$Res> extends _$CreateFailureCopyWithImpl<$Res>
    implements $NameTakenCopyWith<$Res> {
  _$NameTakenCopyWithImpl(NameTaken _value, $Res Function(NameTaken) _then)
      : super(_value, (v) => _then(v as NameTaken));

  @override
  NameTaken get _value => super._value as NameTaken;
}

/// @nodoc
class _$NameTaken implements NameTaken {
  const _$NameTaken();

  @override
  String toString() {
    return 'CreateFailure.wrongName()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NameTaken);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult wrongName(),
    @required TResult generalError(),
  }) {
    assert(wrongName != null);
    assert(generalError != null);
    return wrongName();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult wrongName(),
    TResult generalError(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (wrongName != null) {
      return wrongName();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult wrongName(NameTaken value),
    @required TResult generalError(GeneralError value),
  }) {
    assert(wrongName != null);
    assert(generalError != null);
    return wrongName(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult wrongName(NameTaken value),
    TResult generalError(GeneralError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (wrongName != null) {
      return wrongName(this);
    }
    return orElse();
  }
}

abstract class NameTaken implements CreateFailure {
  const factory NameTaken() = _$NameTaken;
}

/// @nodoc
abstract class $GeneralErrorCopyWith<$Res> {
  factory $GeneralErrorCopyWith(
          GeneralError value, $Res Function(GeneralError) then) =
      _$GeneralErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$GeneralErrorCopyWithImpl<$Res> extends _$CreateFailureCopyWithImpl<$Res>
    implements $GeneralErrorCopyWith<$Res> {
  _$GeneralErrorCopyWithImpl(
      GeneralError _value, $Res Function(GeneralError) _then)
      : super(_value, (v) => _then(v as GeneralError));

  @override
  GeneralError get _value => super._value as GeneralError;
}

/// @nodoc
class _$GeneralError implements GeneralError {
  const _$GeneralError();

  @override
  String toString() {
    return 'CreateFailure.generalError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is GeneralError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult wrongName(),
    @required TResult generalError(),
  }) {
    assert(wrongName != null);
    assert(generalError != null);
    return generalError();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult wrongName(),
    TResult generalError(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (generalError != null) {
      return generalError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult wrongName(NameTaken value),
    @required TResult generalError(GeneralError value),
  }) {
    assert(wrongName != null);
    assert(generalError != null);
    return generalError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult wrongName(NameTaken value),
    TResult generalError(GeneralError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (generalError != null) {
      return generalError(this);
    }
    return orElse();
  }
}

abstract class GeneralError implements CreateFailure {
  const factory GeneralError() = _$GeneralError;
}
