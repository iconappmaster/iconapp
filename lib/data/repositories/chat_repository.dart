import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/data/sources/local/shared_preferences.dart';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';
import 'package:iconapp/stores/socket/socket_manager.dart';
import '../../core/extensions/string_ext.dart';
import '../../core/extensions/int_ext.dart';

abstract class ChatRepository {
  Future<Conversation> getRemoteConversaion(int chatId);
  Future<Conversation> getCachedConversation(int chatId);
  Future<bool> cacheConversation(Conversation conversation);
  Future<MessageModel> sendMessage(int conversationId, MessageModel message);
  Future<Conversation> subscribe(int id);
  Future<Conversation> unsubscribe(int id);
  Future<MessageModel> likeMessage(int messageId, String likeType);
  Future<MessageModel> unlikeMessage(int messageId, String likeType);
  Stream<MessageModel> watchMessages();
  Future pinConversation(int conversationId, bool isPinned);
  Future conversationViewed(int conversationId);
}

class ChatRepositoryImpl implements ChatRepository {
  final RestClient remote;
  final SharedPreferencesService cache;
  final SocketStore socket;

  ChatRepositoryImpl({
    @required this.remote,
    @required this.cache,
    @required this.socket,
  });

  @override
  Future<Conversation> getRemoteConversaion(int chatId) async {
    return await remote.getConversaion(chatId);
  }

  @override
  Future<Conversation> getCachedConversation(int id) async {
    if (cache.containsCustom(id.converastionKey())) {
      final json = await cache.getCustomString(id.converastionKey());
      final conversation = Conversation.fromJson(jsonDecode(json));
      return conversation;
    }

    return null;
  }

  @override
  Future<bool> cacheConversation(Conversation conversation) async {
    final json = jsonEncode(conversation);
    return await cache.setCustomString(conversation.id.converastionKey(), json);
  }

  @override
  Future<Conversation> subscribe(int id) async {
    return await remote.subscribe(id);
  }

  @override
  Future<Conversation> unsubscribe(int id) async {
    return await remote.unsubscribe(id);
  }

  @override
  Future<MessageModel> likeMessage(int messageId, String likeType) async {
    return await remote.likeMessage(messageId, likeType);
  }

  @override
  Future<MessageModel> unlikeMessage(int messageId, String likeType) async {
    return await remote.unlikeMessage(messageId, likeType);
  }

  @override
  Future<MessageModel> sendMessage(
      int conversationId, MessageModel message) async {
    return await remote.sendMessage(
      conversationId,
      message.body,
      message.messageType.toString().parseEnum(),
      message?.extraData ?? '',
    );
  }

  @override
  Stream<MessageModel> watchMessages() {
    return socket.messageObserver;
  }

  @override
  Future pinConversation(int conversationId, bool isPinned) async {
    return await remote.pinConversation(conversationId, isPinned);
  }

  @override
  Future conversationViewed(int conversationId) async {
    return await remote.viewedConversation(conversationId);
  }
}
