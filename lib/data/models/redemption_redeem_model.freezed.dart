// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'redemption_redeem_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
RedemptionRedeemModel _$RedemptionRedeemModelFromJson(
    Map<String, dynamic> json) {
  return _RedemptionRedeemModel.fromJson(json);
}

/// @nodoc
class _$RedemptionRedeemModelTearOff {
  const _$RedemptionRedeemModelTearOff();

// ignore: unused_element
  _RedemptionRedeemModel call(
      {RedemptionProductModel redemptionProduct, int pointBalance}) {
    return _RedemptionRedeemModel(
      redemptionProduct: redemptionProduct,
      pointBalance: pointBalance,
    );
  }

// ignore: unused_element
  RedemptionRedeemModel fromJson(Map<String, Object> json) {
    return RedemptionRedeemModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $RedemptionRedeemModel = _$RedemptionRedeemModelTearOff();

/// @nodoc
mixin _$RedemptionRedeemModel {
  RedemptionProductModel get redemptionProduct;
  int get pointBalance;

  Map<String, dynamic> toJson();
  $RedemptionRedeemModelCopyWith<RedemptionRedeemModel> get copyWith;
}

/// @nodoc
abstract class $RedemptionRedeemModelCopyWith<$Res> {
  factory $RedemptionRedeemModelCopyWith(RedemptionRedeemModel value,
          $Res Function(RedemptionRedeemModel) then) =
      _$RedemptionRedeemModelCopyWithImpl<$Res>;
  $Res call({RedemptionProductModel redemptionProduct, int pointBalance});

  $RedemptionProductModelCopyWith<$Res> get redemptionProduct;
}

/// @nodoc
class _$RedemptionRedeemModelCopyWithImpl<$Res>
    implements $RedemptionRedeemModelCopyWith<$Res> {
  _$RedemptionRedeemModelCopyWithImpl(this._value, this._then);

  final RedemptionRedeemModel _value;
  // ignore: unused_field
  final $Res Function(RedemptionRedeemModel) _then;

  @override
  $Res call({
    Object redemptionProduct = freezed,
    Object pointBalance = freezed,
  }) {
    return _then(_value.copyWith(
      redemptionProduct: redemptionProduct == freezed
          ? _value.redemptionProduct
          : redemptionProduct as RedemptionProductModel,
      pointBalance:
          pointBalance == freezed ? _value.pointBalance : pointBalance as int,
    ));
  }

  @override
  $RedemptionProductModelCopyWith<$Res> get redemptionProduct {
    if (_value.redemptionProduct == null) {
      return null;
    }
    return $RedemptionProductModelCopyWith<$Res>(_value.redemptionProduct,
        (value) {
      return _then(_value.copyWith(redemptionProduct: value));
    });
  }
}

/// @nodoc
abstract class _$RedemptionRedeemModelCopyWith<$Res>
    implements $RedemptionRedeemModelCopyWith<$Res> {
  factory _$RedemptionRedeemModelCopyWith(_RedemptionRedeemModel value,
          $Res Function(_RedemptionRedeemModel) then) =
      __$RedemptionRedeemModelCopyWithImpl<$Res>;
  @override
  $Res call({RedemptionProductModel redemptionProduct, int pointBalance});

  @override
  $RedemptionProductModelCopyWith<$Res> get redemptionProduct;
}

/// @nodoc
class __$RedemptionRedeemModelCopyWithImpl<$Res>
    extends _$RedemptionRedeemModelCopyWithImpl<$Res>
    implements _$RedemptionRedeemModelCopyWith<$Res> {
  __$RedemptionRedeemModelCopyWithImpl(_RedemptionRedeemModel _value,
      $Res Function(_RedemptionRedeemModel) _then)
      : super(_value, (v) => _then(v as _RedemptionRedeemModel));

  @override
  _RedemptionRedeemModel get _value => super._value as _RedemptionRedeemModel;

  @override
  $Res call({
    Object redemptionProduct = freezed,
    Object pointBalance = freezed,
  }) {
    return _then(_RedemptionRedeemModel(
      redemptionProduct: redemptionProduct == freezed
          ? _value.redemptionProduct
          : redemptionProduct as RedemptionProductModel,
      pointBalance:
          pointBalance == freezed ? _value.pointBalance : pointBalance as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_RedemptionRedeemModel implements _RedemptionRedeemModel {
  const _$_RedemptionRedeemModel({this.redemptionProduct, this.pointBalance});

  factory _$_RedemptionRedeemModel.fromJson(Map<String, dynamic> json) =>
      _$_$_RedemptionRedeemModelFromJson(json);

  @override
  final RedemptionProductModel redemptionProduct;
  @override
  final int pointBalance;

  @override
  String toString() {
    return 'RedemptionRedeemModel(redemptionProduct: $redemptionProduct, pointBalance: $pointBalance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RedemptionRedeemModel &&
            (identical(other.redemptionProduct, redemptionProduct) ||
                const DeepCollectionEquality()
                    .equals(other.redemptionProduct, redemptionProduct)) &&
            (identical(other.pointBalance, pointBalance) ||
                const DeepCollectionEquality()
                    .equals(other.pointBalance, pointBalance)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(redemptionProduct) ^
      const DeepCollectionEquality().hash(pointBalance);

  @override
  _$RedemptionRedeemModelCopyWith<_RedemptionRedeemModel> get copyWith =>
      __$RedemptionRedeemModelCopyWithImpl<_RedemptionRedeemModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RedemptionRedeemModelToJson(this);
  }
}

abstract class _RedemptionRedeemModel implements RedemptionRedeemModel {
  const factory _RedemptionRedeemModel(
      {RedemptionProductModel redemptionProduct,
      int pointBalance}) = _$_RedemptionRedeemModel;

  factory _RedemptionRedeemModel.fromJson(Map<String, dynamic> json) =
      _$_RedemptionRedeemModel.fromJson;

  @override
  RedemptionProductModel get redemptionProduct;
  @override
  int get pointBalance;
  @override
  _$RedemptionRedeemModelCopyWith<_RedemptionRedeemModel> get copyWith;
}
