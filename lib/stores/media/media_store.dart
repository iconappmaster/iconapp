import 'dart:io';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/repositories/media_repository.dart';
import 'package:iconapp/stores/user/user_store.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
part 'media_store.g.dart';

class MediaStore = _MediaStoreBase with _$MediaStore;

abstract class _MediaStoreBase with Store {
  MediaRepository _repository;
  ImagePicker _imagePicker;
  UserStore _userStore;

  @observable
  bool _isLoading = false;

  @computed
  bool get loading => _isLoading;

  _MediaStoreBase() {
    _repository = sl<MediaRepository>();
    _imagePicker = sl<ImagePicker>();
    _userStore = sl<UserStore>();
  }

  Future<String> uploadPhoto(
      {ImageSource source = ImageSource.gallery, File file}) async {
    String result = '';
    try {
      _isLoading = true;
      if (file != null) {
        result = await _repository.uploadSinglePhoto(
            file, getPath, getPhotoFileName);
      } else {
        final pickedFile = await _imagePicker.getImage(source: source);
        final file = File(pickedFile.path);
        result = await _repository.uploadSinglePhoto(
            file, getPath, getPhotoFileName);
      }

      // cancel loadoing
      _isLoading = false;

      return result;
    } on Exception catch (e) {
      print(e);
    } finally {
      _isLoading = false;
    }

    return result;
  }

  Future<String> uploadVideo(
      {ImageSource source = ImageSource.gallery, String path}) async {
    String result = '';

    try {
      _isLoading = true;
      if (path != null) {
        result = await _repository.uploadVideo(
            File(path), getPath, getPhotoFileName);
      } else {
        final pickedFile = await _imagePicker.getVideo(source: source);
        final file = File(pickedFile.path);
        result = await _repository.uploadVideo(file, getPath, getPhotoFileName);
      }

      // cancel loadoing
      _isLoading = false;

      return result;
    } on Exception catch (e) {
      print(e);
    } finally {
      _isLoading = false;
    }

    return result;
  }

  Future<String> uploadAudio(String path) async {
    try {
      _isLoading = true;
      final result =
          await _repository.uploadAudio(File(path), getPath, getAudioFileName);
      _isLoading = false;
      return result;
    } on Exception catch (_) {
      return '';
    }
  }

  String get getPath => _userStore.getUser.phone;
  String get getPhotoFileName => '${DateTime.now().millisecondsSinceEpoch}.png';
  String get getAudioFileName => '${DateTime.now().millisecondsSinceEpoch}.mp4';
}
