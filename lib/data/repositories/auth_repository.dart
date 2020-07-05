import 'dart:async';
import 'package:iconapp/data/sources/local/shared_preferences.dart';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';

abstract class AuthRepository {
  Future<bool> isSignIn();
  Future<void> signOut();
  Future<void> verifyPhone(String phone);
  Future<void> verifyCode(String phone, String code);
}

class AuthRepositoryImpl implements AuthRepository {
  final RestClient restClient;
  final SharedPreferencesService sp;

  AuthRepositoryImpl({this.restClient, this.sp});

  @override
  Future<bool> isSignIn() async =>
      sp.contains(StorageKey.user) && sp.getBool(StorageKey.signedIn);

  @override
  Future<void> signOut() async => sp.clear();

  @override
  Future<void> verifyPhone(String phone) async => restClient.verifyPhone(phone);

  @override
  Future<void> verifyCode(String phone, String code) async =>
      restClient.verifyCode(phone, code);
}
