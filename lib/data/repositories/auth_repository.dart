import 'dart:async';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';

abstract class AuthRepository {
  Future<bool> isSignIn();
  Future<void> signOut();
  Future<void> verifyPhone(String phone);
  Future<void> verifyCode(String phone, String code);
}

class AuthRepositoryImpl implements AuthRepository {
  final RestClient restClient;

  AuthRepositoryImpl({this.restClient});

  @override
  Future<bool> isSignIn() async {
    throw UnimplementedError;
  }

  @override
  Future<void> signOut() async {
    throw UnimplementedError;
  }

  @override
  Future<void> verifyPhone(String phone) async => restClient.verifyPhone(phone);

  @override
  Future<void> verifyCode(String phone, String code) async =>
      restClient.verifyCode(phone, code);
}
