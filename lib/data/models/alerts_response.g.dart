// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alerts_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AlertResponse _$_$_AlertResponseFromJson(Map<String, dynamic> json) {
  return _$_AlertResponse(
    alerts: (json['alerts'] as List)
        ?.map((e) =>
            e == null ? null : AlertModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    unseenAlertCount: json['unseenAlertCount'] as int,
  );
}

Map<String, dynamic> _$_$_AlertResponseToJson(_$_AlertResponse instance) =>
    <String, dynamic>{
      'alerts': instance.alerts,
      'unseenAlertCount': instance.unseenAlertCount,
    };
