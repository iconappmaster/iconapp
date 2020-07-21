import 'dart:io';

import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/photo_model.dart';
import 'package:iconapp/domain/core/value_validators.dart';
import 'package:iconapp/stores/media/media_store.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

import 'onboarding_state.dart';
part 'onboarding_store.g.dart';

enum GenderType { other, male, female }

class OnboardingStore = _OnboardingStoreBase with _$OnboardingStore;

abstract class _OnboardingStoreBase with Store {
  MediaStore _mediaStore;

  _OnboardingStoreBase() {
    _mediaStore = sl<MediaStore>();
  }

  @observable
  GenderType _selectedGender = GenderType.male;

  @observable
  OnboardingState state = OnboardingState.initial();

  @computed
  GenderType get getGenderType => _selectedGender;

  @computed
  OnboardingState get getState => state;

  @computed
  bool get isUserImageAvailable => state.userModel?.photo?.url != null ?? false;

  @action
  bool validateUserAge() {
    final age = state.userModel.age ?? 0;
    return validateAge(age);
  }

  @action
  bool validateUserName() {
    final name = state.userModel.fullName ?? '';
    return validateName(name);
  }

  @action
  Future pickPhoto([bool upload = false]) async {
    // pick photo and show localy
    final imagePicker = sl<ImagePicker>();
    final file = await imagePicker.getImage(source: ImageSource.gallery);
    final photo = PhotoModel(url: file.path);
    final user = state.userModel.copyWith(photo: photo);

    state = state.copyWith(
      loading: upload,
      userModel: user,
    );

    if (upload) {
      // upload photo to firebase
      final url = await _mediaStore.uploadPhoto(File(file.path), '');

      // show photo from remote and update local photo to firebase link
      state = state.copyWith(
        loading: false,
        userModel: state.userModel.copyWith(
          photo: photo.copyWith(url: url),
        ),
      );
    }
  }

  @action
  void setSexType(GenderType sexType) {
    this._selectedGender = sexType;
  }

  @action
  void updateUserName(String fullName) {
    state =
        state.copyWith(userModel: state.userModel.copyWith(fullName: fullName));
  }

  @action
  void updateUserAge(int age) {
    state = state.copyWith(userModel: state.userModel.copyWith(age: age));
  }
}
