import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';

abstract class ChatSettingsRepository {
  Future<Conversation> changeBackgroundColor(
      int conversationId, int colorIndex);
  Future<Conversation> addUser(int conversationId, int userId);
  Future<Conversation> removeUser(int conversationId, int userId);
  Future<Conversation> makeUserAdmin(int conversationId, int userId);
  Future<Conversation> updateConversation(
      int conversationId, Conversation conversation);
  Future setNotification(int conversationId, bool isOn);
}

class ChatSettingsRepositoryImpl implements ChatSettingsRepository {
  final RestClient restClient;

  ChatSettingsRepositoryImpl({@required this.restClient});

  @override
  Future<Conversation> changeBackgroundColor(
      int conversationId, int colorIndex) async {
    return restClient.updateConversation(
        conversationId, Conversation(backgroundColor: colorIndex));
  }

  @override
  Future<Conversation> addUser(int conversationId, int userId) async {
    return await restClient.addUser(conversationId, userId);
  }

  @override
  Future<Conversation> removeUser(
      int conversationId, int userId) async {
    return await restClient.removeUser(conversationId, userId);
  }

  @override
  Future<Conversation> makeUserAdmin(
      int conversationId, int userId) async {
    return await restClient.makeUserAdmin(conversationId, userId);
  }

  @override
  Future<Conversation> updateConversation(
      conversationId, Conversation conversation) {
    return restClient.updateConversation(conversationId, conversation);
  }

  @override
  Future setNotification(int conversationId, bool isOn) async {
    if (isOn) {
      return await restClient.turnOnConversationNotifications(conversationId);
    } else {
      return await restClient.turnOffConversationNotifications(conversationId);
    }
  }
}
