// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModel _$_$_ProductModelFromJson(Map<String, dynamic> json) {
  return _$_ProductModel(
    id: json['id'] as int,
    name: json['name'] as String,
    description: json['description'] as String,
    price: json['price'] as int,
    redemptionCode: json['redemptionCode'] as String,
    redemptionUrl: json['redemptionUrl'] as String,
  );
}

Map<String, dynamic> _$_$_ProductModelToJson(_$_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'redemptionCode': instance.redemptionCode,
      'redemptionUrl': instance.redemptionUrl,
    };
