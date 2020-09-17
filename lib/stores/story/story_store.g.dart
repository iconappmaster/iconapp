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
  Computed<bool> _$showAddButtonComputed;

  @override
  bool get showAddButton =>
      (_$showAddButtonComputed ??= Computed<bool>(() => super.showAddButton,
              name: '_StoryStoreBase.showAddButton'))
          .value;
  Computed<List<StoryModel>> _$getStoriesComputed;

  @override
  List<StoryModel> get getStories => (_$getStoriesComputed ??=
          Computed<List<StoryModel>>(() => super.getStories,
              name: '_StoryStoreBase.getStories'))
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

  final _$onStoryViewedAsyncAction =
      AsyncAction('_StoryStoreBase.onStoryViewed');

  @override
  Future<dynamic> onStoryViewed(StoryModel story) {
    return _$onStoryViewedAsyncAction.run(() => super.onStoryViewed(story));
  }

  final _$getHomeStoriesAsyncAction =
      AsyncAction('_StoryStoreBase.getHomeStories');

  @override
  Future<dynamic> getHomeStories() {
    return _$getHomeStoriesAsyncAction.run(() => super.getHomeStories());
  }

  final _$getConversationsStoriesAsyncAction =
      AsyncAction('_StoryStoreBase.getConversationsStories');

  @override
  Future<dynamic> getConversationsStories(int conversationId) {
    return _$getConversationsStoriesAsyncAction
        .run(() => super.getConversationsStories(conversationId));
  }

  final _$refreshStoriesAsyncAction =
      AsyncAction('_StoryStoreBase.refreshStories');

  @override
  Future<dynamic> refreshStories() {
    return _$refreshStoriesAsyncAction.run(() => super.refreshStories());
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
  String toString() {
    return '''
mode: ${mode},
showAddButton: ${showAddButton},
getStories: ${getStories}
    ''';
  }
}
