// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) {
  return MessageModel(
    likeCount: json['likeCount'] as int,
    timestamp: json['timestamp'] as int,
    body: json['body'] as String,
    wasSeen: json['wasSeen'] as bool,
    type: _$enumDecodeNullable(_$MessageTypeEnumMap, json['type']),
    sender: json['sender'] == null
        ? null
        : UserModel.fromJson(json['sender'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'body': instance.body,
      'wasSeen': instance.wasSeen,
      'type': _$MessageTypeEnumMap[instance.type],
      'sender': instance.sender,
      'likeCount': instance.likeCount,
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
  MessageType.audio: 'audio',
};
