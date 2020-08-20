// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MessageModel _$_$_MessageModelFromJson(Map<String, dynamic> json) {
  return _$_MessageModel(
    id: json['id'] as int,
    timestamp: json['timestamp'] as int,
    body: json['body'] as String,
    wasSeen: json['wasSeen'] as bool,
    type: _$enumDecodeNullable(_$MessageTypeEnumMap, json['type']),
    sender: json['sender'] == null
        ? null
        : UserModel.fromJson(json['sender'] as Map<String, dynamic>),
    likeCounts: json['likeCounts'],
    isLiked: json['isLiked'] as bool,
    status: _$enumDecodeNullable(_$MessageStatusEnumMap, json['status']),
    extraData: json['extraData'] as String,
  );
}

Map<String, dynamic> _$_$_MessageModelToJson(_$_MessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timestamp': instance.timestamp,
      'body': instance.body,
      'wasSeen': instance.wasSeen,
      'type': _$MessageTypeEnumMap[instance.type],
      'sender': instance.sender,
      'likeCounts': instance.likeCounts,
      'isLiked': instance.isLiked,
      'status': _$MessageStatusEnumMap[instance.status],
      'extraData': instance.extraData,
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

const _$MessageTypeEnumMap = {
  MessageType.text: 'text',
  MessageType.photo: 'photo',
  MessageType.video: 'video',
  MessageType.voice: 'voice',
  MessageType.system: 'system',
};

const _$MessageStatusEnumMap = {
  MessageStatus.pending: 'pending',
  MessageStatus.sent: 'sent',
};
