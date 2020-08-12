import 'dart:async';

import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/story_model.dart';
import 'package:iconapp/data/repositories/story_repository.dart';
import 'package:iconapp/domain/core/errors.dart';
import 'package:iconapp/stores/user/user_store.dart';
import 'package:iconapp/widgets/home/stories_widget.dart';
import 'package:mobx/mobx.dart';
part 'story_store.g.dart';

class StoryStore = _StoryStoreBase with _$StoryStore;

abstract class _StoryStoreBase with Store {
  StoryRepository _repository;

  _StoryStoreBase() {
    _repository = sl<StoryRepository>();
  }

  @observable
  StoryMode _mode = StoryMode.home;

  @observable
  ObservableList<StoryModel> _stories = ObservableList.of([]);

  @computed
  StoryMode get mode => _mode;

  @computed
  List<StoryModel> get getStories => _stories.reversed.toList();

  @action
  void setMode(StoryMode mode) {
    _mode = mode;
  }

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
    _mode = StoryMode.home;
    final stories = await _repository.getHomeStories();
    if (_stories.isNotEmpty) _stories.clear();
    _stories.addAll(stories);

    addPlusButton();
  }

  void addPlusButton() {
    final user = sl<UserStore>().getUser;
    final plusStory = StoryModel(
        isNew: false,
        isAddButton: true,
        photo: user.photo,
        user: user,
        storyImages: []);
    _stories.add(plusStory);
  }

  @action
  Future getConversationsStories(int conversationId) async {
    _mode = StoryMode.conversation;
    final stories = await _repository.getConversationsStories(conversationId);
    if (_stories.isNotEmpty) _stories.clear();
    _stories.addAll(stories);

    addPlusButton();
  }
}