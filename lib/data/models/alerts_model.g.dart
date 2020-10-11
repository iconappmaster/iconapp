// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alerts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AlertModel _$_$_AlertModelFromJson(Map<String, dynamic> json) {
  return _$_AlertModel(
    id: json['id'] as int,
    alertMessage: json['alertMessage'] as String,
    timestamp: json['timestamp'] as int,
    conversation: json['conversation'] == null
        ? null
        : Conversation.fromJson(json['conversation'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_AlertModelToJson(_$_AlertModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'alertMessage': instance.alertMessage,
      'timestamp': instance.timestamp,
      'conversation': instance.conversation,
    };
