import 'dart:async';
import 'dart:io';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/photo_model.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/data/repositories/auth_repository.dart';
import 'package:iconapp/domain/auth/auth_failure.dart';
import 'package:iconapp/screens/onboarding_profile.dart';
import 'package:iconapp/stores/media/media_store.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'login_state.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

const defaultCountTimeSec = 17;

abstract class _LoginStoreBase with Store {
  AuthRepository _repository;
  MediaStore _mediaStore;
  Timer _timer;

  _LoginStoreBase() {
    _repository = sl<AuthRepository>();
    _mediaStore = sl<MediaStore>();
  }

  @observable
  int _currentCountDown = 0;

  @observable
  SexType selectedSex = SexType.male;

  @computed
  SexType get getSexType => selectedSex;

  @computed
  String get displayCountdown =>
      (defaultCountTimeSec - _currentCountDown).toString();

  @computed
  bool get counterReachedZero => _currentCountDown == 0;

  @computed
  UserModel get getUser => state.userModel;

  @computed
  bool get isUserImageAvailable => state.userModel?.photo?.url != null ?? false;

  @observable
  LoginState state = LoginState.initial();

  @computed
  bool get isIdle => state.phonePageState == PhoneOnboardingState.idle;

  @computed
  bool get numberValid => state.prefix.length == 3 && state.phone.length >= 7;

  @computed
  LoginState get getState => state;

  @action
  setSexType(SexType sexType) {
    this.selectedSex = sexType;
  }

  @action
  Future showUserPhoto(PickedFile file) async {
    // first update with local file
    var photo = PhotoModel(url: file.path);
    final user = getUser.copyWith(photo: photo);
    state = state.copyWith(
      userModel: user,
    );
  }

  @action
  Future uploadAndShowUserPhoto(PickedFile file) async {
    state = state.copyWith(loading: true);

    final fileName = '${DateTime.now().millisecondsSinceEpoch}.png';
    final filePath = File(file.path);
    final url = await _mediaStore.uploadPhoto(filePath, '', fileName);

    final user = getUser.copyWith(photo: PhotoModel(url: url));
    state = state.copyWith(loading: false, userModel: user);
  }

  @action
  updateUserName(String fullName) {
    state = state.copyWith(userModel: getUser.copyWith(fullName: fullName));
  }

  @action
  updateUserAge(String age) {
    state = state.copyWith(userModel: getUser.copyWith(fullName: age));
  }

  @action
  updatePhone(String phone) {
    state = state.copyWith(phone: phone);
  }

  @action
  updatePhonePrefix(String prefix) {
    state = state.copyWith(prefix: prefix);
  }

  @action
  updateCode(String code) {
    state = state.copyWith(code: code);
  }

  @action
  Future verifyPhone() async {
    startCountDown();
    state = state.copyWith(
      loading: true,
      phonePageState: PhoneOnboardingState.sent,
    );

    final handleFailure = (AuthFailure failure) {
      state = state.copyWith(
          phonePageState: PhoneOnboardingState.idle,
          errorMessage: failure.maybeWhen(
            serverError: () => 'Server error',
            orElse: () => null,
          ));
    };

    final handleSuccess = (_) {};

    final fullNumber = state.prefix + state.phone;

    final failureOrSuccess = await _repository.verifyPhone(fullNumber);
    failureOrSuccess.fold(
      handleFailure,
      handleSuccess,
    );
  }

  @action
  Future verifySms() async {
    state = state.copyWith(loading: true);

    final handleFailure = (AuthFailure failure) {
      state = state.copyWith(
          errorMessage: failure.maybeWhen(
              wrongCode: () => 'wrong code', orElse: () => null));
    };

    final handleSuccess = (_) {};

    final fullNumber = state.prefix + state.phone;
    final code = state.code;

    final failureOrSuccess = await _repository.verifyCode(fullNumber, code);
    failureOrSuccess.fold(
      handleFailure,
      handleSuccess,
    );
  }

  @action
  Future sendAgain() async {
    state = state.copyWith(
      phonePageState: PhoneOnboardingState.idle,
      code: '',
    );
  }

  void startCountDown() {
    if (_timer == null) {
      _timer = Timer.periodic(
        Duration(seconds: 1),
        (time) {
          _currentCountDown = time.tick;
          if (time.tick == defaultCountTimeSec) {
            time.cancel();
          }
        },
      );
    }
  }

  void dispose() {
    state = LoginState.initial();
    _currentCountDown = 0;
    _timer = null;
  }
}
