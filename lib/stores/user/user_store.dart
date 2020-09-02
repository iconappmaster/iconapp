import 'dart:convert';
import 'dart:math';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/data/repositories/user_repository.dart';
import 'package:iconapp/stores/home/home_store.dart';
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
  Future init() async {
    try {
      final persistnetUser = await _userRepository.getPersistedUser();
      _userModel = persistnetUser;
      _isNotification = _userModel?.didTurnOffNotifications ?? true;
      final user = await _userRepository.getRemtoeUser();
      _userRepository.persistUser(user);
      _userModel = user;
    } on Exception catch (e) {
      print(e);
    }
  }

  @action
  Future<bool> persistUser(UserModel user) async {
    return await _prefs.setString(StorageKey.user, jsonEncode(user.toJson()));
  }

  @action
  Future<bool> updateUser(UserModel user) async {
    final createdUser = await _userRepository.updateUser(user);
    final saved = await _userRepository.persistUser(createdUser);
    _userModel = createdUser;
    return saved;
  }

  @action
  void setUser(UserModel user) {
    _userModel = user;
  }

  @action
  Future setNotification(bool value) async {
    try {
      _isNotification = value;
      
      value
          ? await _userRepository.turnOnNotifications()
          : await _userRepository.turnOffNotifications();

      final home = sl<HomeStore>();
      final result = await home.getConversations();
      result.fold(
        (e) => print(e),
        (conversations) => home.setConversations(conversations),
      );
    } on Exception catch (e) {
      print(e);
    }
  }

  @action
  Future updateFcmToken() async {
    try {
      final token = _prefs.getString(StorageKey.fcmToken);

      if (token != null) {
        await _userRepository.updateUser(getUser.copyWith(pushToken: token));
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  bool isMe(int id) => (id == getUser?.id) ?? false;
}
