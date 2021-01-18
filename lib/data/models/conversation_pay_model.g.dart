// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_pay_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ConversationPayModel _$_$_ConversationPayModelFromJson(
    Map<String, dynamic> json) {
  return _$_ConversationPayModel(
    conversation: json['conversation'] == null
        ? null
        : Conversation.fromJson(json['conversation'] as Map<String, dynamic>),
    user: json['user'] == null
        ? null
        : UserModel.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_ConversationPayModelToJson(
        _$_ConversationPayModel instance) =>
    <String, dynamic>{
      'conversation': instance.conversation,
      'user': instance.user,
    };
