import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/main.dart';
import 'package:iconapp/stores/user/user_store.dart';

import '../../../../stores/auth/auth_store.dart';

class HeaderInterceptor extends Interceptor {
  final Dio dio;
  int counter = 0;
  static const MAX_TRIES = 5;

  HeaderInterceptor(this.dio);

  @override
  Future<FutureOr> onRequest(RequestOptions options) async {
    // GET TOKEN
    final token = sl<UserStore>().getToken;
    addHeaders(options, token);
    return options;
  }

  @override
  Future<FutureOr> onResponse(Response response) async {
    return response;
  }

  @override
  Future onError(DioError error) async {
    if (counter < MAX_TRIES && error.response?.statusCode == 403 ||
        error.response?.statusCode == 401) {
      dio.interceptors.requestLock.unlock();
      dio.interceptors.responseLock.unlock();
      sl<AuthStore>().logout(false);
    } else {
      return error;
    }
  }
}

void addHeaders(RequestOptions options, String token) {
  options.headers['Authorization'] = "Bearer " + token ?? '';
  if (kDebugMode) logger.d('SESSION TOKEN: $token');
}
