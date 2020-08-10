import 'package:iconapp/data/models/photo_model.dart';
import 'package:iconapp/data/models/story_model.dart';
import 'package:iconapp/data/models/user_model.dart';

abstract class StoryRepository {
  Future<StoryModel> createStory();
  Future<List<StoryModel>> getHomeStories();
  Future<List<StoryModel>> getConversationsStories(int conversationId);
}

class StoryRepositoryImpl implements StoryRepository {
  @override
  Future<StoryModel> createStory() {
    throw UnimplementedError();
  }

  @override
  Future<List<StoryModel>> getConversationsStories(int conversationId) async {
    return Future.value(mockStories);
  }

  @override
  Future<List<StoryModel>> getHomeStories() {
    return Future.value(mockStories);
  }
}

final mockStories = [
  StoryModel(
      stories: [],
      user: fakeUser,
      photo: PhotoModel(
          url:
              'https://besttv232-ynet-images1-prod.cdn.it.best-tv.com/PicServer5/2018/02/11/8340452/83404465961999801054no.jpg')),
  StoryModel(
      stories: [],
      user: fakeUser,
      photo: PhotoModel(
          url:
              'https://besttv232-ynet-images1-prod.cdn.it.best-tv.com/PicServer5/2018/02/11/8340452/83404465961999801054no.jpg')),
  StoryModel(
      stories: [],
      user: fakeUser,
      photo: PhotoModel(
          url:
              'https://besttv232-ynet-images1-prod.cdn.it.best-tv.com/PicServer5/2018/02/11/8340452/83404465961999801054no.jpg'))
];

final fakeUser = UserModel(fullName: 'שם בדוי');
