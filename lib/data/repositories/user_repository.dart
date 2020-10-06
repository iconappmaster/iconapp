import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/data/sources/local/shared_preferences.dart';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';

abstract class UserRepository {
  Future<UserModel> updateUser(UserModel user);
  Future<UserModel> getRemtoeUser();
  Future<bool> persistUser(UserModel user);
  Future<UserModel> getPersistedUser();
  Future<bool> reportUser(int userId, String reportExplanation);
  Future turnOnNotifications();
  Future turnOffNotifications();
}

class UserRepositoryImpl implements UserRepository {
  RestClient restClient;
  final SharedPreferencesService sp;

  UserRepositoryImpl({@required this.restClient, @required this.sp});

  @override
  Future<UserModel> updateUser(UserModel userModel) async {
    final user = await restClient.updateUser(userModel);
    return user;
  }

  @override
  Future<bool> persistUser(UserModel user) async {
    return sp.setString(StorageKey.user, jsonEncode(user.toJson()));
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

  @override
  Future<UserModel> getRemtoeUser() async {
    return await restClient.getUser();
  }

  @override
  Future turnOffNotifications() async {
    return await restClient.turnOffNotifications();
  }

  @override
  Future turnOnNotifications() async {
    return await restClient.turnOnNotifications();
  }

  @override
  Future<bool> reportUser(int userId, String reportExplanation) async {
    return await restClient.reportUser(userId, reportExplanation);
  }
}
