// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'auth_success.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AuthSuccessTearOff {
  const _$AuthSuccessTearOff();

// ignore: unused_element
  NavigateHome navigateHome() {
    return const NavigateHome();
  }

// ignore: unused_element
  NavigateProfile navigateProfile() {
    return const NavigateProfile();
  }
}

/// @nodoc
// ignore: unused_element
const $AuthSuccess = _$AuthSuccessTearOff();

/// @nodoc
mixin _$AuthSuccess {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult navigateHome(),
    @required TResult navigateProfile(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult navigateHome(),
    TResult navigateProfile(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult navigateHome(NavigateHome value),
    @required TResult navigateProfile(NavigateProfile value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult navigateHome(NavigateHome value),
    TResult navigateProfile(NavigateProfile value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $AuthSuccessCopyWith<$Res> {
  factory $AuthSuccessCopyWith(
          AuthSuccess value, $Res Function(AuthSuccess) then) =
      _$AuthSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthSuccessCopyWithImpl<$Res> implements $AuthSuccessCopyWith<$Res> {
  _$AuthSuccessCopyWithImpl(this._value, this._then);

  final AuthSuccess _value;
  // ignore: unused_field
  final $Res Function(AuthSuccess) _then;
}

/// @nodoc
abstract class $NavigateHomeCopyWith<$Res> {
  factory $NavigateHomeCopyWith(
          NavigateHome value, $Res Function(NavigateHome) then) =
      _$NavigateHomeCopyWithImpl<$Res>;
}

/// @nodoc
class _$NavigateHomeCopyWithImpl<$Res> extends _$AuthSuccessCopyWithImpl<$Res>
    implements $NavigateHomeCopyWith<$Res> {
  _$NavigateHomeCopyWithImpl(
      NavigateHome _value, $Res Function(NavigateHome) _then)
      : super(_value, (v) => _then(v as NavigateHome));

  @override
  NavigateHome get _value => super._value as NavigateHome;
}

/// @nodoc
class _$NavigateHome implements NavigateHome {
  const _$NavigateHome();

  @override
  String toString() {
    return 'AuthSuccess.navigateHome()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NavigateHome);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult navigateHome(),
    @required TResult navigateProfile(),
  }) {
    assert(navigateHome != null);
    assert(navigateProfile != null);
    return navigateHome();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult navigateHome(),
    TResult navigateProfile(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (navigateHome != null) {
      return navigateHome();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult navigateHome(NavigateHome value),
    @required TResult navigateProfile(NavigateProfile value),
  }) {
    assert(navigateHome != null);
    assert(navigateProfile != null);
    return navigateHome(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult navigateHome(NavigateHome value),
    TResult navigateProfile(NavigateProfile value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (navigateHome != null) {
      return navigateHome(this);
    }
    return orElse();
  }
}

abstract class NavigateHome implements AuthSuccess {
  const factory NavigateHome() = _$NavigateHome;
}

/// @nodoc
abstract class $NavigateProfileCopyWith<$Res> {
  factory $NavigateProfileCopyWith(
          NavigateProfile value, $Res Function(NavigateProfile) then) =
      _$NavigateProfileCopyWithImpl<$Res>;
}

/// @nodoc
class _$NavigateProfileCopyWithImpl<$Res>
    extends _$AuthSuccessCopyWithImpl<$Res>
    implements $NavigateProfileCopyWith<$Res> {
  _$NavigateProfileCopyWithImpl(
      NavigateProfile _value, $Res Function(NavigateProfile) _then)
      : super(_value, (v) => _then(v as NavigateProfile));

  @override
  NavigateProfile get _value => super._value as NavigateProfile;
}

/// @nodoc
class _$NavigateProfile implements NavigateProfile {
  const _$NavigateProfile();

  @override
  String toString() {
    return 'AuthSuccess.navigateProfile()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NavigateProfile);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult navigateHome(),
    @required TResult navigateProfile(),
  }) {
    assert(navigateHome != null);
    assert(navigateProfile != null);
    return navigateProfile();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult navigateHome(),
    TResult navigateProfile(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (navigateProfile != null) {
      return navigateProfile();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult navigateHome(NavigateHome value),
    @required TResult navigateProfile(NavigateProfile value),
  }) {
    assert(navigateHome != null);
    assert(navigateProfile != null);
    return navigateProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult navigateHome(NavigateHome value),
    TResult navigateProfile(NavigateProfile value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (navigateProfile != null) {
      return navigateProfile(this);
    }
    return orElse();
  }
}

abstract class NavigateProfile implements AuthSuccess {
  const factory NavigateProfile() = _$NavigateProfile;
}
