import 'package:meta/meta.dart';

import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';

abstract class ArchiveRepository {
  Future archive(int conversationId);
  Future unArchive(int conversationId);
  Future<List<Conversation>> getArchivedConversations();
}

class ArchiveRepositoryImpl implements ArchiveRepository {
  final RestClient rest;

  ArchiveRepositoryImpl({@required this.rest});

  @override
  Future archive(int conversationId) async {
    return await rest.archive(conversationId);
  }

  @override
  Future<List<Conversation>> getArchivedConversations() async {
    return await rest.getArchiveConversations();
  }

  @override
  Future unArchive(int conversationId) async {
    return await rest.unarchive(conversationId);
  }
}
