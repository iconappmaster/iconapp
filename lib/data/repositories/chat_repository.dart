import 'package:iconapp/data/models/category_model.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';

abstract class ChatRepository {
  Future<CategoryModel> getConversaion(int chatId);
  Future<MessageModel> sendMessage(int conversationId, MessageModel message);
  Future<MessageModel> likeMessage(String chatId, String messageId);
  Stream<MessageModel> watchMessages();
}

class ChatRepositoryImpl implements ChatRepository {
  final RestClient restClient;

  ChatRepositoryImpl({this.restClient});

  @override
  Future<CategoryModel> getConversaion(int chatId) async {
    return await restClient.getConversaion(chatId);
  }

  @override
  Future<MessageModel> likeMessage(String chatId, String messamessamessageId) {
    throw UnimplementedError();
  }

  @override
  Future<MessageModel> sendMessage(
      int conversationId, MessageModel message) async {
    return MessageModel();
  }

  @override
  Stream<MessageModel> watchMessages() {
    throw UnimplementedError();
  }
}
