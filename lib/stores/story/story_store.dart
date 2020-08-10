import 'dart:async';

import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/story_model.dart';
import 'package:iconapp/data/repositories/story_repository.dart';
import 'package:iconapp/domain/core/errors.dart';
import 'package:mobx/mobx.dart';
part 'story_store.g.dart';

class StoryStore = _StoryStoreBase with _$StoryStore;

abstract class _StoryStoreBase with Store {
  StoryRepository _repository;

  _StoryStoreBase() {
    _repository = sl<StoryRepository>();
  }

  @observable
  ObservableList<StoryModel> _stories = ObservableList.of([]);

  @computed
  List<StoryModel> get getStories => _stories;

  @action
  Future createStory() async {
    try {
      final story = await _repository.createStory();
      print(story);
    } on ServerError catch (e) {
      print(e);
    }
  }

  @action
  Future getHomeStories() async {
    final stories = await _repository.getHomeStories();
    if (_stories.isNotEmpty) _stories.clear();
    _stories.addAll(stories);
    print(stories);
  }

  @action
  Future getConversationsStories(int conversationId) async {
    final stories = await _repository.getConversationsStories(conversationId);
    if (_stories.isNotEmpty) _stories.clear();
    _stories.addAll(stories);
    print(stories);
  }
}
