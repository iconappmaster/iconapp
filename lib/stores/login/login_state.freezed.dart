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
      {@required String prefix,
      @required String phone,
      @required String code,
      @required bool loading,
      @required String errorMessage,
      @required PhoneOnboardingState phonePageState,
      @required UserModel userModel}) {
    return _LoginState(
      prefix: prefix,
      phone: phone,
      code: code,
      loading: loading,
      errorMessage: errorMessage,
      phonePageState: phonePageState,
      userModel: userModel,
    );
  }
}

// ignore: unused_element
const $LoginState = _$LoginStateTearOff();

mixin _$LoginState {
  String get prefix;
  String get phone;
  String get code;
  bool get loading;
  String get errorMessage;
  PhoneOnboardingState get phonePageState;
  UserModel get userModel;

  $LoginStateCopyWith<LoginState> get copyWith;
}

abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res>;
  $Res call(
      {String prefix,
      String phone,
      String code,
      bool loading,
      String errorMessage,
      PhoneOnboardingState phonePageState,
      UserModel userModel});
}

class _$LoginStateCopyWithImpl<$Res> implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  final LoginState _value;
  // ignore: unused_field
  final $Res Function(LoginState) _then;

  @override
  $Res call({
    Object prefix = freezed,
    Object phone = freezed,
    Object code = freezed,
    Object loading = freezed,
    Object errorMessage = freezed,
    Object phonePageState = freezed,
    Object userModel = freezed,
  }) {
    return _then(_value.copyWith(
      prefix: prefix == freezed ? _value.prefix : prefix as String,
      phone: phone == freezed ? _value.phone : phone as String,
      code: code == freezed ? _value.code : code as String,
      loading: loading == freezed ? _value.loading : loading as bool,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage as String,
      phonePageState: phonePageState == freezed
          ? _value.phonePageState
          : phonePageState as PhoneOnboardingState,
      userModel:
          userModel == freezed ? _value.userModel : userModel as UserModel,
    ));
  }
}

abstract class _$LoginStateCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory _$LoginStateCopyWith(
          _LoginState value, $Res Function(_LoginState) then) =
      __$LoginStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String prefix,
      String phone,
      String code,
      bool loading,
      String errorMessage,
      PhoneOnboardingState phonePageState,
      UserModel userModel});
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
    Object prefix = freezed,
    Object phone = freezed,
    Object code = freezed,
    Object loading = freezed,
    Object errorMessage = freezed,
    Object phonePageState = freezed,
    Object userModel = freezed,
  }) {
    return _then(_LoginState(
      prefix: prefix == freezed ? _value.prefix : prefix as String,
      phone: phone == freezed ? _value.phone : phone as String,
      code: code == freezed ? _value.code : code as String,
      loading: loading == freezed ? _value.loading : loading as bool,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage as String,
      phonePageState: phonePageState == freezed
          ? _value.phonePageState
          : phonePageState as PhoneOnboardingState,
      userModel:
          userModel == freezed ? _value.userModel : userModel as UserModel,
    ));
  }
}

class _$_LoginState with DiagnosticableTreeMixin implements _LoginState {
  const _$_LoginState(
      {@required this.prefix,
      @required this.phone,
      @required this.code,
      @required this.loading,
      @required this.errorMessage,
      @required this.phonePageState,
      @required this.userModel})
      : assert(prefix != null),
        assert(phone != null),
        assert(code != null),
        assert(loading != null),
        assert(errorMessage != null),
        assert(phonePageState != null),
        assert(userModel != null);

  @override
  final String prefix;
  @override
  final String phone;
  @override
  final String code;
  @override
  final bool loading;
  @override
  final String errorMessage;
  @override
  final PhoneOnboardingState phonePageState;
  @override
  final UserModel userModel;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginState(prefix: $prefix, phone: $phone, code: $code, loading: $loading, errorMessage: $errorMessage, phonePageState: $phonePageState, userModel: $userModel)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoginState'))
      ..add(DiagnosticsProperty('prefix', prefix))
      ..add(DiagnosticsProperty('phone', phone))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('loading', loading))
      ..add(DiagnosticsProperty('errorMessage', errorMessage))
      ..add(DiagnosticsProperty('phonePageState', phonePageState))
      ..add(DiagnosticsProperty('userModel', userModel));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoginState &&
            (identical(other.prefix, prefix) ||
                const DeepCollectionEquality().equals(other.prefix, prefix)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.loading, loading) ||
                const DeepCollectionEquality()
                    .equals(other.loading, loading)) &&
            (identical(other.errorMessage, errorMessage) ||
                const DeepCollectionEquality()
                    .equals(other.errorMessage, errorMessage)) &&
            (identical(other.phonePageState, phonePageState) ||
                const DeepCollectionEquality()
                    .equals(other.phonePageState, phonePageState)) &&
            (identical(other.userModel, userModel) ||
                const DeepCollectionEquality()
                    .equals(other.userModel, userModel)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(prefix) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(loading) ^
      const DeepCollectionEquality().hash(errorMessage) ^
      const DeepCollectionEquality().hash(phonePageState) ^
      const DeepCollectionEquality().hash(userModel);

  @override
  _$LoginStateCopyWith<_LoginState> get copyWith =>
      __$LoginStateCopyWithImpl<_LoginState>(this, _$identity);
}

abstract class _LoginState implements LoginState {
  const factory _LoginState(
      {@required String prefix,
      @required String phone,
      @required String code,
      @required bool loading,
      @required String errorMessage,
      @required PhoneOnboardingState phonePageState,
      @required UserModel userModel}) = _$_LoginState;

  @override
  String get prefix;
  @override
  String get phone;
  @override
  String get code;
  @override
  bool get loading;
  @override
  String get errorMessage;
  @override
  PhoneOnboardingState get phonePageState;
  @override
  UserModel get userModel;
  @override
  _$LoginStateCopyWith<_LoginState> get copyWith;
}
