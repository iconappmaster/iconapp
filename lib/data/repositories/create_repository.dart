import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/data/models/create_group_req.dart';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';

abstract class CreateRepository {
  Future<Conversation> createConversation(CreateGroupReq req);
}

class GroupCreateRepositoryImpl implements CreateRepository {
  final RestClient client;

  GroupCreateRepositoryImpl(this.client);

  @override
  Future<Conversation> createConversation(CreateGroupReq req) async {
    return await client.createGroup(req);
  }
}
