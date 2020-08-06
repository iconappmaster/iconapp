import 'package:flutter/foundation.dart';
import 'package:iconapp/data/models/conversation_response.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';

abstract class ChatSettingsRepository {
  Future<bool> changeColor(int colorIndex);
  Future<ConversationResponse> addUser(int conversationId, int userId);
  Future<ConversationResponse> removeUser(int conversationId, int userId);
  Future<bool> makeAdmin(UserModel colorIndex);
}

class ChatSettingsRepositoryImpl implements ChatSettingsRepository {
  final RestClient restClient;

  ChatSettingsRepositoryImpl({@required this.restClient});

  @override
  Future<bool> changeColor(int colorIndex) async {
    
  }

  @override
  Future<ConversationResponse> addUser(int conversationId, int userId) async {
    return await restClient.addUser(conversationId, userId);
  }

  @override
  Future<ConversationResponse> removeUser(int conversationId, int userId) async {
    return await restClient.removeUser(conversationId, userId);
  }

  @override
  Future<bool> makeAdmin(UserModel colorIndex) async {

  }
}
