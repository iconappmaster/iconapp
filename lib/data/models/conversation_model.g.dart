// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Conversation _$_$_ConversationFromJson(Map<String, dynamic> json) {
  return _$_Conversation(
    id: json['id'] as int,
    backgroundColor: json['backgroundColor'] as int,
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
    backgroundPhoto: json['backgroundPhoto'] == null
        ? null
        : PhotoModel.fromJson(json['backgroundPhoto'] as Map<String, dynamic>),
    lastMessage: json['lastMessage'] == null
        ? null
        : MessageModel.fromJson(json['lastMessage'] as Map<String, dynamic>),
    unreadMessageCount: json['unreadMessageCount'] as int,
    users: (json['users'] as List)
        ?.map((e) =>
            e == null ? null : UserModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    messages: (json['messages'] as List)
        ?.map((e) =>
            e == null ? null : MessageModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    isSubscribed: json['isSubscribed'] as bool,
  );
}

Map<String, dynamic> _$_$_ConversationToJson(_$_Conversation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'backgroundColor': instance.backgroundColor,
      'categoryId': instance.categoryId,
      'createdBy': instance.createdBy,
      'isPinned': instance.isPinned,
      'createdAt': instance.createdAt,
      'name': instance.name,
      'photo': instance.photo,
      'backgroundPhoto': instance.backgroundPhoto,
      'lastMessage': instance.lastMessage,
      'unreadMessageCount': instance.unreadMessageCount,
      'users': instance.users,
      'messages': instance.messages,
      'isSubscribed': instance.isSubscribed,
    };
