import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:iconapp/data/sources/local/shared_preferences.dart';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';
 

abstract class AuthRepository {
  bool isSignIn();
  bool isOboarding();
  Future<void> signOut();
  Future<void> setSignIn([bool isFinished = true]);
  
}

class AuthRepositoryImpl implements AuthRepository {
  final RestClient restClient;
  final SharedPreferencesService sp;

  AuthRepositoryImpl({
    @required this.restClient,
    @required this.sp,
  });

   // TODO UPDATE THIS TO CHECK USER ALSO
  @override
  bool isSignIn() =>
      // sp.contains(StorageKey.user) && sp.getBool(StorageKey.signedIn);
      sp.getBool(StorageKey.signedIn);

  @override
  Future<void> setSignIn([bool signedIn = true]) {
    // return sp.setBool(StorageKey.isFinishedOnboarding, isFinished);
    return sp.setBool(StorageKey.signedIn, signedIn);
  }

  @override
  bool isOboarding() => sp.getBool(StorageKey.isFinishedOnboarding);

  @override
  Future<void> signOut() async => sp.clear();

}
