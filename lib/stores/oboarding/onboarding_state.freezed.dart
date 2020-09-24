// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'onboarding_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$OnboardingStateTearOff {
  const _$OnboardingStateTearOff();

// ignore: unused_element
  _OnboardingState call(
      {@required bool loading,
      @required String errorMessage,
      @required UserModel userModel}) {
    return _OnboardingState(
      loading: loading,
      errorMessage: errorMessage,
      userModel: userModel,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $OnboardingState = _$OnboardingStateTearOff();

/// @nodoc
mixin _$OnboardingState {
  bool get loading;
  String get errorMessage;
  UserModel get userModel;

  $OnboardingStateCopyWith<OnboardingState> get copyWith;
}

/// @nodoc
abstract class $OnboardingStateCopyWith<$Res> {
  factory $OnboardingStateCopyWith(
          OnboardingState value, $Res Function(OnboardingState) then) =
      _$OnboardingStateCopyWithImpl<$Res>;
  $Res call({bool loading, String errorMessage, UserModel userModel});

  $UserModelCopyWith<$Res> get userModel;
}

/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._value, this._then);

  final OnboardingState _value;
  // ignore: unused_field
  final $Res Function(OnboardingState) _then;

  @override
  $Res call({
    Object loading = freezed,
    Object errorMessage = freezed,
    Object userModel = freezed,
  }) {
    return _then(_value.copyWith(
      loading: loading == freezed ? _value.loading : loading as bool,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage as String,
      userModel:
          userModel == freezed ? _value.userModel : userModel as UserModel,
    ));
  }

  @override
  $UserModelCopyWith<$Res> get userModel {
    if (_value.userModel == null) {
      return null;
    }
    return $UserModelCopyWith<$Res>(_value.userModel, (value) {
      return _then(_value.copyWith(userModel: value));
    });
  }
}

/// @nodoc
abstract class _$OnboardingStateCopyWith<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  factory _$OnboardingStateCopyWith(
          _OnboardingState value, $Res Function(_OnboardingState) then) =
      __$OnboardingStateCopyWithImpl<$Res>;
  @override
  $Res call({bool loading, String errorMessage, UserModel userModel});

  @override
  $UserModelCopyWith<$Res> get userModel;
}

/// @nodoc
class __$OnboardingStateCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res>
    implements _$OnboardingStateCopyWith<$Res> {
  __$OnboardingStateCopyWithImpl(
      _OnboardingState _value, $Res Function(_OnboardingState) _then)
      : super(_value, (v) => _then(v as _OnboardingState));

  @override
  _OnboardingState get _value => super._value as _OnboardingState;

  @override
  $Res call({
    Object loading = freezed,
    Object errorMessage = freezed,
    Object userModel = freezed,
  }) {
    return _then(_OnboardingState(
      loading: loading == freezed ? _value.loading : loading as bool,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage as String,
      userModel:
          userModel == freezed ? _value.userModel : userModel as UserModel,
    ));
  }
}

/// @nodoc
class _$_OnboardingState
    with DiagnosticableTreeMixin
    implements _OnboardingState {
  const _$_OnboardingState(
      {@required this.loading,
      @required this.errorMessage,
      @required this.userModel})
      : assert(loading != null),
        assert(errorMessage != null),
        assert(userModel != null);

  @override
  final bool loading;
  @override
  final String errorMessage;
  @override
  final UserModel userModel;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OnboardingState(loading: $loading, errorMessage: $errorMessage, userModel: $userModel)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OnboardingState'))
      ..add(DiagnosticsProperty('loading', loading))
      ..add(DiagnosticsProperty('errorMessage', errorMessage))
      ..add(DiagnosticsProperty('userModel', userModel));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OnboardingState &&
            (identical(other.loading, loading) ||
                const DeepCollectionEquality()
                    .equals(other.loading, loading)) &&
            (identical(other.errorMessage, errorMessage) ||
                const DeepCollectionEquality()
                    .equals(other.errorMessage, errorMessage)) &&
            (identical(other.userModel, userModel) ||
                const DeepCollectionEquality()
                    .equals(other.userModel, userModel)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(loading) ^
      const DeepCollectionEquality().hash(errorMessage) ^
      const DeepCollectionEquality().hash(userModel);

  @override
  _$OnboardingStateCopyWith<_OnboardingState> get copyWith =>
      __$OnboardingStateCopyWithImpl<_OnboardingState>(this, _$identity);
}

abstract class _OnboardingState implements OnboardingState {
  const factory _OnboardingState(
      {@required bool loading,
      @required String errorMessage,
      @required UserModel userModel}) = _$_OnboardingState;

  @override
  bool get loading;
  @override
  String get errorMessage;
  @override
  UserModel get userModel;
  @override
  _$OnboardingStateCopyWith<_OnboardingState> get copyWith;
}
