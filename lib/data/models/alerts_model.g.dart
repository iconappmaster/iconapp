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
    alertType: _$enumDecodeNullable(_$AlertTypeEnumMap, json['alertType']),
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
      'alertType': _$AlertTypeEnumMap[instance.alertType],
      'conversation': instance.conversation,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$AlertTypeEnumMap = {
  AlertType.request_to_join_conversation: 'request_to_join_conversation',
  AlertType.opened_conversation_for_comments:
      'opened_conversation_for_comments',
};
