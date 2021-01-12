// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'purchase_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
PurchaseModel _$PurchaseModelFromJson(Map<String, dynamic> json) {
  return _PurchaseModele.fromJson(json);
}

/// @nodoc
class _$PurchaseModelTearOff {
  const _$PurchaseModelTearOff();

// ignore: unused_element
  _PurchaseModele call(
      {String purchaseToken,
      String productId,
      String orderId,
      String receiptCode}) {
    return _PurchaseModele(
      purchaseToken: purchaseToken,
      productId: productId,
      orderId: orderId,
      receiptCode: receiptCode,
    );
  }

// ignore: unused_element
  PurchaseModel fromJson(Map<String, Object> json) {
    return PurchaseModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $PurchaseModel = _$PurchaseModelTearOff();

/// @nodoc
mixin _$PurchaseModel {
  String get purchaseToken;
  String get productId;
  String get orderId;
  String get receiptCode;

  Map<String, dynamic> toJson();
  $PurchaseModelCopyWith<PurchaseModel> get copyWith;
}

/// @nodoc
abstract class $PurchaseModelCopyWith<$Res> {
  factory $PurchaseModelCopyWith(
          PurchaseModel value, $Res Function(PurchaseModel) then) =
      _$PurchaseModelCopyWithImpl<$Res>;
  $Res call(
      {String purchaseToken,
      String productId,
      String orderId,
      String receiptCode});
}

/// @nodoc
class _$PurchaseModelCopyWithImpl<$Res>
    implements $PurchaseModelCopyWith<$Res> {
  _$PurchaseModelCopyWithImpl(this._value, this._then);

  final PurchaseModel _value;
  // ignore: unused_field
  final $Res Function(PurchaseModel) _then;

  @override
  $Res call({
    Object purchaseToken = freezed,
    Object productId = freezed,
    Object orderId = freezed,
    Object receiptCode = freezed,
  }) {
    return _then(_value.copyWith(
      purchaseToken: purchaseToken == freezed
          ? _value.purchaseToken
          : purchaseToken as String,
      productId: productId == freezed ? _value.productId : productId as String,
      orderId: orderId == freezed ? _value.orderId : orderId as String,
      receiptCode:
          receiptCode == freezed ? _value.receiptCode : receiptCode as String,
    ));
  }
}

/// @nodoc
abstract class _$PurchaseModeleCopyWith<$Res>
    implements $PurchaseModelCopyWith<$Res> {
  factory _$PurchaseModeleCopyWith(
          _PurchaseModele value, $Res Function(_PurchaseModele) then) =
      __$PurchaseModeleCopyWithImpl<$Res>;
  @override
  $Res call(
      {String purchaseToken,
      String productId,
      String orderId,
      String receiptCode});
}

/// @nodoc
class __$PurchaseModeleCopyWithImpl<$Res>
    extends _$PurchaseModelCopyWithImpl<$Res>
    implements _$PurchaseModeleCopyWith<$Res> {
  __$PurchaseModeleCopyWithImpl(
      _PurchaseModele _value, $Res Function(_PurchaseModele) _then)
      : super(_value, (v) => _then(v as _PurchaseModele));

  @override
  _PurchaseModele get _value => super._value as _PurchaseModele;

  @override
  $Res call({
    Object purchaseToken = freezed,
    Object productId = freezed,
    Object orderId = freezed,
    Object receiptCode = freezed,
  }) {
    return _then(_PurchaseModele(
      purchaseToken: purchaseToken == freezed
          ? _value.purchaseToken
          : purchaseToken as String,
      productId: productId == freezed ? _value.productId : productId as String,
      orderId: orderId == freezed ? _value.orderId : orderId as String,
      receiptCode:
          receiptCode == freezed ? _value.receiptCode : receiptCode as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_PurchaseModele implements _PurchaseModele {
  const _$_PurchaseModele(
      {this.purchaseToken, this.productId, this.orderId, this.receiptCode});

  factory _$_PurchaseModele.fromJson(Map<String, dynamic> json) =>
      _$_$_PurchaseModeleFromJson(json);

  @override
  final String purchaseToken;
  @override
  final String productId;
  @override
  final String orderId;
  @override
  final String receiptCode;

  @override
  String toString() {
    return 'PurchaseModel(purchaseToken: $purchaseToken, productId: $productId, orderId: $orderId, receiptCode: $receiptCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PurchaseModele &&
            (identical(other.purchaseToken, purchaseToken) ||
                const DeepCollectionEquality()
                    .equals(other.purchaseToken, purchaseToken)) &&
            (identical(other.productId, productId) ||
                const DeepCollectionEquality()
                    .equals(other.productId, productId)) &&
            (identical(other.orderId, orderId) ||
                const DeepCollectionEquality()
                    .equals(other.orderId, orderId)) &&
            (identical(other.receiptCode, receiptCode) ||
                const DeepCollectionEquality()
                    .equals(other.receiptCode, receiptCode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(purchaseToken) ^
      const DeepCollectionEquality().hash(productId) ^
      const DeepCollectionEquality().hash(orderId) ^
      const DeepCollectionEquality().hash(receiptCode);

  @override
  _$PurchaseModeleCopyWith<_PurchaseModele> get copyWith =>
      __$PurchaseModeleCopyWithImpl<_PurchaseModele>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PurchaseModeleToJson(this);
  }
}

abstract class _PurchaseModele implements PurchaseModel {
  const factory _PurchaseModele(
      {String purchaseToken,
      String productId,
      String orderId,
      String receiptCode}) = _$_PurchaseModele;

  factory _PurchaseModele.fromJson(Map<String, dynamic> json) =
      _$_PurchaseModele.fromJson;

  @override
  String get purchaseToken;
  @override
  String get productId;
  @override
  String get orderId;
  @override
  String get receiptCode;
  @override
  _$PurchaseModeleCopyWith<_PurchaseModele> get copyWith;
}
