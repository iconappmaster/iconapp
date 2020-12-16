import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/conversation_media.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/data/models/photo_model.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/data/sources/local/shared_preferences.dart';

import 'conversation_media.dart';

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
    final bool shouldShowNewBadge,
    final List<UserModel> users,
    final List<MessageModel> messages,
    final bool isSubscribed,
    final int numberOfAdminsRemaining,
    final int numberOfParticipants,
    final bool shouldShowNewCommentsBadge,
    final bool areNotificationsDisabled,
    final bool areCommentsActivated,
    final bool isPopular,
    final int commentsMaxUserCount,
    final UserRole userRole,
    final ConversationType type,
    final ConversationMedia media,
  }) = _Conversation;

  factory Conversation.loadFCMFromCache() {
    final sp = sl<SharedPreferencesService>();
    final savedConversation = sp.getString(StorageKey.fcmConversation);
    final json = jsonDecode(savedConversation);
    final conversation = Conversation.fromJson(json);
    return conversation;
  }

  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);
}

enum ConversationType { conversation, ad }
