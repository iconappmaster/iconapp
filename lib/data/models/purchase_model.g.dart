// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PurchaseModele _$_$_PurchaseModeleFromJson(Map<String, dynamic> json) {
  return _$_PurchaseModele(
    purchaseToken: json['purchaseToken'] as String,
    productId: json['productId'] as String,
    orderId: json['orderId'] as String,
    receiptCode: json['receiptCode'] as String,
  );
}

Map<String, dynamic> _$_$_PurchaseModeleToJson(_$_PurchaseModele instance) =>
    <String, dynamic>{
      'purchaseToken': instance.purchaseToken,
      'productId': instance.productId,
      'orderId': instance.orderId,
      'receiptCode': instance.receiptCode,
    };
