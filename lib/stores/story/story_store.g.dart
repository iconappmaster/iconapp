// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoryStore on _StoryStoreBase, Store {
  Computed<List<StoryModel>> _$getStoriesComputed;

  @override
  List<StoryModel> get getStories => (_$getStoriesComputed ??=
          Computed<List<StoryModel>>(() => super.getStories,
              name: '_StoryStoreBase.getStories'))
      .value;

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

  final _$createStoryAsyncAction = AsyncAction('_StoryStoreBase.createStory');

  @override
  Future<dynamic> createStory() {
    return _$createStoryAsyncAction.run(() => super.createStory());
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

  @override
  String toString() {
    return '''
getStories: ${getStories}
    ''';
  }
}
