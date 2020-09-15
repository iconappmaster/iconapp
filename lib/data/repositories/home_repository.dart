import 'package:flutter/foundation.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/data/models/story_model.dart';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';
import 'package:iconapp/stores/socket/socket_manager.dart';

abstract class HomeRepository {
  Future<List<Conversation>> getHome();
  Stream<StoryModel> watchStories();
  Stream<Conversation> watchConversation();
}

class HomeRepositoryImpl implements HomeRepository {
  RestClient restClient;
  Socket socket;

  HomeRepositoryImpl({@required this.restClient, @required this.socket});
  @override
  Future<List<Conversation>> getHome() async {
    return await restClient.getConversations();
  }

  @override
  Stream<Conversation> watchConversation() {
    return socket.conversationObserver;
  }

  @override
  Stream<StoryModel> watchStories() {
   return socket.storyObserver;
  }
}
