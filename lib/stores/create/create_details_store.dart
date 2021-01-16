import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/firebase/crashlytics.dart';
import 'package:iconapp/data/models/create_group_req.dart';
import 'package:iconapp/data/models/photo_model.dart';
import 'package:iconapp/data/repositories/create_repository.dart';
import 'package:iconapp/domain/core/errors.dart';
import 'package:iconapp/domain/create/create_failure.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/stores/create/create_category_store.dart';
import 'package:iconapp/stores/create/create_icon_store.dart';
import 'package:iconapp/stores/home/home_store.dart';
import 'package:iconapp/stores/media/media_store.dart';
import 'package:image_picker/image_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mobx/mobx.dart';
part 'create_details_store.g.dart';

class CreateDetailsStore = _CreateDetailsStoreBase with _$CreateDetailsStore;

abstract class _CreateDetailsStoreBase with Store {
  CreateRepository _repository;
  CreateIconStore _iconStore;
  CreateCategoryStore _categoryStore;
  HomeStore _home;
  MediaStore _mediaStore;

  _CreateDetailsStoreBase() {
    _repository = sl<CreateRepository>();
    _iconStore = sl<CreateIconStore>();
    _categoryStore = sl<CreateCategoryStore>();
    _mediaStore = sl<MediaStore>();
    _home = sl<HomeStore>();
  }
  @observable
  String _groupName = '';

  @observable
  String _selectedPhoto = '';

  @observable
  int conversationPrice;

  @observable
  bool isLoading = false;

  @observable
  int _currentGroupTypeIndex = 0;

  @computed
  int get currentGroupTypeIndex => _currentGroupTypeIndex;

  @computed
  String get getSelectedPhoto => _selectedPhoto;

  @computed
  String get getSwitchSelectionDescription {
    switch (_currentGroupTypeIndex) {
      case 0:
        return LocaleKeys.create_pubicDetail.tr();

      case 1:
        return LocaleKeys.create_passwordDetail.tr();

      case 2:
        return LocaleKeys.create_premiumDetail.tr();
    }
    return "";
  }

  @computed
  String get groupName => _groupName;

  @action
  void updateGroupName(String name) {
    _groupName = name;
  }

  @action
  void setGroupType(int index) {
    _currentGroupTypeIndex = index;
  }

  @action
  Future selectGroupPhoto() async {
    try {
      isLoading = true;
      final photo = await _mediaStore.uploadPhoto(source: ImageSource.gallery);
      _selectedPhoto = photo;
    } on ServerError catch (e) {
      Crash.report(e.message);
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<Either<CreateFailure, Unit>> createGroup() async {
    try {
      isLoading = true;

      final icons = _iconStore.getSelectedIcons;
      final category = _categoryStore.getSelectedCategory;

      final req = CreateGroupReq(
        categoryId: category.id,
        users: icons,
        conversationPrice: conversationPrice,
        backgroundPhoto: PhotoModel(url: _selectedPhoto),
        name: _groupName,
        conversationType: _getConversationType(),
      );

      final conversation = await _repository.createConversation(req);
      _home.addConversation(conversation);

      return right(unit);
    } on Exception catch (e) {
      if (e is DioError && e.response.data['error'] == 'Validation failed: Name has already been taken') {
        return left(CreateFailure.wrongName());
      } else {
        return left(CreateFailure.generalError());
      }
    } finally {
      isLoading = false;
    }
  }

  @action
  dispose() {
    _groupName = '';
    _selectedPhoto = '';
    conversationPrice = 0;
  }

  String _getConversationType() {
    switch (_currentGroupTypeIndex) {
      case 0:
        return "public";
      case 1:
        return "private_code";
      case 2:
        return "private_premium";
    }

    return '';
  }
}
