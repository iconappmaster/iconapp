import 'package:flutter/foundation.dart';
import 'package:iconapp/data/models/photo_model.dart';
import 'package:iconapp/data/models/story_model.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';


abstract class StoryRepository {
  // TBD
  Future<StoryModel> createStory();

  /// This API will get all the latest stories and will present the home page
  Future<List<StoryModel>> getHomeStories();

  /// This accepts [conversationId] and get the stories in a conversation
  /// with all the 'icons' that are presented in the conversation.
  Future<List<StoryModel>> getConversationsStories(int conversationId);
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
}

final mockStories = [
  StoryModel(
      isNew: true,
      storyImages: [],
      user: fakeUser,
      photo: PhotoModel(
          url:
              'https://besttv232-ynet-images1-prod.cdn.it.best-tv.com/PicServer5/2018/02/11/8340452/83404465961999801054no.jpg')),
  StoryModel(
      isNew: false,
      storyImages: [],
      user: fakeUser,
      photo: PhotoModel(
          url:
              'https://besttv232-ynet-images1-prod.cdn.it.best-tv.com/PicServer5/2018/02/11/8340452/83404465961999801054no.jpg')),
  StoryModel(
      isNew: false,
      storyImages: [],
      user: fakeUser,
      photo: PhotoModel(
          url:
              'https://besttv232-ynet-images1-prod.cdn.it.best-tv.com/PicServer5/2018/02/11/8340452/83404465961999801054no.jpg'))
];

final fakeUser = UserModel(fullName: 'שם בדוי');
