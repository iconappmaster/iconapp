// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'redemption_action_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
RedemptionActionModel _$RedemptionActionModelFromJson(
    Map<String, dynamic> json) {
  return _RedemptionActionModel.fromJson(json);
}

/// @nodoc
class _$RedemptionActionModelTearOff {
  const _$RedemptionActionModelTearOff();

// ignore: unused_element
  _RedemptionActionModel call(
      {int creditActionId,
      String creditActionName,
      int pointsReceived,
      int earnedAt}) {
    return _RedemptionActionModel(
      creditActionId: creditActionId,
      creditActionName: creditActionName,
      pointsReceived: pointsReceived,
      earnedAt: earnedAt,
    );
  }

// ignore: unused_element
  RedemptionActionModel fromJson(Map<String, Object> json) {
    return RedemptionActionModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $RedemptionActionModel = _$RedemptionActionModelTearOff();

/// @nodoc
mixin _$RedemptionActionModel {
  int get creditActionId;
  String get creditActionName;
  int get pointsReceived;
  int get earnedAt;

  Map<String, dynamic> toJson();
  $RedemptionActionModelCopyWith<RedemptionActionModel> get copyWith;
}

/// @nodoc
abstract class $RedemptionActionModelCopyWith<$Res> {
  factory $RedemptionActionModelCopyWith(RedemptionActionModel value,
          $Res Function(RedemptionActionModel) then) =
      _$RedemptionActionModelCopyWithImpl<$Res>;
  $Res call(
      {int creditActionId,
      String creditActionName,
      int pointsReceived,
      int earnedAt});
}

/// @nodoc
class _$RedemptionActionModelCopyWithImpl<$Res>
    implements $RedemptionActionModelCopyWith<$Res> {
  _$RedemptionActionModelCopyWithImpl(this._value, this._then);

  final RedemptionActionModel _value;
  // ignore: unused_field
  final $Res Function(RedemptionActionModel) _then;

  @override
  $Res call({
    Object creditActionId = freezed,
    Object creditActionName = freezed,
    Object pointsReceived = freezed,
    Object earnedAt = freezed,
  }) {
    return _then(_value.copyWith(
      creditActionId: creditActionId == freezed
          ? _value.creditActionId
          : creditActionId as int,
      creditActionName: creditActionName == freezed
          ? _value.creditActionName
          : creditActionName as String,
      pointsReceived: pointsReceived == freezed
          ? _value.pointsReceived
          : pointsReceived as int,
      earnedAt: earnedAt == freezed ? _value.earnedAt : earnedAt as int,
    ));
  }
}

/// @nodoc
abstract class _$RedemptionActionModelCopyWith<$Res>
    implements $RedemptionActionModelCopyWith<$Res> {
  factory _$RedemptionActionModelCopyWith(_RedemptionActionModel value,
          $Res Function(_RedemptionActionModel) then) =
      __$RedemptionActionModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int creditActionId,
      String creditActionName,
      int pointsReceived,
      int earnedAt});
}

/// @nodoc
class __$RedemptionActionModelCopyWithImpl<$Res>
    extends _$RedemptionActionModelCopyWithImpl<$Res>
    implements _$RedemptionActionModelCopyWith<$Res> {
  __$RedemptionActionModelCopyWithImpl(_RedemptionActionModel _value,
      $Res Function(_RedemptionActionModel) _then)
      : super(_value, (v) => _then(v as _RedemptionActionModel));

  @override
  _RedemptionActionModel get _value => super._value as _RedemptionActionModel;

  @override
  $Res call({
    Object creditActionId = freezed,
    Object creditActionName = freezed,
    Object pointsReceived = freezed,
    Object earnedAt = freezed,
  }) {
    return _then(_RedemptionActionModel(
      creditActionId: creditActionId == freezed
          ? _value.creditActionId
          : creditActionId as int,
      creditActionName: creditActionName == freezed
          ? _value.creditActionName
          : creditActionName as String,
      pointsReceived: pointsReceived == freezed
          ? _value.pointsReceived
          : pointsReceived as int,
      earnedAt: earnedAt == freezed ? _value.earnedAt : earnedAt as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_RedemptionActionModel implements _RedemptionActionModel {
  const _$_RedemptionActionModel(
      {this.creditActionId,
      this.creditActionName,
      this.pointsReceived,
      this.earnedAt});

  factory _$_RedemptionActionModel.fromJson(Map<String, dynamic> json) =>
      _$_$_RedemptionActionModelFromJson(json);

  @override
  final int creditActionId;
  @override
  final String creditActionName;
  @override
  final int pointsReceived;
  @override
  final int earnedAt;

  @override
  String toString() {
    return 'RedemptionActionModel(creditActionId: $creditActionId, creditActionName: $creditActionName, pointsReceived: $pointsReceived, earnedAt: $earnedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RedemptionActionModel &&
            (identical(other.creditActionId, creditActionId) ||
                const DeepCollectionEquality()
                    .equals(other.creditActionId, creditActionId)) &&
            (identical(other.creditActionName, creditActionName) ||
                const DeepCollectionEquality()
                    .equals(other.creditActionName, creditActionName)) &&
            (identical(other.pointsReceived, pointsReceived) ||
                const DeepCollectionEquality()
                    .equals(other.pointsReceived, pointsReceived)) &&
            (identical(other.earnedAt, earnedAt) ||
                const DeepCollectionEquality()
                    .equals(other.earnedAt, earnedAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(creditActionId) ^
      const DeepCollectionEquality().hash(creditActionName) ^
      const DeepCollectionEquality().hash(pointsReceived) ^
      const DeepCollectionEquality().hash(earnedAt);

  @override
  _$RedemptionActionModelCopyWith<_RedemptionActionModel> get copyWith =>
      __$RedemptionActionModelCopyWithImpl<_RedemptionActionModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RedemptionActionModelToJson(this);
  }
}

abstract class _RedemptionActionModel implements RedemptionActionModel {
  const factory _RedemptionActionModel(
      {int creditActionId,
      String creditActionName,
      int pointsReceived,
      int earnedAt}) = _$_RedemptionActionModel;

  factory _RedemptionActionModel.fromJson(Map<String, dynamic> json) =
      _$_RedemptionActionModel.fromJson;

  @override
  int get creditActionId;
  @override
  String get creditActionName;
  @override
  int get pointsReceived;
  @override
  int get earnedAt;
  @override
  _$RedemptionActionModelCopyWith<_RedemptionActionModel> get copyWith;
}
