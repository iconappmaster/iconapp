import 'dart:async';

import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/firebase/crashlytics.dart';
// import 'package:iconapp/core/story_cacher.dart';
import 'package:iconapp/data/models/story_model.dart';
import 'package:iconapp/data/repositories/story_repository.dart';
import 'package:iconapp/domain/core/errors.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/stores/user/user_store.dart';
import 'package:iconapp/widgets/story/story_list.dart';
import 'package:mobx/mobx.dart';

import '../../core/extensions/int_ext.dart';

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
  // StoryCacheManager _storyCacheManager;
  StreamSubscription<StoryModel> _storyChangeSubscription;

  _StoryStoreBase() {
    // _storyCacheManager = sl<StoryCacheManager>();
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

  //  if the user is an icon show the add button
  @computed
  bool get isUserIcon => _user.getUser.isIcon;

  // get all stories in reveresed order
  @computed
  List<StoryModel> get storiesWithoutAds => _stories.reversed
      .where(
        (s) => s.type == StoryType.story,
      )
      .toList();

  @computed
  List<StoryModel> get stories => _stories.reversed.toList();

  // wil lget the users story
  @computed
  StoryModel get usersStory => _stories.firstWhere((s) => s.user.id.isMe);

  @action
  void setStoryMode(StoryMode mode) {
    _mode = mode;
  }

  // listen to stream of stories
  @action
  void watchStories() {
    _storyChangeSubscription = _repository.watchStories().listen((story) {
      final storyIndex = _stories.indexWhere((s) => s.id == story.id);
      if (mode == StoryMode.conversation) {
        if (storyIndex != -1) {
          // stroy already exists, replace it.
          _stories[storyIndex] = story;
        } else {
          // add a new story
          _stories.add(story);
        }
      }
    });
  }

  /// refresh the stories based on the [StoryMode]
  @action
  Future refreshStories() async {
    Future getConversationsStories(int conversationId) async {
      _mode = StoryMode.conversation;
      try {
        final stories =
            await _repository.getConversationsStories(conversationId);

        setStories(stories);
      } on ServerError catch (e) {
        Crash.report(e.message);
      }
    }

    Future getHomeStories() async {
      _mode = StoryMode.home;
      try {
        final stories = await _repository.getHomeStories();
        // remove that!
        final s =
            stories.map((e) => e.copyWith(type: StoryType.story)).toList();

        if (_stories.isNotEmpty) _stories.clear();

        _stories
          ..addAll(s)
          // remove that!
          ..add(
            StoryModel(
              id: 0,
              isNew: false,
              storyImages: [],
              type: StoryType.ad,
              user: null,
            ),
          );
      } on ServerError catch (e) {
        Crash.report(e.message);
      }
    }

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

  // when a user views an image mark it as seen. if the user has seen all the photos
  // then the story will be marked as seen.
  @action
  Future onStoryImageViewed(int imageId) async {
    try {
      _repository.viewedStoryImage(imageId);
    } on ServerError catch (e) {
      Crash.report(e.message);
    }
  }

  // set the stories and update the ui
  @action
  void setStories(List<StoryModel> stories) {
    _stories.clear();
    _stories.addAll(stories);
  }

  @action
  void addStory(StoryModel story) {
    _stories.add(story);
  }

  @action
  void updateStory(StoryModel story) {
    final index = _stories.indexOf((s) => s.id == story.id);
    if (index != -1) _stories[index] = story;
  }

  @action
  void clearStories() {
    _stories.clear();
  }

  void dispose() {
    _storyChangeSubscription?.cancel();
  }
}
