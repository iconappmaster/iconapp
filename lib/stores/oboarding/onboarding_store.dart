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
  Future pickAndUploadPhoto() async {
    _state = _state.copyWith(loading: true);
    try {
      final url = await _mediaStore.uploadPhoto(ImageSource.gallery);

      _state = _state.copyWith(
        loading: false,
        userModel: _state.userModel.copyWith(
          photo: PhotoModel(url: url),
        ),
      );
    } on Exception catch (_) {
      print('cant pick photo');
    } finally {
      _state = _state.copyWith(loading: false);
    }
  }

  @action
  Future<Either<Exception, bool>> upadteUser() async {
    try {
      final phone = _userStore.getUser.phone;
      _state = _state.copyWith(loading: true, userModel: _state.userModel.copyWith(phone: phone));
      final saved = await _userStore.updateUser(_state.userModel);
      if (saved) _authStore.setSignedIn();
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
    final user = _state.userModel.copyWith(fullName: fullName.trim());
    _state = _state.copyWith(userModel: user);
  }

  @action
  void updateUserAge(int age) {
    final user = _state.userModel.copyWith(age: age);
    _state = _state.copyWith(userModel: user);
  }
}
