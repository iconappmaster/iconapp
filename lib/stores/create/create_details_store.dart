import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/repositories/create_repository.dart';
import 'package:iconapp/data/repositories/search_repository.dart';
import 'package:iconapp/stores/create/create_category_store.dart';
import 'package:iconapp/stores/create/create_icon_store.dart';
import 'package:iconapp/stores/media/media_store.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
part 'create_details_store.g.dart';

class CreateDetailsStore = _CreateDetailsStoreBase with _$CreateDetailsStore;

abstract class _CreateDetailsStoreBase with Store {
  CreateRepository _repository;
  CreateIconStore _iconStore;
  CreateCategoryStore _categoryStore;
  MediaStore _mediaStore;

  _CreateDetailsStoreBase() {
    _repository = sl<CreateRepository>();
    _iconStore = sl<CreateIconStore>();
    _categoryStore = sl<CreateCategoryStore>();
    _mediaStore = sl<MediaStore>();
  }
  @observable
  String _groupName = '';

  @observable
  String _selectedPhoto = '';

  @observable
  bool isLoading = false;

  @computed
  String get getSelectedPhoto => _selectedPhoto;

  @action
  void updateGroupName(String name) {
    _groupName = name;
  }

  @action
  Future selectGroupPhoto() async {
    try {
      isLoading = true;
      final photo = await _mediaStore.uploadPhoto(ImageSource.gallery);
      _selectedPhoto = photo;
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<Either<ServerError, Unit>> createGroup() async {
    try {
      isLoading = true;

      final icons = _iconStore.getSelectedIcons;
      final categories = _categoryStore.getSelectedCategories;

      // final result = await _repository.createConversation(contacts, categoriesIds);
      return right(unit);
    } on ServerError catch (e) {
      return left(e);
    } finally {
      isLoading = false;
    }
  }
}
