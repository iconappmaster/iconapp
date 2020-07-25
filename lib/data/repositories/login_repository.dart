import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:iconapp/data/models/user_model.dart';
import '../../domain/auth/auth_failure.dart';
import '../sources/remote/rest/rest_client.dart';

abstract class LoginRepository {
  Future<Either<AuthFailure, Unit>> verifyPhone(String phone);
  Future<UserModel> verifyCode(String phone, String code);
}

class LoginRepositoryImpl implements LoginRepository {
  final RestClient restClient;

  LoginRepositoryImpl({this.restClient});

  @override
  Future<Either<AuthFailure, Unit>> verifyPhone(String phone) async {
    try {
      await restClient.verifyPhone(phone);
      return right(unit);
    } on DioError catch (_) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<UserModel> verifyCode(String phone, String code) async {
    return await restClient.verifyCode(phone, code);
  }
}
