import 'dart:async';

import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/story_model.dart';
import 'package:iconapp/data/repositories/story_repository.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/stores/user/user_store.dart';
import 'package:iconapp/widgets/story/story_list.dart';
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
  StreamSubscription<StoryModel> _storyChangeSubscription;

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
  Future onStoryViewed(StoryModel story) async {
    try {
      await _repository.viewedStory(story);
    } on Exception catch (e) {
      print(e);
    }
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
  void watchStories() {
    _storyChangeSubscription = _repository.watchStories().listen((story) {
      final storyIndex = _stories.indexWhere((s) => s.id == story.id);

      if (storyIndex != -1) {
        // stroy already exists, replace it.
        _stories[storyIndex] = story;
      } else {
        // add a new story
        _stories.add(story);
      }
    });
  }

  @action
  Future getConversationsStories(int conversationId) async {
    _mode = StoryMode.conversation;
    final stories = await _repository.getConversationsStories(conversationId);
    if (_stories.isNotEmpty) _stories.clear();
    _stories.addAll(stories);
  }

  @action
  Future refreshStories() async {
    switch (mode) {
      case StoryMode.home:
        getHomeStories();
        break;
      case StoryMode.conversation:
        final id = sl<ChatStore>().conversation.id;
        getConversationsStories(id);
        break;
    }
  }

  void dispose() {
    _storyChangeSubscription?.cancel();
  }
}
