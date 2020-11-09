// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_edit_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoryEditStore on _StoryEditStoreBase, Store {
  Computed<bool> _$comporessingComputed;

  @override
  bool get comporessing =>
      (_$comporessingComputed ??= Computed<bool>(() => super.comporessing,
              name: '_StoryEditStoreBase.comporessing'))
          .value;
  Computed<int> _$storyDurationComputed;

  @override
  int get storyDuration =>
      (_$storyDurationComputed ??= Computed<int>(() => super.storyDuration,
              name: '_StoryEditStoreBase.storyDuration'))
          .value;
  Computed<bool> _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_StoryEditStoreBase.isLoading'))
          .value;
  Computed<bool> _$isPublishingComputed;

  @override
  bool get isPublishing =>
      (_$isPublishingComputed ??= Computed<bool>(() => super.isPublishing,
              name: '_StoryEditStoreBase.isPublishing'))
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

  final _$_storyDurationAtom = Atom(name: '_StoryEditStoreBase._storyDuration');

  @override
  int get _storyDuration {
    _$_storyDurationAtom.reportRead();
    return super._storyDuration;
  }

  @override
  set _storyDuration(int value) {
    _$_storyDurationAtom.reportWrite(value, super._storyDuration, () {
      super._storyDuration = value;
    });
  }

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

  final _$_compressingAtom = Atom(name: '_StoryEditStoreBase._compressing');

  @override
  bool get _compressing {
    _$_compressingAtom.reportRead();
    return super._compressing;
  }

  @override
  set _compressing(bool value) {
    _$_compressingAtom.reportWrite(value, super._compressing, () {
      super._compressing = value;
    });
  }

  final _$_isPublishingAtom = Atom(name: '_StoryEditStoreBase._isPublishing');

  @override
  bool get _isPublishing {
    _$_isPublishingAtom.reportRead();
    return super._isPublishing;
  }

  @override
  set _isPublishing(bool value) {
    _$_isPublishingAtom.reportWrite(value, super._isPublishing, () {
      super._isPublishing = value;
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

  final _$uploadVideoAsyncAction =
      AsyncAction('_StoryEditStoreBase.uploadVideo');

  @override
  Future<dynamic> uploadVideo(ImageSource source) {
    return _$uploadVideoAsyncAction.run(() => super.uploadVideo(source));
  }

  final _$addToStoryAsyncAction = AsyncAction('_StoryEditStoreBase.addToStory');

  @override
  Future<Either<ServerError, StoryModel>> addToStory() {
    return _$addToStoryAsyncAction.run(() => super.addToStory());
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
  void updateStoryDuration(int duration) {
    final _$actionInfo = _$_StoryEditStoreBaseActionController.startAction(
        name: '_StoryEditStoreBase.updateStoryDuration');
    try {
      return super.updateStoryDuration(duration);
    } finally {
      _$_StoryEditStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMyStories(List<StoryImageModel> storyImages) {
    final _$actionInfo = _$_StoryEditStoreBaseActionController.startAction(
        name: '_StoryEditStoreBase.setMyStories');
    try {
      return super.setMyStories(storyImages);
    } finally {
      _$_StoryEditStoreBaseActionController.endAction(_$actionInfo);
    }
  }

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
comporessing: ${comporessing},
storyDuration: ${storyDuration},
isLoading: ${isLoading},
isPublishing: ${isPublishing},
stories: ${stories},
canPublish: ${canPublish}
    ''';
  }
}
