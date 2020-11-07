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
    messageType:
        _$enumDecodeNullable(_$MessageTypeEnumMap, json['messageType']),
    sender: json['sender'] == null
        ? null
        : UserModel.fromJson(json['sender'] as Map<String, dynamic>),
    likeCounts: json['likeCounts'] == null
        ? null
        : LikesCount.fromJson(json['likeCounts'] as Map<String, dynamic>),
    likeType: json['likeType'] as String,
    status: _$enumDecodeNullable(_$MessageStatusEnumMap, json['status']),
    extraData: json['extraData'] as String,
    repliedToMessage: json['repliedToMessage'] == null
        ? null
        : MessageModel.fromJson(
            json['repliedToMessage'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_MessageModelToJson(_$_MessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timestamp': instance.timestamp,
      'body': instance.body,
      'wasSeen': instance.wasSeen,
      'messageType': _$MessageTypeEnumMap[instance.messageType],
      'sender': instance.sender,
      'likeCounts': instance.likeCounts,
      'likeType': instance.likeType,
      'status': _$MessageStatusEnumMap[instance.status],
      'extraData': instance.extraData,
      'repliedToMessage': instance.repliedToMessage,
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
  MessageType.loading: 'loading',
};

const _$MessageStatusEnumMap = {
  MessageStatus.pending: 'pending',
  MessageStatus.sent: 'sent',
  MessageStatus.sendingEmoji: 'sendingEmoji',
  MessageStatus.compressing: 'compressing',
};
