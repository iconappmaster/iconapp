// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$LoginStateTearOff {
  const _$LoginStateTearOff();

  _LoginState call(
      {@required String phone,
      @required String phonePrefix,
      @required String code,
      @required bool loading,
      @required int currentStep,
      @required String errorMessage}) {
    return _LoginState(
      phone: phone,
      phonePrefix: phonePrefix,
      code: code,
      loading: loading,
      currentStep: currentStep,
      errorMessage: errorMessage,
    );
  }
}

// ignore: unused_element
const $LoginState = _$LoginStateTearOff();

mixin _$LoginState {
  String get phone;
  String get phonePrefix;
  String get code;
  bool get loading;
  int get currentStep;
  String get errorMessage;

  $LoginStateCopyWith<LoginState> get copyWith;
}

abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res>;
  $Res call(
      {String phone,
      String phonePrefix,
      String code,
      bool loading,
      int currentStep,
      String errorMessage});
}

class _$LoginStateCopyWithImpl<$Res> implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  final LoginState _value;
  // ignore: unused_field
  final $Res Function(LoginState) _then;

  @override
  $Res call({
    Object phone = freezed,
    Object phonePrefix = freezed,
    Object code = freezed,
    Object loading = freezed,
    Object currentStep = freezed,
    Object errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      phone: phone == freezed ? _value.phone : phone as String,
      phonePrefix:
          phonePrefix == freezed ? _value.phonePrefix : phonePrefix as String,
      code: code == freezed ? _value.code : code as String,
      loading: loading == freezed ? _value.loading : loading as bool,
      currentStep:
          currentStep == freezed ? _value.currentStep : currentStep as int,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage as String,
    ));
  }
}

abstract class _$LoginStateCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory _$LoginStateCopyWith(
          _LoginState value, $Res Function(_LoginState) then) =
      __$LoginStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String phone,
      String phonePrefix,
      String code,
      bool loading,
      int currentStep,
      String errorMessage});
}

class __$LoginStateCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements _$LoginStateCopyWith<$Res> {
  __$LoginStateCopyWithImpl(
      _LoginState _value, $Res Function(_LoginState) _then)
      : super(_value, (v) => _then(v as _LoginState));

  @override
  _LoginState get _value => super._value as _LoginState;

  @override
  $Res call({
    Object phone = freezed,
    Object phonePrefix = freezed,
    Object code = freezed,
    Object loading = freezed,
    Object currentStep = freezed,
    Object errorMessage = freezed,
  }) {
    return _then(_LoginState(
      phone: phone == freezed ? _value.phone : phone as String,
      phonePrefix:
          phonePrefix == freezed ? _value.phonePrefix : phonePrefix as String,
      code: code == freezed ? _value.code : code as String,
      loading: loading == freezed ? _value.loading : loading as bool,
      currentStep:
          currentStep == freezed ? _value.currentStep : currentStep as int,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage as String,
    ));
  }
}

class _$_LoginState with DiagnosticableTreeMixin implements _LoginState {
  const _$_LoginState(
      {@required this.phone,
      @required this.phonePrefix,
      @required this.code,
      @required this.loading,
      @required this.currentStep,
      @required this.errorMessage})
      : assert(phone != null),
        assert(phonePrefix != null),
        assert(code != null),
        assert(loading != null),
        assert(currentStep != null),
        assert(errorMessage != null);

  @override
  final String phone;
  @override
  final String phonePrefix;
  @override
  final String code;
  @override
  final bool loading;
  @override
  final int currentStep;
  @override
  final String errorMessage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginState(phone: $phone, phonePrefix: $phonePrefix, code: $code, loading: $loading, currentStep: $currentStep, errorMessage: $errorMessage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoginState'))
      ..add(DiagnosticsProperty('phone', phone))
      ..add(DiagnosticsProperty('phonePrefix', phonePrefix))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('loading', loading))
      ..add(DiagnosticsProperty('currentStep', currentStep))
      ..add(DiagnosticsProperty('errorMessage', errorMessage));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoginState &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.phonePrefix, phonePrefix) ||
                const DeepCollectionEquality()
                    .equals(other.phonePrefix, phonePrefix)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.loading, loading) ||
                const DeepCollectionEquality()
                    .equals(other.loading, loading)) &&
            (identical(other.currentStep, currentStep) ||
                const DeepCollectionEquality()
                    .equals(other.currentStep, currentStep)) &&
            (identical(other.errorMessage, errorMessage) ||
                const DeepCollectionEquality()
                    .equals(other.errorMessage, errorMessage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(phonePrefix) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(loading) ^
      const DeepCollectionEquality().hash(currentStep) ^
      const DeepCollectionEquality().hash(errorMessage);

  @override
  _$LoginStateCopyWith<_LoginState> get copyWith =>
      __$LoginStateCopyWithImpl<_LoginState>(this, _$identity);
}

abstract class _LoginState implements LoginState {
  const factory _LoginState(
      {@required String phone,
      @required String phonePrefix,
      @required String code,
      @required bool loading,
      @required int currentStep,
      @required String errorMessage}) = _$_LoginState;

  @override
  String get phone;
  @override
  String get phonePrefix;
  @override
  String get code;
  @override
  bool get loading;
  @override
  int get currentStep;
  @override
  String get errorMessage;
  @override
  _$LoginStateCopyWith<_LoginState> get copyWith;
}
