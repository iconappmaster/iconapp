import 'dart:convert';

import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/data/sources/local/shared_preferences.dart';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';

abstract class UserRepository {
  Future<UserModel> updateUser(UserModel user);
  Future deleteUser(int id);
  Future persistUser(UserModel user);
  Future<UserModel> getPersistedUser();
}

class UserRepositoryImpl implements UserRepository {
  RestClient restClient;
  final SharedPreferencesService sp;

  UserRepositoryImpl({this.restClient, this.sp});

  @override
  Future deleteUser(int id) {
    throw UnimplementedError();
  }

  @override
  Future<UserModel> updateUser(UserModel userModel) {
    throw UnimplementedError();
  }

  @override
  Future<bool> persistUser(UserModel user) async {
    return await sp.setString(StorageKey.user, jsonEncode(user.toJson()));
  }

  @override
  Future<UserModel> getPersistedUser() async {
     UserModel user;
    if (sp.contains(StorageKey.user)) {
      final userJson = sp.getString(StorageKey.user);
      user = UserModel.fromJson(jsonDecode(userJson));
    }
    return user;
  }
}