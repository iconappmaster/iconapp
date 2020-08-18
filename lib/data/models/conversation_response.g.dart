// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ConversationResponse _$_$_ConversationResponseFromJson(
    Map<String, dynamic> json) {
  return _$_ConversationResponse(
    isSubscribed: json['isSubscribed'] as bool,
    isPinned: json['isPinned'] as bool,
    isNotification: json['isNotification'] as bool,
    userRole: _$enumDecodeNullable(_$UserRoleEnumMap, json['userRole']),
    conversation: json['conversation'] == null
        ? null
        : Conversation.fromJson(json['conversation'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_ConversationResponseToJson(
        _$_ConversationResponse instance) =>
    <String, dynamic>{
      'isSubscribed': instance.isSubscribed,
      'isPinned': instance.isPinned,
      'isNotification': instance.isNotification,
      'userRole': _$UserRoleEnumMap[instance.userRole],
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

const _$UserRoleEnumMap = {
  UserRole.viewer: 'viewer',
  UserRole.admin: 'admin',
  UserRole.contributor: 'contributor',
};
