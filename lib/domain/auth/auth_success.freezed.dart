// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'auth_success.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

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

// ignore: unused_element
const $AuthSuccess = _$AuthSuccessTearOff();

mixin _$AuthSuccess {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result navigateHome(),
    @required Result navigateProfile(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result navigateHome(),
    Result navigateProfile(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result navigateHome(NavigateHome value),
    @required Result navigateProfile(NavigateProfile value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result navigateHome(NavigateHome value),
    Result navigateProfile(NavigateProfile value),
    @required Result orElse(),
  });
}

abstract class $AuthSuccessCopyWith<$Res> {
  factory $AuthSuccessCopyWith(
          AuthSuccess value, $Res Function(AuthSuccess) then) =
      _$AuthSuccessCopyWithImpl<$Res>;
}

class _$AuthSuccessCopyWithImpl<$Res> implements $AuthSuccessCopyWith<$Res> {
  _$AuthSuccessCopyWithImpl(this._value, this._then);

  final AuthSuccess _value;
  // ignore: unused_field
  final $Res Function(AuthSuccess) _then;
}

abstract class $NavigateHomeCopyWith<$Res> {
  factory $NavigateHomeCopyWith(
          NavigateHome value, $Res Function(NavigateHome) then) =
      _$NavigateHomeCopyWithImpl<$Res>;
}

class _$NavigateHomeCopyWithImpl<$Res> extends _$AuthSuccessCopyWithImpl<$Res>
    implements $NavigateHomeCopyWith<$Res> {
  _$NavigateHomeCopyWithImpl(
      NavigateHome _value, $Res Function(NavigateHome) _then)
      : super(_value, (v) => _then(v as NavigateHome));

  @override
  NavigateHome get _value => super._value as NavigateHome;
}

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
  Result when<Result extends Object>({
    @required Result navigateHome(),
    @required Result navigateProfile(),
  }) {
    assert(navigateHome != null);
    assert(navigateProfile != null);
    return navigateHome();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result navigateHome(),
    Result navigateProfile(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (navigateHome != null) {
      return navigateHome();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result navigateHome(NavigateHome value),
    @required Result navigateProfile(NavigateProfile value),
  }) {
    assert(navigateHome != null);
    assert(navigateProfile != null);
    return navigateHome(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result navigateHome(NavigateHome value),
    Result navigateProfile(NavigateProfile value),
    @required Result orElse(),
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

abstract class $NavigateProfileCopyWith<$Res> {
  factory $NavigateProfileCopyWith(
          NavigateProfile value, $Res Function(NavigateProfile) then) =
      _$NavigateProfileCopyWithImpl<$Res>;
}

class _$NavigateProfileCopyWithImpl<$Res>
    extends _$AuthSuccessCopyWithImpl<$Res>
    implements $NavigateProfileCopyWith<$Res> {
  _$NavigateProfileCopyWithImpl(
      NavigateProfile _value, $Res Function(NavigateProfile) _then)
      : super(_value, (v) => _then(v as NavigateProfile));

  @override
  NavigateProfile get _value => super._value as NavigateProfile;
}

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
  Result when<Result extends Object>({
    @required Result navigateHome(),
    @required Result navigateProfile(),
  }) {
    assert(navigateHome != null);
    assert(navigateProfile != null);
    return navigateProfile();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result navigateHome(),
    Result navigateProfile(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (navigateProfile != null) {
      return navigateProfile();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result navigateHome(NavigateHome value),
    @required Result navigateProfile(NavigateProfile value),
  }) {
    assert(navigateHome != null);
    assert(navigateProfile != null);
    return navigateProfile(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result navigateHome(NavigateHome value),
    Result navigateProfile(NavigateProfile value),
    @required Result orElse(),
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
