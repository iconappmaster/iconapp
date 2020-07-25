import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/data/sources/local/shared_preferences.dart';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';
import 'package:iconapp/stores/user/user_store.dart';

abstract class UserRepository {
  Future<UserModel> updateUser(UserModel user);
  Future<bool> persistUser(UserModel user);
  Future<UserModel> getPersistedUser();
}

class UserRepositoryImpl implements UserRepository {
  RestClient restClient;
  final SharedPreferencesService sp;

  UserRepositoryImpl({@required this.restClient, @required this.sp});

  @override
  Future<UserModel> updateUser(UserModel userModel) async {
    // TODO GET RID OF THE TOKEN IN THE REQ
    final user =
        await restClient.updateUser(userModel, sl<UserStore>().getToken);
    return user;
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
