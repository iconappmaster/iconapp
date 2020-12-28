// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'credit_action_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
CreditActionModel _$CreditActionModelFromJson(Map<String, dynamic> json) {
  return _CreditActionModel.fromJson(json);
}

/// @nodoc
class _$CreditActionModelTearOff {
  const _$CreditActionModelTearOff();

// ignore: unused_element
  _CreditActionModel call(
      {int creditActionId,
      String creditActionName,
      int pointsReceived,
      String earnedAt}) {
    return _CreditActionModel(
      creditActionId: creditActionId,
      creditActionName: creditActionName,
      pointsReceived: pointsReceived,
      earnedAt: earnedAt,
    );
  }

// ignore: unused_element
  CreditActionModel fromJson(Map<String, Object> json) {
    return CreditActionModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $CreditActionModel = _$CreditActionModelTearOff();

/// @nodoc
mixin _$CreditActionModel {
  int get creditActionId;
  String get creditActionName;
  int get pointsReceived;
  String get earnedAt;

  Map<String, dynamic> toJson();
  $CreditActionModelCopyWith<CreditActionModel> get copyWith;
}

/// @nodoc
abstract class $CreditActionModelCopyWith<$Res> {
  factory $CreditActionModelCopyWith(
          CreditActionModel value, $Res Function(CreditActionModel) then) =
      _$CreditActionModelCopyWithImpl<$Res>;
  $Res call(
      {int creditActionId,
      String creditActionName,
      int pointsReceived,
      String earnedAt});
}

/// @nodoc
class _$CreditActionModelCopyWithImpl<$Res>
    implements $CreditActionModelCopyWith<$Res> {
  _$CreditActionModelCopyWithImpl(this._value, this._then);

  final CreditActionModel _value;
  // ignore: unused_field
  final $Res Function(CreditActionModel) _then;

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
      earnedAt: earnedAt == freezed ? _value.earnedAt : earnedAt as String,
    ));
  }
}

/// @nodoc
abstract class _$CreditActionModelCopyWith<$Res>
    implements $CreditActionModelCopyWith<$Res> {
  factory _$CreditActionModelCopyWith(
          _CreditActionModel value, $Res Function(_CreditActionModel) then) =
      __$CreditActionModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int creditActionId,
      String creditActionName,
      int pointsReceived,
      String earnedAt});
}

/// @nodoc
class __$CreditActionModelCopyWithImpl<$Res>
    extends _$CreditActionModelCopyWithImpl<$Res>
    implements _$CreditActionModelCopyWith<$Res> {
  __$CreditActionModelCopyWithImpl(
      _CreditActionModel _value, $Res Function(_CreditActionModel) _then)
      : super(_value, (v) => _then(v as _CreditActionModel));

  @override
  _CreditActionModel get _value => super._value as _CreditActionModel;

  @override
  $Res call({
    Object creditActionId = freezed,
    Object creditActionName = freezed,
    Object pointsReceived = freezed,
    Object earnedAt = freezed,
  }) {
    return _then(_CreditActionModel(
      creditActionId: creditActionId == freezed
          ? _value.creditActionId
          : creditActionId as int,
      creditActionName: creditActionName == freezed
          ? _value.creditActionName
          : creditActionName as String,
      pointsReceived: pointsReceived == freezed
          ? _value.pointsReceived
          : pointsReceived as int,
      earnedAt: earnedAt == freezed ? _value.earnedAt : earnedAt as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_CreditActionModel implements _CreditActionModel {
  const _$_CreditActionModel(
      {this.creditActionId,
      this.creditActionName,
      this.pointsReceived,
      this.earnedAt});

  factory _$_CreditActionModel.fromJson(Map<String, dynamic> json) =>
      _$_$_CreditActionModelFromJson(json);

  @override
  final int creditActionId;
  @override
  final String creditActionName;
  @override
  final int pointsReceived;
  @override
  final String earnedAt;

  @override
  String toString() {
    return 'CreditActionModel(creditActionId: $creditActionId, creditActionName: $creditActionName, pointsReceived: $pointsReceived, earnedAt: $earnedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CreditActionModel &&
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
  _$CreditActionModelCopyWith<_CreditActionModel> get copyWith =>
      __$CreditActionModelCopyWithImpl<_CreditActionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CreditActionModelToJson(this);
  }
}

abstract class _CreditActionModel implements CreditActionModel {
  const factory _CreditActionModel(
      {int creditActionId,
      String creditActionName,
      int pointsReceived,
      String earnedAt}) = _$_CreditActionModel;

  factory _CreditActionModel.fromJson(Map<String, dynamic> json) =
      _$_CreditActionModel.fromJson;

  @override
  int get creditActionId;
  @override
  String get creditActionName;
  @override
  int get pointsReceived;
  @override
  String get earnedAt;
  @override
  _$CreditActionModelCopyWith<_CreditActionModel> get copyWith;
}
