import 'package:dartz/dartz.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/create_group_req.dart';
import 'package:iconapp/data/models/photo_model.dart';
import 'package:iconapp/data/repositories/create_repository.dart';
import 'package:iconapp/domain/core/errors.dart';
import 'package:iconapp/stores/create/create_category_store.dart';
import 'package:iconapp/stores/create/create_icon_store.dart';
import 'package:iconapp/stores/home/home_store.dart';
import 'package:iconapp/stores/media/media_store.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
part 'create_details_store.g.dart';

class CreateDetailsStore = _CreateDetailsStoreBase with _$CreateDetailsStore;

abstract class _CreateDetailsStoreBase with Store {
  CreateRepository _repository;
  CreateIconStore _iconStore;
  CreateCategoryStore _categoryStore;
  HomeStore _homeStore;
  MediaStore _mediaStore;

  _CreateDetailsStoreBase() {
    _repository = sl<CreateRepository>();
    _iconStore = sl<CreateIconStore>();
    _categoryStore = sl<CreateCategoryStore>();
    _mediaStore = sl<MediaStore>();
    _homeStore = sl<HomeStore>();
  }
  @observable
  String _groupName = '';

  @observable
  String _selectedPhoto = '';

  @observable
  bool isLoading = false;

  @computed
  String get getSelectedPhoto => _selectedPhoto;

  @computed
  String get groupName => _groupName;

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
      final category = _categoryStore.getSelectedCategory;

      final req = CreateGroupReq(
        categoryId: category.id,
        users: icons,
        photo: PhotoModel(url: _selectedPhoto),
        name: _groupName,
      );

      final conversation = await _repository.createConversation(req);

      _homeStore.addConversation(conversation);
      // await _homeStore.getHome();

      return right(unit);
    } on ServerError catch (e) {
      return left(e);
    } finally {
      isLoading = false;
    }
  }

  @action
  void clear() {
    _groupName = '';
    _selectedPhoto = '';
  }
}
