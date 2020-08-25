import 'dart:convert';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/data/repositories/user_repository.dart';
import 'package:mobx/mobx.dart';
import '../../data/sources/local/shared_preferences.dart';

part 'user_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  UserRepository _userRepository;
  SharedPreferencesService _prefs;

  _UserStoreBase() {
    _userRepository = sl<UserRepository>();
    _prefs = sl<SharedPreferencesService>();
  }

  @observable
  UserModel _userModel = UserModel();

  @observable
  bool _isNotification = true;

  @computed
  bool get isNotification => _isNotification;

  @computed
  String get getToken => _userModel?.sessionToken ?? '';

  @computed
  UserModel get getUser => _userModel;

  @computed
  get notificationState => _isNotification;

  @action
  void updateNotificationState(bool value) {
    _isNotification = value;
  }

  @action
  Future init() async {
    try {
      final persistnetUser = await _userRepository.getPersistedUser();
      _userModel = persistnetUser;
      _isNotification = _userModel?.isPushEnabled ?? true;
      final user = await _userRepository.getRemtoeUser();
      _userRepository.persistUser(user);
      _userModel = user;
    } on Exception catch (e) {
      print(e);
    }
  }

  @action
  Future<bool> persistUser(UserModel user) async {
    return await _prefs.setString(
      StorageKey.user,
      jsonEncode(
        user.toJson(),
      ),
    );
  }

  @action
  Future<bool> updateUser(UserModel user) async {
    final createdUser = await _userRepository.updateUser(user);
    final saved = await _userRepository.persistUser(createdUser);
    _userModel = createdUser;
    return saved;
  }

  @action
  Future<UserModel> getPersistentUser() async {
    return await _userRepository.getPersistedUser();
  }

  @action
  void setUser(UserModel user) {
    _userModel = user;
  }

  @action
  Future setNotification(bool value) async {
    try {
      value
          ? _userRepository.turnOffNotifications()
          : _userRepository.turnOnNotifications();

      _isNotification = value;
    } on Exception catch (e) {
      print(e);
    }
  }

  bool isMe(int id) => (id == getUser?.id) ?? false;
}
