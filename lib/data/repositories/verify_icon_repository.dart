import 'package:flutter/foundation.dart';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';

abstract class VerifyIconRepository {
  Future requestIconVerificationCode();
}

class VerifyIconRepositoryImpl implements VerifyIconRepository {
  final RestClient rest;

  VerifyIconRepositoryImpl({
    @required this.rest,
  });

  @override
  Future requestIconVerificationCode() async {
    return await rest.requestIconVerificationCode();
  }
}
