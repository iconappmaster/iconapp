import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/data/models/photo_model.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/data/sources/local/shared_preferences.dart';

part 'conversation_model.freezed.dart';
part 'conversation_model.g.dart';

@freezed
abstract class Conversation with _$Conversation {
  const factory Conversation({
    final int id,
    final int backgroundColor,
    final PhotoModel backgroundPhoto,
    final int categoryId,
    final UserModel createdBy,
    final bool isPinned,
    final int createdAt,
    final String name,
    final PhotoModel photo,
    final MessageModel lastMessage,
    final int unreadMessageCount,
    final List<UserModel> users,
    final List<MessageModel> messages,
    final bool isSubscribed,
    final int numberOfAdminsRemaining,
    final int numberOfParticipants,
    final bool areNotificationsEnabled,
    final UserRole userRole,
  }) = _Conversation;

  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);
}
