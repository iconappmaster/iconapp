// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_action_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreditActionModel _$_$_CreditActionModelFromJson(Map<String, dynamic> json) {
  return _$_CreditActionModel(
    creditActionId: json['creditActionId'] as int,
    creditActionName: json['creditActionName'] as String,
    pointsReceived: json['pointsReceived'] as int,
    earnedAt: json['earnedAt'] as String,
  );
}

Map<String, dynamic> _$_$_CreditActionModelToJson(
        _$_CreditActionModel instance) =>
    <String, dynamic>{
      'creditActionId': instance.creditActionId,
      'creditActionName': instance.creditActionName,
      'pointsReceived': instance.pointsReceived,
      'earnedAt': instance.earnedAt,
    };
