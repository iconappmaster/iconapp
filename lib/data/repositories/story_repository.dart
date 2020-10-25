import 'package:flutter/foundation.dart';
import 'package:iconapp/data/models/story_model.dart';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';
import 'package:iconapp/data/sources/socket/socket_manager.dart';

abstract class StoryRepository {
  /// This API will get all the latest stories and will present the home page
  Future<List<StoryModel>> getHomeStories();

  /// This accepts [conversationId] and get the stories in a conversation
  /// with all the 'icons' that are presented in the conversation.
  Future<List<StoryModel>> getConversationsStories(int conversationId);

  Future<StoryModel> addToStory(StoryModel story, int duration);

  Future viewedStoryImage(int imageId);

  Future updateStoryDuration(int duration);

  Stream<StoryModel> watchStories();
}

class StoryRepositoryImpl implements StoryRepository {
  final RestClient rest;
  Socket socket;

  StoryRepositoryImpl({
    @required this.rest,
    @required this.socket,
  });

  @override
  Future<List<StoryModel>> getConversationsStories(int conversationId) async {
    return await rest.conversationStories(conversationId);
  }

  @override
  Future<List<StoryModel>> getHomeStories() async {
    return await rest.homeStories();
  }

  @override
  Future<StoryModel> addToStory(StoryModel story, int duration) async {
    return await rest.addToStory(story, duration);
  }

  @override
  Stream<StoryModel> watchStories() {
    return socket.storySubject;
  }

  @override
  Future viewedStoryImage(int imageId) async {
    if (imageId == 0) return false;
    return await rest.viewedStoryImage(imageId);
  }

  @override
  Future updateStoryDuration(int duration) async {
    return await rest.updateStoryDuration(duration);
  }
}
