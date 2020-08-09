import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/data/models/conversation_response.dart';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';

abstract class ChatSettingsRepository {
  Future<bool> changeColor(int colorIndex);
  Future<ConversationResponse> addUser(int conversationId, int userId);
  Future<ConversationResponse> removeUser(int conversationId, int userId);
  Future<ConversationResponse> makeUserAdmin(int conversationId, int userId);
  Future<ConversationResponse> updateName(
      int conversationId, Conversation conversation);
}

class ChatSettingsRepositoryImpl implements ChatSettingsRepository {
  final RestClient restClient;

  ChatSettingsRepositoryImpl({@required this.restClient});

  @override
  Future<bool> changeColor(int colorIndex) async {
    // make call to change color
  }

  @override
  Future<ConversationResponse> addUser(int conversationId, int userId) async {
    return await restClient.addUser(conversationId, userId);
  }

  @override
  Future<ConversationResponse> removeUser(
      int conversationId, int userId) async {
    return await restClient.removeUser(conversationId, userId);
  }

  @override
  Future<ConversationResponse> makeUserAdmin(
      int conversationId, int userId) async {
    return await restClient.makeUserAdmin(conversationId, userId);
  }

  @override
  Future<ConversationResponse> updateName(
      conversationId, Conversation conversation) {
    return restClient.updateConversation(conversationId, conversation);
  }
}
