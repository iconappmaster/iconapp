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

  _MediaStoreBase() {
    _repository = sl<MediaRepository>();
    _imagePicker = sl<ImagePicker>();
    _userStore = sl<UserStore>();
  }

  Future<String> uploadPhoto(ImageSource source) async {
    final pickedFile = await _imagePicker.getImage(source: source);
    final file = File(pickedFile.path);
    return await _repository.uploadSinglePhoto(file, getPath, getFileName);
  }

  Future<String> uploadVideo(ImageSource source) async {
    final videoFile = await _imagePicker.getVideo(source: source);
    final file = File(videoFile.path);
    return await _repository.uploadVideo(file, getPath, getFileName);
  }

  String get getPath => _userStore.userModel.phone;
  String get getFileName => '${DateTime.now().millisecondsSinceEpoch}.png';
}
