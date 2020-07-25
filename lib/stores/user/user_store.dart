import 'dart:convert';
import 'dart:io';

import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/data/repositories/user_repository.dart';
import 'package:iconapp/stores/media/media_store.dart';
import 'package:mobx/mobx.dart';
import '../../data/sources/local/shared_preferences.dart';

part 'user_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  UserRepository _userRepository;
  MediaStore _mediaStore;
  SharedPreferencesService _prefs;

  _UserStoreBase() {
    _userRepository = sl<UserRepository>();
    _mediaStore = sl<MediaStore>();
    _prefs = sl<SharedPreferencesService>(); 
  }

  @observable
  UserModel userModel = UserModel();

  @computed
  String get getToken => userModel?.sessionToken ?? '';

  @action
  Future<String> uploadUserPhoto(
      File original, String path, String fileName) async {
    return await _mediaStore.uploadPhoto(original, path);
  }

  @action
  Future<bool> persistUser(UserModel user) async {
   return await _prefs.setString(StorageKey.user, jsonEncode( user.toJson()));
  }

  @action
  Future<bool> updateUser(UserModel user) async {
    final createdUser = await _userRepository.updateUser(user);
    return await _userRepository.persistUser(createdUser);
  }

  @action
  Future getCurrentUser() async {
    return await _userRepository.getPersistedUser();
  }
}
