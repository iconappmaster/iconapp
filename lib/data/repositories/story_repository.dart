import 'package:iconapp/data/models/story_model.dart';

abstract class StoryRepository {
  Future<StoryModel> createStory();
}
