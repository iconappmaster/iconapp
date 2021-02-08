import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/data/sources/local/shared_preferences.dart';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';
import 'package:iconapp/data/sources/socket/socket_manager.dart';
import '../../core/extensions/string_ext.dart';
import '../../core/extensions/int_ext.dart';

abstract class ChatRepository {
  Future<Conversation> getRemoteConversaion(int chatId, {int limit, int offset});
  Future<Conversation> getCachedConversation(int chatId);
  Future<bool> cacheConversation(Conversation conversation);
  Future<MessageModel> sendMessage(int conversationId, MessageModel message);
  Future<Conversation> subscribe(int id);
  Future<Conversation> unsubscribe(int id);
  Future<MessageModel> likeMessage(int messageId, String likeType);
  Future<MessageModel> unlikeMessage(int messageId, String likeType);
  Future pinConversation(int conversationId, bool isPinned);
  Future conversationViewed(int conversationId);
  Future block(int conversationId);
  Future report(int conversationId, String text);
  Future deleteMessage(int conversationId, int messageId);
  Future viewedVideo(int messageId);
  Future requestToJoinConversation(int conversationId);
  Stream<MessageModel> watchMessages();
  Stream<MessageModel> watchAddLike();
  Stream<MessageModel> watchRemoveLike();
  Stream<int> watchDeletedMessage();
}

class ChatRepositoryImpl implements ChatRepository {
  final RestClient remote;
  final SharedPreferencesService cache;
  final Socket socket;

  ChatRepositoryImpl({
    @required this.remote,
    @required this.cache,
    @required this.socket,
  });

  @override
  Future<Conversation> getRemoteConversaion(int chatId, {int limit, int offset}) async {
    return await remote.getConversaion(
      chatId,
      limit: limit,
      offset: offset,
    );
  }

  @override
  Future<Conversation> getCachedConversation(int id) async {
    if (cache.containsCustom(id.converastionKey())) {
      final json = await cache.getCustomString(id.converastionKey());
      return Conversation.fromJson(jsonDecode(json));
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
  Future<MessageModel> sendMessage(int conversationId, MessageModel message) async {
    return await remote.sendMessage(
      conversationId ?? '',
      message?.body ?? '',
      message?.messageType?.toString()?.parseEnum() ?? "",
      message?.extraData ?? '',
      message?.repliedToMessage?.id ?? 0,
      message?.timestamp ?? 0,
      message?.messageDescription ?? '',
    );
  }

  @override
  Stream<MessageModel> watchMessages() {
    return socket.messageSubject;
  }

  @override
  Stream<MessageModel> watchAddLike() {
    return socket.addedLikeSubject;
  }

  @override
  Stream<int> watchDeletedMessage() {
    return socket.deleteMessageSubject;
  }

  @override
  Stream<MessageModel> watchRemoveLike() {
    return socket.removeLikeSubject;
  }

  @override
  Future pinConversation(int conversationId, bool isPinned) async {
    return await remote.pinConversation(conversationId, isPinned);
  }

  @override
  Future conversationViewed(int conversationId) async {
    return await remote.viewedConversation(conversationId);
  }

  @override
  Future block(int conversationId) async {
    return await remote.block(conversationId);
  }

  @override
  Future report(int conversationId, String text) async {
    return await remote.report(conversationId, text);
  }

  @override
  Future deleteMessage(int conversationId, int messageId) async {
    return await remote.deleteMessage(conversationId, messageId);
  }

  @override
  Future viewedVideo(int messageId) async {
    return await remote.viewedVideo(messageId);
  }

  @override
  Future requestToJoinConversation(int conversationId) async {
    return await remote.requestToJoinConversation(conversationId);
  }
}
