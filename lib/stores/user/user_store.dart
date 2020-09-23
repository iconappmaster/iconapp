import 'dart:convert';
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
      updateFcmToken();
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
        (e) => Crash.report(e.message),
        (conversations) => home.updateUi(conversations),
      );
    } on ServerError catch (e) {
      Crash.report(e.message);
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
