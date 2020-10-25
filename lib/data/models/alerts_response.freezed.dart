// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'alerts_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
AlertResponse _$AlertResponseFromJson(Map<String, dynamic> json) {
  return _AlertResponse.fromJson(json);
}

/// @nodoc
class _$AlertResponseTearOff {
  const _$AlertResponseTearOff();

// ignore: unused_element
  _AlertResponse call({List<AlertModel> alerts, int unseenAlertCount}) {
    return _AlertResponse(
      alerts: alerts,
      unseenAlertCount: unseenAlertCount,
    );
  }

// ignore: unused_element
  AlertResponse fromJson(Map<String, Object> json) {
    return AlertResponse.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $AlertResponse = _$AlertResponseTearOff();

/// @nodoc
mixin _$AlertResponse {
  List<AlertModel> get alerts;
  int get unseenAlertCount;

  Map<String, dynamic> toJson();
  $AlertResponseCopyWith<AlertResponse> get copyWith;
}

/// @nodoc
abstract class $AlertResponseCopyWith<$Res> {
  factory $AlertResponseCopyWith(
          AlertResponse value, $Res Function(AlertResponse) then) =
      _$AlertResponseCopyWithImpl<$Res>;
  $Res call({List<AlertModel> alerts, int unseenAlertCount});
}

/// @nodoc
class _$AlertResponseCopyWithImpl<$Res>
    implements $AlertResponseCopyWith<$Res> {
  _$AlertResponseCopyWithImpl(this._value, this._then);

  final AlertResponse _value;
  // ignore: unused_field
  final $Res Function(AlertResponse) _then;

  @override
  $Res call({
    Object alerts = freezed,
    Object unseenAlertCount = freezed,
  }) {
    return _then(_value.copyWith(
      alerts: alerts == freezed ? _value.alerts : alerts as List<AlertModel>,
      unseenAlertCount: unseenAlertCount == freezed
          ? _value.unseenAlertCount
          : unseenAlertCount as int,
    ));
  }
}

/// @nodoc
abstract class _$AlertResponseCopyWith<$Res>
    implements $AlertResponseCopyWith<$Res> {
  factory _$AlertResponseCopyWith(
          _AlertResponse value, $Res Function(_AlertResponse) then) =
      __$AlertResponseCopyWithImpl<$Res>;
  @override
  $Res call({List<AlertModel> alerts, int unseenAlertCount});
}

/// @nodoc
class __$AlertResponseCopyWithImpl<$Res>
    extends _$AlertResponseCopyWithImpl<$Res>
    implements _$AlertResponseCopyWith<$Res> {
  __$AlertResponseCopyWithImpl(
      _AlertResponse _value, $Res Function(_AlertResponse) _then)
      : super(_value, (v) => _then(v as _AlertResponse));

  @override
  _AlertResponse get _value => super._value as _AlertResponse;

  @override
  $Res call({
    Object alerts = freezed,
    Object unseenAlertCount = freezed,
  }) {
    return _then(_AlertResponse(
      alerts: alerts == freezed ? _value.alerts : alerts as List<AlertModel>,
      unseenAlertCount: unseenAlertCount == freezed
          ? _value.unseenAlertCount
          : unseenAlertCount as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_AlertResponse implements _AlertResponse {
  const _$_AlertResponse({this.alerts, this.unseenAlertCount});

  factory _$_AlertResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_AlertResponseFromJson(json);

  @override
  final List<AlertModel> alerts;
  @override
  final int unseenAlertCount;

  @override
  String toString() {
    return 'AlertResponse(alerts: $alerts, unseenAlertCount: $unseenAlertCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AlertResponse &&
            (identical(other.alerts, alerts) ||
                const DeepCollectionEquality().equals(other.alerts, alerts)) &&
            (identical(other.unseenAlertCount, unseenAlertCount) ||
                const DeepCollectionEquality()
                    .equals(other.unseenAlertCount, unseenAlertCount)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(alerts) ^
      const DeepCollectionEquality().hash(unseenAlertCount);

  @override
  _$AlertResponseCopyWith<_AlertResponse> get copyWith =>
      __$AlertResponseCopyWithImpl<_AlertResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AlertResponseToJson(this);
  }
}

abstract class _AlertResponse implements AlertResponse {
  const factory _AlertResponse(
      {List<AlertModel> alerts, int unseenAlertCount}) = _$_AlertResponse;

  factory _AlertResponse.fromJson(Map<String, dynamic> json) =
      _$_AlertResponse.fromJson;

  @override
  List<AlertModel> get alerts;
  @override
  int get unseenAlertCount;
  @override
  _$AlertResponseCopyWith<_AlertResponse> get copyWith;
}
