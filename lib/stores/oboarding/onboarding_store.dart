import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/photo_model.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/domain/core/value_validators.dart';
import 'package:iconapp/stores/auth/auth_store.dart';
import 'package:iconapp/stores/media/media_store.dart';
import 'package:iconapp/stores/user/user_store.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'onboarding_state.dart';
part 'onboarding_store.g.dart';

class OnboardingStore = _OnboardingStoreBase with _$OnboardingStore;

abstract class _OnboardingStoreBase with Store {
  MediaStore _mediaStore;
  UserStore _userStore;
  AuthStore _authStore;

  _OnboardingStoreBase() {
    _mediaStore = sl<MediaStore>();
    _userStore = sl<UserStore>();
    _authStore = sl<AuthStore>();
  }

  @observable
  OnboardingState _state = OnboardingState.initial();

  @computed
  OnboardingState get getState => _state;

  @computed
  String get getUserPhoto => _state?.userModel?.photo?.url;

  @computed
  bool get isUserImageAvailable =>
      _state.userModel?.photo?.url != null ?? false;

  @action
  bool validateUserAge() {
    final age = _state.userModel.age ?? 0;
    return validateAge(age);
  }

  @action
  bool validateUserName() {
    final name = _state.userModel.fullName ?? '';
    return validateName(name);
  }

  @action
  Future pickPhoto([bool upload = false]) async {
    // pick photo and show localy
    final imagePicker = sl<ImagePicker>();
    final file = await imagePicker.getImage(source: ImageSource.gallery);
    final photo = PhotoModel(url: file.path);
    final user = _state.userModel.copyWith(photo: photo);

    _state = _state.copyWith(
      loading: upload,
      userModel: user,
    );

    if (upload) {
      // upload photo to firebase
      final url = await _mediaStore.uploadPhoto(ImageSource.gallery);

      // show photo from remote and update local photo to firebase link
      _state = _state.copyWith(
        loading: false,
        userModel: _state.userModel.copyWith(
          photo: photo.copyWith(url: url),
        ),
      );
    }
  }

  @action
  Future<Either<Exception, bool>> createUser() async {
    try {
      _state = _state.copyWith(loading: true);
      final user = _state.userModel;
      final saved = await _userStore.updateUser(user);

      if (saved) {
        _authStore.setSignedIn();
      }

      return right(saved);
    } on DioError catch (e) {
      return left(e);
    } finally {
      _state = _state.copyWith(loading: false);
    }
  }

  @action
  void updateUserGender(UserGender gender) {
    final user = _state.userModel.copyWith(gender: gender);
    _state = _state.copyWith(userModel: user);
  }

  @action
  void updateUserName(String fullName) {
    final user = _state.userModel.copyWith(fullName: fullName);
    _state = _state.copyWith(userModel: user);
  }

  @action
  void updateUserAge(int age) {
    final user = _state.userModel.copyWith(age: age);
    _state = _state.copyWith(userModel: user);
  }
}
