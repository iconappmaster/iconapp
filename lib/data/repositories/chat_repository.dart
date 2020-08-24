import 'package:flutter/foundation.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';
import 'package:iconapp/stores/socket/socket_manager.dart';
import '../../core/extensions/string_ext.dart';

abstract class ChatRepository {
  Future<Conversation> getConversaion(int chatId);
  Future<MessageModel> sendMessage(int conversationId, MessageModel message);
  Future<Conversation> subscribe(int id);
  Future<Conversation> unsubscribe(int id);
  Future<MessageModel> likeMessage(int messageId);
  Future<MessageModel> unlikeMessage(int messageId);
  Stream<MessageModel> watchMessages();
  Future pinConversation(int conversationId, bool isPinned);
  Future conversationViewed(int conversationId);
}

class ChatRepositoryImpl implements ChatRepository {
  final RestClient restClient;
  final SocketStore socket;

  ChatRepositoryImpl({
    @required this.restClient,
    @required this.socket,
  });

  @override
  Future<Conversation> getConversaion(int chatId) async {
    return await restClient.getConversaion(chatId);
  }

  @override
  Future<Conversation> subscribe(int id) async {
    return await restClient.subscribe(id);
  }

  @override
  Future<Conversation> unsubscribe(int id) async {
    return await restClient.unsubscribe(id);
  }

  @override
  Future<MessageModel> likeMessage(int messageId) async {
    return await restClient.likeMessage(messageId);
  }

  @override
  Future<MessageModel> unlikeMessage(int messageId) async {
    return await restClient.unlikeMessage(messageId);
  }

  @override
  Future<MessageModel> sendMessage(
      int conversationId, MessageModel message) async {
    return await restClient.sendMessage(
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
    return await restClient.pinConversation(conversationId, isPinned);
  }

  @override
  Future conversationViewed(int conversationId) async {
    return await restClient.viewedConversation(conversationId);
  }
}
