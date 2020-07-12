import 'dart:io';

import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/repositories/media_repository.dart';
import 'package:mobx/mobx.dart';
part 'media_store.g.dart';

class MediaStore = _MediaStoreBase with _$MediaStore;

abstract class _MediaStoreBase with Store {
  MediaRepository _repository;

  _MediaStoreBase() {
    _repository = sl<MediaRepository>();
  }

  Future<String> uploadPhoto(File original, String path, String fileName) async {
    final photoUrl = await _repository.uploadSinglePhoto(original, path, fileName);
    return photoUrl;
  }
}