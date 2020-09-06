import 'package:flutter/foundation.dart';
import 'package:iconapp/data/models/story_model.dart';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';

abstract class StoryRepository {
  // TBD
  Future<StoryModel> createStory();

  /// This API will get all the latest stories and will present the home page
  Future<List<StoryModel>> getHomeStories();

  /// This accepts [conversationId] and get the stories in a conversation
  /// with all the 'icons' that are presented in the conversation.
  Future<List<StoryModel>> getConversationsStories(int conversationId);

  Future<StoryModel> publishStory(StoryModel story);
}

class StoryRepositoryImpl implements StoryRepository {
  final RestClient rest;

  StoryRepositoryImpl({@required this.rest});

  @override
  Future<StoryModel> createStory() {
    throw UnimplementedError();
  }

  @override
  Future<List<StoryModel>> getConversationsStories(int conversationId) async {
    return await rest.conversationStories(conversationId);
  }

  @override
  Future<List<StoryModel>> getHomeStories() async {
    return await rest.homeStories();
  }

  @override
  Future<StoryModel> publishStory(StoryModel story) async {
    return await rest.publishStory(story.storyImages);
  }
}
