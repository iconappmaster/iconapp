import 'package:iconapp/data/models/conversation_response.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';
import '../../core/extensions/string_ext.dart';

abstract class ChatRepository {
  Future<ConversationResponse> getConversaion(int chatId);
  Future<MessageModel> sendMessage(
      int conversationId, MessageModel message);
  Future<ConversationResponse> subscribe(int id);
  Future<MessageModel> likeMessage(String chatId, String messageId);
  Stream<MessageModel> watchMessages();
  Stream<ConversationResponse> pinConversation();
}

class ChatRepositoryImpl implements ChatRepository {
  final RestClient restClient;

  ChatRepositoryImpl({this.restClient});

  @override
  Future<ConversationResponse> getConversaion(int chatId) async {
    return await restClient.getConversaion(chatId);
  }

  @override
  Future<ConversationResponse> subscribe(int id) async {
    return await restClient.subscribe(id);
  }

  @override
  Future<MessageModel> likeMessage(String chatId, String messamessamessageId) {
    throw UnimplementedError();
  }

  @override
  Future<MessageModel> sendMessage(
      int conversationId, MessageModel message) async {
    return await restClient.sendMessage(
        conversationId, message.body, message.type.toString().parseEnum());
  }

  @override
  Stream<MessageModel> watchMessages() {
    throw UnimplementedError();
  }

  @override
  Stream<ConversationResponse> pinConversation() {
    throw UnimplementedError();
  }
}
