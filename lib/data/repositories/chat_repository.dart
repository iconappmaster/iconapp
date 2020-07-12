import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';

abstract class ChatRepository {
  Future<ConversationModel> getConversaion(String chatId);
  Future<MessageModel> sendMessage(String chatId, MessageModel message);
  Future<MessageModel> likeMessage(String chatId, String messageId);
  Stream<MessageModel> watchMessages();
}

class ChatRepositoryImpl implements ChatRepository {
  final RestClient restClient;

  ChatRepositoryImpl({this.restClient});

  @override
  Future<ConversationModel> getConversaion(String chatId) async {
    return await restClient.getConversaion(chatId);
  }

  @override
  Future<MessageModel> likeMessage(String chatId, String messamessamessageId) {
    throw UnimplementedError();
  }

  @override
  Future<MessageModel> sendMessage(String chatId, MessageModel message) {
    throw UnimplementedError();
  }

  @override
  Stream<MessageModel> watchMessages() {
    throw UnimplementedError();
  }
}
