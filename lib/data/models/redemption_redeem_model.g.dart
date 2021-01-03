// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'redemption_redeem_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RedemptionRedeemModel _$_$_RedemptionRedeemModelFromJson(
    Map<String, dynamic> json) {
  return _$_RedemptionRedeemModel(
    redemptionProduct: json['redemptionProduct'] == null
        ? null
        : RedemptionProductModel.fromJson(
            json['redemptionProduct'] as Map<String, dynamic>),
    pointBalance: json['pointBalance'] as int,
  );
}

Map<String, dynamic> _$_$_RedemptionRedeemModelToJson(
        _$_RedemptionRedeemModel instance) =>
    <String, dynamic>{
      'redemptionProduct': instance.redemptionProduct,
      'pointBalance': instance.pointBalance,
    };
