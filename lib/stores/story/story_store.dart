import 'dart:async';

import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/story_model.dart';
import 'package:iconapp/data/repositories/story_repository.dart';
import 'package:iconapp/stores/user/user_store.dart';
import 'package:iconapp/widgets/story/story_list.dart';
import 'package:iconapp/widgets/story/story_view.dart';
import 'package:mobx/mobx.dart';
part 'story_store.g.dart';

/// the [StoryStore] is responsible:
/// 1. fetch the stories from conversation or home by [StoryMode]
/// 2. publish a new story
/// 3. update the backend with stories shown by the user
/// 4. show or hide add story on the [StoriesList] widget
class StoryStore = _StoryStoreBase with _$StoryStore;

abstract class _StoryStoreBase with Store {
  StoryRepository _repository;
  UserStore _user;

  _StoryStoreBase() {
    _repository = sl<StoryRepository>();
    _user = sl<UserStore>();
  }

  /// [StoryMode] is can persent stories from home or stories from conversation
  /// stories at a conversation contains only the stories that the celebs who is
  /// present in the current conversation
  @observable
  StoryMode _mode = StoryMode.home;

  // the current stories that are being desplied.
  @observable
  ObservableList<StoryModel> _stories = ObservableList.of([]);

  @computed
  StoryMode get mode => _mode;

  @computed
  bool get showAddButton => _user.getUser.isIcon;

  @computed
  List<StoryModel> get getStories => _stories.reversed.toList();

  @action
  Future onStoryShow(StoryItem item) async {
    // todo
  }

  @action
  Future onStoryCompleted() async {
    // todo
  }

  @action
  void setStoryMode(StoryMode mode) {
    _mode = mode;
  }

  @action
  Future getHomeStories() async {
    _mode = StoryMode.home;
    try {
      final stories = await _repository.getHomeStories();
      if (_stories.isNotEmpty) _stories.clear();
      _stories.addAll(stories);
    } on Exception catch (e) {
      print(e);
    }
  }

  @action
  Future getConversationsStories(int conversationId) async {
    _mode = StoryMode.conversation;
    final stories = await _repository.getConversationsStories(conversationId);
    if (_stories.isNotEmpty) _stories.clear();
    _stories.addAll(stories);
  }
}
