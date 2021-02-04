import 'package:shared_preferences/shared_preferences.dart';

enum StorageKey {
  chatWelcome,
  fcmConversation,
  isFinishedOnboarding,
  user,
  isDev,
  tabPosition,
  signedIn,
  welcomeDialog,
  conversation,
  fcmToken,
  sessionToken,
  home,
  homeViewMode,
  language,
  appForeground,
  tutorialHome,
}

class SharedPreferencesService {
  SharedPreferences _sharedPreferences;
  List<StorageKey> keepKeysOnVersionUpdate = [StorageKey.user];
  List<StorageKey> keepKeysOnLogout = [];

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> setString(StorageKey key, String value) async =>
      await _sharedPreferences.setString(key.toString(), value);

  Future<bool> setCustomString(String key, String value) async =>
      await _sharedPreferences.setString(key, value);

  String getString(StorageKey key) =>
      _sharedPreferences.getString(key.toString());

  String getCustomString(String key) => _sharedPreferences.getString(key);

  void remove(StorageKey key) async {
    await _sharedPreferences.remove(key.toString());
  }

  bool contains(StorageKey key) {
    return _sharedPreferences.containsKey(key.toString());
  }

  bool containsCustom(String key) {
    return _sharedPreferences.containsKey(key);
  }

  void setStringList(StorageKey key, List<String> list) async =>
      await _sharedPreferences.setStringList(key.toString(), list);

  List<String> getStringList(StorageKey key) =>
      _sharedPreferences.getStringList(key.toString());

  bool getBool(StorageKey key, [bool defaultValue = false]) =>
      _sharedPreferences.getBool(key.toString()) ?? defaultValue;

  void setInt(StorageKey key, int value) async =>
      await _sharedPreferences.setInt(key.toString(), value);

  int getInt(StorageKey key) => _sharedPreferences.getInt(key.toString());

  Future<bool> setBool(StorageKey key, bool value) async =>
      await _sharedPreferences.setBool(key.toString(), value);

  Future<bool> clear() async {
    return await _sharedPreferences.clear();
  }
}
