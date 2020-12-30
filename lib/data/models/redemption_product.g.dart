// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'redemption_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RedemptionProductModel _$_$_RedemptionProductModelFromJson(
    Map<String, dynamic> json) {
  return _$_RedemptionProductModel(
    id: json['id'] as int,
    name: json['name'] as String,
    description: json['description'] as String,
    price: json['price'] as int,
    redemptionCode: json['redemptionCode'] as String,
    redemptionUrl: json['redemptionUrl'] as String,
  );
}

Map<String, dynamic> _$_$_RedemptionProductModelToJson(
        _$_RedemptionProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'redemptionCode': instance.redemptionCode,
      'redemptionUrl': instance.redemptionUrl,
    };
