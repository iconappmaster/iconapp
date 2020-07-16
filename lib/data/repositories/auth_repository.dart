import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:iconapp/data/sources/local/shared_preferences.dart';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';
import 'package:iconapp/domain/auth/auth_failure.dart';

abstract class AuthRepository {
  bool isSignIn();
  bool isOboarding();
  Future<void> signOut();
  Future<Either<AuthFailure, Unit>> verifyPhone(String phone);
  Future<Either<AuthFailure, Unit>> verifyCode(String phone, String code);
}

class AuthRepositoryImpl implements AuthRepository {
  final RestClient restClient;
  final SharedPreferencesService sp;

  AuthRepositoryImpl({
    @required this.restClient,
    @required this.sp,
  });

  @override
  bool isSignIn() =>
      sp.contains(StorageKey.user) && sp.getBool(StorageKey.signedIn);

  @override
  bool isOboarding() => sp.getBool(StorageKey.isFinishedOnboarding);

  @override
  Future<void> signOut() async => sp.clear();

  @override
  Future<Either<AuthFailure, Unit>> verifyPhone(String phone) async {
    try {
      await restClient.verifyPhone(phone);
      return right(unit);
    } on PlatformException catch (_) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> verifyCode(
      String phone, String code) async {
    try {
      await restClient.verifyCode(phone, code);
      return right(unit);
    } on PlatformException catch (e) {
      if (e.code == 'ERROR_WRONG_SMS') {
        return left(const AuthFailure.wrongCode());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }
}
