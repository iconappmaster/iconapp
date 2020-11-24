import 'package:dartz/dartz.dart';
import 'package:iconapp/stores/analytics/analytics_consts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

import '../../core/dependencies/locator.dart';
import '../../core/firebase/crashlytics.dart';
import '../../data/models/photo_model.dart';
import '../../data/models/story_image.dart';
import '../../data/models/story_model.dart';
import '../../data/repositories/story_repository.dart';
import '../../domain/core/errors.dart';
import '../analytics/analytics_firebase.dart';
import '../media/media_store.dart';
import '../user/user_store.dart';
import 'story_store.dart';

part 'story_edit_store.g.dart';

/// The [StoryEditStore] is responsible for:
/// 1. add stories to be uploaded
/// 2. communicate with the media store and upload the media to firebase
class StoryEditStore = _StoryEditStoreBase with _$StoryEditStore;

const defaultStoryDuration = 12;

abstract class _StoryEditStoreBase with Store {
  MediaStore _mediaStore;
  UserStore _user;
  StoryRepository _repository;
  StoryStore _storyStore;

  _StoryEditStoreBase() {
    _mediaStore = sl<MediaStore>();
    _repository = sl<StoryRepository>();
    _user = sl<UserStore>();
    _storyStore = sl<StoryStore>();
  }

  @observable
  int _storyDuration = defaultStoryDuration;

  @observable
  bool _isLoading = false;

  @observable
  bool _compressing = false;

  @observable
  bool _isPublishing = false;

  @observable
  ObservableList<StoryImageModel> _storiesToPublish = ObservableList.of([]);

  @computed
  bool get comporessing => _compressing;

  @computed
  int get storyDuration => _storyDuration;

  @computed
  bool get isLoading => _isLoading;

  @computed
  bool get isPublishing => _isPublishing;

  @computed
  List<StoryImageModel> get stories => _storiesToPublish;

  @computed
  bool get canPublish => _storiesToPublish.isNotEmpty;

  @action
  Future addPhotoMedia(ImageSource source) async {
    try {
      _isLoading = true;
      final url = await _mediaStore.uploadPhoto(source: source);
      if (url.isNotEmpty) {
        final storyImg = StoryImageModel.photo();
        _storiesToPublish.add(
          storyImg.copyWith(
            id: DateTime.now().millisecondsSinceEpoch,
            photo: PhotoModel(url: url),
          ),
        );
      }
    } on ServerError catch (e) {
      Crash.report(e.message);
    } finally {
      _isLoading = false;
    }
  }

  @action
  void updateStoryDuration(int duration) {
    _storyDuration = duration;
  }

  @action
  Future uploadVideo(ImageSource source) async {
    try {
      _isLoading = true;

      final url = await _mediaStore.uploadVideo(source: source);

      if (url.isNotEmpty) {
        _storiesToPublish.add(
          StoryImageModel.video().copyWith(
            id: DateTime.now().millisecondsSinceEpoch,
            photo: PhotoModel(url: url),
          ),
        );
        // }
      }
    } on ServerError catch (e) {
      Crash.report(e.message);
    } finally {
      _isLoading = false;
    }
  }

  @action
  Future<Either<ServerError, StoryModel>> addToStory() async {
    try {
      _isPublishing = true;

      final story = StoryModel(
        id: DateTime.now().millisecondsSinceEpoch,
        isNew: true,
        type: StoryType.story,
        user: _user.getUser,
        storyImages: _storiesToPublish.toList(),
      );

      final storyRes = await _repository.addToStory(story, _storyDuration);
  
      await _storyStore.refreshStories();
      analytics.sendAnalyticsEvent(ADDED_STORY, {
        'numberOfImages': _storiesToPublish?.length ?? 0
      });
      return right(storyRes);
    } on ServerError catch (e) {
      Crash.report(e.message);
      return left(e);
    } finally {
      _isPublishing = false;
    }
  }

  @action
  Future deleteStory(StoryImageModel storyModel) async {
    _storiesToPublish.remove(storyModel);
  }

  @action
  Future updateStory(StoryImageModel story) async {
    final index = _storiesToPublish.indexWhere((s) => s.id == story.id);
    _storiesToPublish[index] = story;
  }

  @action
  void setMyStories(List<StoryImageModel> storyImages) {
    _storiesToPublish.addAll(storyImages);
  }

  @action
  void dispose() {
    _storyDuration = defaultStoryDuration;
    _storiesToPublish.clear();
  }
}
