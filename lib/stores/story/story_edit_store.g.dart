// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_edit_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoryEditStore on _StoryEditStoreBase, Store {
  Computed<bool> _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_StoryEditStoreBase.isLoading'))
          .value;
  Computed<List<StoryImageModel>> _$storiesComputed;

  @override
  List<StoryImageModel> get stories => (_$storiesComputed ??=
          Computed<List<StoryImageModel>>(() => super.stories,
              name: '_StoryEditStoreBase.stories'))
      .value;
  Computed<bool> _$canPublishComputed;

  @override
  bool get canPublish =>
      (_$canPublishComputed ??= Computed<bool>(() => super.canPublish,
              name: '_StoryEditStoreBase.canPublish'))
          .value;

  final _$_isLoadingAtom = Atom(name: '_StoryEditStoreBase._isLoading');

  @override
  bool get _isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  final _$_storiesToPublishAtom =
      Atom(name: '_StoryEditStoreBase._storiesToPublish');

  @override
  ObservableList<StoryImageModel> get _storiesToPublish {
    _$_storiesToPublishAtom.reportRead();
    return super._storiesToPublish;
  }

  @override
  set _storiesToPublish(ObservableList<StoryImageModel> value) {
    _$_storiesToPublishAtom.reportWrite(value, super._storiesToPublish, () {
      super._storiesToPublish = value;
    });
  }

  final _$addPhotoMediaAsyncAction =
      AsyncAction('_StoryEditStoreBase.addPhotoMedia');

  @override
  Future<dynamic> addPhotoMedia(ImageSource source) {
    return _$addPhotoMediaAsyncAction.run(() => super.addPhotoMedia(source));
  }

  final _$addVideoMediaAsyncAction =
      AsyncAction('_StoryEditStoreBase.addVideoMedia');

  @override
  Future<dynamic> addVideoMedia() {
    return _$addVideoMediaAsyncAction.run(() => super.addVideoMedia());
  }

  final _$publishStoryAsyncAction =
      AsyncAction('_StoryEditStoreBase.publishStory');

  @override
  Future<dynamic> publishStory() {
    return _$publishStoryAsyncAction.run(() => super.publishStory());
  }

  final _$deleteStoryAsyncAction =
      AsyncAction('_StoryEditStoreBase.deleteStory');

  @override
  Future<dynamic> deleteStory(StoryImageModel storyModel) {
    return _$deleteStoryAsyncAction.run(() => super.deleteStory(storyModel));
  }

  final _$updateStoryAsyncAction =
      AsyncAction('_StoryEditStoreBase.updateStory');

  @override
  Future<dynamic> updateStory(StoryImageModel story) {
    return _$updateStoryAsyncAction.run(() => super.updateStory(story));
  }

  final _$_StoryEditStoreBaseActionController =
      ActionController(name: '_StoryEditStoreBase');

  @override
  void dispose() {
    final _$actionInfo = _$_StoryEditStoreBaseActionController.startAction(
        name: '_StoryEditStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$_StoryEditStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
stories: ${stories},
canPublish: ${canPublish}
    ''';
  }
}
