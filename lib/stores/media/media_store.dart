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

  Future<String> uploadPhoto(ImageSource source, [File file]) async {
    String result = '';
    _isLoading = true;
    if (file != null) {
      result = await _repository.uploadSinglePhoto(file, getPath, getFileName);
    } else {
      final pickedFile = await _imagePicker.getImage(source: source);
      final file = File(pickedFile.path);
      result = await _repository.uploadSinglePhoto(file, getPath, getFileName);
    }

    // cancel loadoing
    _isLoading = false;

    return result;
  }

  Future<String> uploadVideo(ImageSource source) async {
    final videoFile = await _imagePicker.getVideo(source: source);
    final file = File(videoFile.path);
    return await _repository.uploadVideo(file, getPath, getFileName);
  }

  String get getPath => _userStore.getUser.phone;
  String get getFileName => '${DateTime.now().millisecondsSinceEpoch}.png';
}
