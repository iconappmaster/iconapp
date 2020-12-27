// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Conversation _$_$_ConversationFromJson(Map<String, dynamic> json) {
  return _$_Conversation(
    id: json['id'] as int,
    backgroundColor: json['backgroundColor'] as int,
    backgroundPhoto: json['backgroundPhoto'] == null
        ? null
        : PhotoModel.fromJson(json['backgroundPhoto'] as Map<String, dynamic>),
    categoryId: json['categoryId'] as int,
    createdBy: json['createdBy'] == null
        ? null
        : UserModel.fromJson(json['createdBy'] as Map<String, dynamic>),
    isPinned: json['isPinned'] as bool,
    createdAt: json['createdAt'] as int,
    name: json['name'] as String,
    photo: json['photo'] == null
        ? null
        : PhotoModel.fromJson(json['photo'] as Map<String, dynamic>),
    lastMessage: json['lastMessage'] == null
        ? null
        : MessageModel.fromJson(json['lastMessage'] as Map<String, dynamic>),
    shouldShowNewBadge: json['shouldShowNewBadge'] as bool,
    users: (json['users'] as List)
        ?.map((e) =>
            e == null ? null : UserModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    messages: (json['messages'] as List)
        ?.map((e) =>
            e == null ? null : MessageModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    isSubscribed: json['isSubscribed'] as bool,
    numberOfAdminsRemaining: json['numberOfAdminsRemaining'] as int,
    numberOfParticipants: json['numberOfParticipants'] as int,
    shouldShowNewCommentsBadge: json['shouldShowNewCommentsBadge'] as bool,
    areNotificationsDisabled: json['areNotificationsDisabled'] as bool,
    areCommentsActivated: json['areCommentsActivated'] as bool,
    isPopular: json['isPopular'] as bool,
    commentsMaxUserCount: json['commentsMaxUserCount'] as int,
    userRole: _$enumDecodeNullable(_$UserRoleEnumMap, json['userRole']),
    conversationType: _$enumDecodeNullable(
        _$ConversationTypeEnumMap, json['conversationType']),
    media: json['media'] == null
        ? null
        : ConversationMedia.fromJson(json['media'] as Map<String, dynamic>),
    entranceCode: json['entranceCode'] as int,
    isAllowedIn: json['isAllowedIn'] as bool,
  );
}

Map<String, dynamic> _$_$_ConversationToJson(_$_Conversation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'backgroundColor': instance.backgroundColor,
      'backgroundPhoto': instance.backgroundPhoto,
      'categoryId': instance.categoryId,
      'createdBy': instance.createdBy,
      'isPinned': instance.isPinned,
      'createdAt': instance.createdAt,
      'name': instance.name,
      'photo': instance.photo,
      'lastMessage': instance.lastMessage,
      'shouldShowNewBadge': instance.shouldShowNewBadge,
      'users': instance.users,
      'messages': instance.messages,
      'isSubscribed': instance.isSubscribed,
      'numberOfAdminsRemaining': instance.numberOfAdminsRemaining,
      'numberOfParticipants': instance.numberOfParticipants,
      'shouldShowNewCommentsBadge': instance.shouldShowNewCommentsBadge,
      'areNotificationsDisabled': instance.areNotificationsDisabled,
      'areCommentsActivated': instance.areCommentsActivated,
      'isPopular': instance.isPopular,
      'commentsMaxUserCount': instance.commentsMaxUserCount,
      'userRole': _$UserRoleEnumMap[instance.userRole],
      'conversationType': _$ConversationTypeEnumMap[instance.conversationType],
      'media': instance.media,
      'entranceCode': instance.entranceCode,
      'isAllowedIn': instance.isAllowedIn,
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

const _$ConversationTypeEnumMap = {
  ConversationType.public: 'public',
  ConversationType.private_code: 'private_code',
  ConversationType.private_premium: 'private_premium',
};
