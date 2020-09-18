import 'package:dartz/dartz.dart';
import 'package:iconapp/data/models/photo_model.dart';
import 'package:iconapp/data/models/story_model.dart';
import 'package:iconapp/stores/story/story_store.dart';
import 'package:iconapp/stores/user/user_store.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/dependencies/locator.dart';
import '../../core/firebase/crashlytics.dart';
import '../../data/models/story_image.dart';
import '../../data/repositories/story_repository.dart';
import '../../domain/core/errors.dart';
import '../media/media_store.dart';
import 'package:mobx/mobx.dart';

part 'story_edit_store.g.dart';

/// The [StoryEditStore] is responsible for:
/// 1. add stories to be uploaded
/// 2. communicate with the media store and upload the media to firebase
class StoryEditStore = _StoryEditStoreBase with _$StoryEditStore;

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
  bool _isLoading = false;

  @observable
  bool _isPublishing = false;

  @observable
  ObservableList<StoryImageModel> _storiesToPublish = ObservableList.of([]);

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
      final storyImg = StoryImageModel.photo();
      _storiesToPublish.add(
        storyImg.copyWith(
          id: DateTime.now().millisecondsSinceEpoch,
          photo: PhotoModel(url: url),
        ),
      );
    } on ServerError catch (e) {
      Crash.report(e.message);
    } finally {
      _isLoading = false;
    }
  }

  @action
  Future addVideoMedia() async {
    try {
      _isLoading = true;
      final url = await _mediaStore.uploadVideo();
      final storyImg = StoryImageModel.video();
      _storiesToPublish.add(
        storyImg.copyWith(
          id: DateTime.now().millisecondsSinceEpoch,
          photo: PhotoModel(url: url),
        ),
      );
    } on ServerError catch (e) {
      Crash.report(e.message);
    } finally {
      _isLoading = false;
    }
  }

  @action
  Future<Either<ServerError, StoryModel>> publishStory() async {
    try {
      _isPublishing = true;
      final story = StoryModel(
        id: DateTime.now().millisecondsSinceEpoch,
        isNew: true,
        user: _user.getUser,
        storyImages: _storiesToPublish.toList(),
      );

      final storyRes = await _repository.publishStory(story);

      if (_storyStore.getStories.isEmpty) {
        _storyStore.addStory(storyRes);
      } else {
        _storyStore.updateStory(storyRes);
      }

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
  void dispose() {
    _storiesToPublish.clear();
  }
}
