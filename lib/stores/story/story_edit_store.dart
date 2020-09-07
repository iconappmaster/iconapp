import 'package:iconapp/data/models/photo_model.dart';
import 'package:iconapp/data/models/story_model.dart';
import 'package:iconapp/stores/story/story_store.dart';
import 'package:iconapp/stores/user/user_store.dart';
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

  _StoryEditStoreBase() {
    _mediaStore = sl<MediaStore>();
    _repository = sl<StoryRepository>();
    _user = sl<UserStore>();
  }

  @observable
  bool _isLoading = false;

  @observable
  ObservableList<StoryImageModel> _storiesToPublish = ObservableList.of([]);

  @computed
  bool get isLoading => _isLoading;

  @computed
  List<StoryImageModel> get stories => _storiesToPublish;

  @computed
  bool get canPublish => _storiesToPublish.isNotEmpty;

  @action
  Future addPhotoMedia() async {
    try {
      _isLoading = true;
      final url = await _mediaStore.uploadPhoto();
      final storyImg = StoryImageModel.photo();
      _storiesToPublish.add(storyImg.copyWith(
          id: DateTime.now().millisecondsSinceEpoch,
          photo: PhotoModel(url: url)));
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
  Future publishStory() async {
    try {
      final story = StoryModel(
        isNew: true,
        user: _user.getUser,
        storyImages: _storiesToPublish.toList()
      );
      await _repository.publishStory(story);
      sl<StoryStore>().refreshStories();
    } on ServerError catch (e) {
      Crash.report(e.message);
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
