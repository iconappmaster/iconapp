import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/firebase/crashlytics.dart';
import 'package:iconapp/data/models/photo_model.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/data/sources/local/shared_preferences.dart';
import 'package:iconapp/domain/core/errors.dart';
import 'package:iconapp/domain/core/value_validators.dart';
import 'package:iconapp/stores/analytics/analytics_consts.dart';
import 'package:iconapp/stores/auth/auth_store.dart';
import 'package:iconapp/stores/media/media_store.dart';
import 'package:iconapp/stores/user/user_store.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import '../analytics/analytics_firebase.dart';
import 'onboarding_state.dart';
part 'onboarding_store.g.dart';

class OnboardingStore = _OnboardingStoreBase with _$OnboardingStore;

abstract class _OnboardingStoreBase with Store {
  MediaStore _mediaStore;
  UserStore _userStore;
  AuthStore _authStore;
  SharedPreferencesService _sp;

  _OnboardingStoreBase() {
    _sp = sl<SharedPreferencesService>();
    _mediaStore = sl<MediaStore>();
    _userStore = sl<UserStore>();
    _authStore = sl<AuthStore>();

     analytics.sendAnalyticsEvent(STARTED_REGISTRATION, {});
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
      final url = await _mediaStore.uploadPhoto(source: ImageSource.gallery);

      _state = _state.copyWith(
        loading: false,
        userModel: _state.userModel.copyWith(
          photo: PhotoModel(url: url),
        ),
      );
    } on ServerError catch (e) {
      Crash.report(e.message);
    } finally {
      _state = _state.copyWith(loading: false);
    }
  }

  @action
  Future<Either<Exception, bool>> updateUser() async {
    try {
      final phone = _userStore.getUser.phone;
      final token = _sp?.getString(StorageKey.fcmToken) ?? '';

      _state = _state.copyWith(
        loading: true,
        userModel: _state.userModel.copyWith(
          phone: phone,
          pushToken: token,
        ),
      );

      final saved = await _userStore.updateUser(_state.userModel);
      if (saved) _authStore.setSignedIn();
      return right(saved);
    } on DioError catch (e) {
      Crash.report(e.message);
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

  @action
  void initPersonalDetails(UserModel user) {
    _state = _state.copyWith(userModel: user);
  }
}
