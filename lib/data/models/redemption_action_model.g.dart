// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'redemption_action_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RedemptionActionModel _$_$_RedemptionActionModelFromJson(
    Map<String, dynamic> json) {
  return _$_RedemptionActionModel(
    creditActionId: json['creditActionId'] as int,
    creditActionName: json['creditActionName'] as String,
    pointsReceived: json['pointsReceived'] as int,
    earnedAt: json['earnedAt'] as int,
  );
}

Map<String, dynamic> _$_$_RedemptionActionModelToJson(
        _$_RedemptionActionModel instance) =>
    <String, dynamic>{
      'creditActionId': instance.creditActionId,
      'creditActionName': instance.creditActionName,
      'pointsReceived': instance.pointsReceived,
      'earnedAt': instance.earnedAt,
    };
