// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoryStore on _StoryStoreBase, Store {
  Computed<StoryMode> _$modeComputed;

  @override
  StoryMode get mode => (_$modeComputed ??=
          Computed<StoryMode>(() => super.mode, name: '_StoryStoreBase.mode'))
      .value;
  Computed<bool> _$isUserIconComputed;

  @override
  bool get isUserIcon =>
      (_$isUserIconComputed ??= Computed<bool>(() => super.isUserIcon,
              name: '_StoryStoreBase.isUserIcon'))
          .value;
  Computed<List<StoryModel>> _$storiesComputed;

  @override
  List<StoryModel> get stories =>
      (_$storiesComputed ??= Computed<List<StoryModel>>(() => super.stories,
              name: '_StoryStoreBase.stories'))
          .value;
  Computed<StoryModel> _$usersStoryComputed;

  @override
  StoryModel get usersStory =>
      (_$usersStoryComputed ??= Computed<StoryModel>(() => super.usersStory,
              name: '_StoryStoreBase.usersStory'))
          .value;

  final _$_modeAtom = Atom(name: '_StoryStoreBase._mode');

  @override
  StoryMode get _mode {
    _$_modeAtom.reportRead();
    return super._mode;
  }

  @override
  set _mode(StoryMode value) {
    _$_modeAtom.reportWrite(value, super._mode, () {
      super._mode = value;
    });
  }

  final _$_storiesAtom = Atom(name: '_StoryStoreBase._stories');

  @override
  ObservableList<StoryModel> get _stories {
    _$_storiesAtom.reportRead();
    return super._stories;
  }

  @override
  set _stories(ObservableList<StoryModel> value) {
    _$_storiesAtom.reportWrite(value, super._stories, () {
      super._stories = value;
    });
  }

  final _$refreshStoriesAsyncAction =
      AsyncAction('_StoryStoreBase.refreshStories');

  @override
  Future<dynamic> refreshStories() {
    return _$refreshStoriesAsyncAction.run(() => super.refreshStories());
  }

  final _$onStoryImageViewedAsyncAction =
      AsyncAction('_StoryStoreBase.onStoryImageViewed');

  @override
  Future<dynamic> onStoryImageViewed(int imageId) {
    return _$onStoryImageViewedAsyncAction
        .run(() => super.onStoryImageViewed(imageId));
  }

  final _$_StoryStoreBaseActionController =
      ActionController(name: '_StoryStoreBase');

  @override
  void setStoryMode(StoryMode mode) {
    final _$actionInfo = _$_StoryStoreBaseActionController.startAction(
        name: '_StoryStoreBase.setStoryMode');
    try {
      return super.setStoryMode(mode);
    } finally {
      _$_StoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void watchStories() {
    final _$actionInfo = _$_StoryStoreBaseActionController.startAction(
        name: '_StoryStoreBase.watchStories');
    try {
      return super.watchStories();
    } finally {
      _$_StoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStories(List<StoryModel> stories) {
    final _$actionInfo = _$_StoryStoreBaseActionController.startAction(
        name: '_StoryStoreBase.setStories');
    try {
      return super.setStories(stories);
    } finally {
      _$_StoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addStory(StoryModel story) {
    final _$actionInfo = _$_StoryStoreBaseActionController.startAction(
        name: '_StoryStoreBase.addStory');
    try {
      return super.addStory(story);
    } finally {
      _$_StoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateStory(StoryModel story) {
    final _$actionInfo = _$_StoryStoreBaseActionController.startAction(
        name: '_StoryStoreBase.updateStory');
    try {
      return super.updateStory(story);
    } finally {
      _$_StoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
mode: ${mode},
isUserIcon: ${isUserIcon},
stories: ${stories},
usersStory: ${usersStory}
    ''';
  }
}
