// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationModel _$ConversationModelFromJson(Map<String, dynamic> json) {
  return ConversationModel(
    (json['messages'] as List)
        ?.map((e) =>
            e == null ? null : MessageModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['participant'] as List)
        ?.map((e) =>
            e == null ? null : UserModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['title'] as String,
    json['onlineUsers'] as int,
  );
}

Map<String, dynamic> _$ConversationModelToJson(ConversationModel instance) =>
    <String, dynamic>{
      'messages': instance.messages,
      'participant': instance.participant,
      'title': instance.title,
      'onlineUsers': instance.onlineUsers,
    };
