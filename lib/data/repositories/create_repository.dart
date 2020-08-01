import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';

abstract class CreateRepository {
  Future<ConversationModel> createConversation(
      List<UserModel> contacts, List<int> categoriesIds);
}

class GroupCreateRepositoryImpl implements CreateRepository {
  final RestClient client;

  GroupCreateRepositoryImpl(this.client);

  @override
  Future<ConversationModel> createConversation(
      List<UserModel> contacts, List<int> categoriesIds) async {
    return ConversationModel();
  }
}
