import 'dart:convert';
import 'dart:io';
import 'package:iconapp/core/firebase/crashlytics.dart';
import 'package:iconapp/domain/core/errors.dart';
import 'package:mobx/mobx.dart';
import '../../core/dependencies/locator.dart';
import '../../data/models/user_model.dart';
import '../../data/repositories/user_repository.dart';
import '../home/home_store.dart';
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
  String _sessionToken = '';

  @observable
  bool _isNotification = true;

  @computed
  bool get isNotification => _isNotification;

  @computed
  String get getSessionToken => _sessionToken;

  @computed
  UserModel get getUser => _userModel;

  @computed
  get notificationState => _isNotification;

  @action
  Future init() async {
    try {
      final persistnetUser = await _userRepository.getSavedUser();
      _userModel = persistnetUser;
      
      _sessionToken = _prefs.getString(StorageKey.sessionToken);

      // get if notifications are on
      _isNotification = _userModel?.didTurnOffNotifications ?? true;

      // fetch the user from remote
      final remoteUser = await _userRepository.getRemtoeUser();

      // update and persist
      _userRepository.saveUser(remoteUser);

      setUser(remoteUser);
    } on ServerError catch (e) {
      Crash.report(e.message);
    }
  }

  @action
  Future<bool> save(UserModel user) async {
    return await _prefs.setString(StorageKey.user, jsonEncode(user.toJson()));
  }

  @action
  Future<bool> saveSessionToken(String sessionToken) async {
    return await _prefs.setString(StorageKey.sessionToken, sessionToken);
  }

  @action
  Future<bool> updateUser(UserModel user) async {
    final createdUser = await _userRepository.updateUser(user);
    final saved = await _userRepository.saveUser(createdUser);
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
        (e) => Crash.report(e.message),
        (conversations) => home.updateUi(conversations),
      );
    } on ServerError catch (e) {
      Crash.report(e.message);
    }
  }

  @action
  Future updatePushToken(String pushToken) async {
    try {
      final ios = Platform.isIOS;
      _userRepository.updatePushToken(pushToken, ios ? 'iOS' : 'Android');
    } on ServerError catch (e) {
      Crash.report(e.message);
    }
  }
 

  bool isMe(int id) => (id == getUser?.id) ?? false;
}
