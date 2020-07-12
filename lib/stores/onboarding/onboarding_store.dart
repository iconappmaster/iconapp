import 'dart:io';

import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/data/repositories/user_repository.dart';
import 'package:iconapp/stores/media/media_store.dart';
import 'package:mobx/mobx.dart';
part 'onboarding_store.g.dart';

class OnboardingStore = _OnboardingStoreBase with _$OnboardingStore;

abstract class _OnboardingStoreBase with Store {
  UserRepository _userRepository;
  MediaStore _mediaStore;

  _OnboardingStoreBase() {
    _userRepository = sl<UserRepository>();
    _mediaStore = sl<MediaStore>();
  }

  @observable
  UserModel userModel = UserModel();

  @action
  Future<String> uploadUserPhoto(
      File original, String path, String fileName) async {
    return await _mediaStore.uploadPhoto(original, path, fileName);
  }

  @action
  Future updateUser(UserModel user) async {
    final createdUser = await _userRepository.updateUser(user);
    await _userRepository.persistUser(createdUser);
  }

  @action
  Future getCurrentUser() async {
    return await _userRepository.getPersistedUser();
  }
}
