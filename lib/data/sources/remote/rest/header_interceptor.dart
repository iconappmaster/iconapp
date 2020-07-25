import 'dart:async';

import 'package:dio/dio.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/stores/user/user_store.dart';

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
      counter++;
      dio.interceptors.requestLock.lock();
      dio.interceptors.responseLock.lock();
      RequestOptions options = error.response.request;

      // perform retry here

      dio.interceptors.requestLock.unlock();
      dio.interceptors.responseLock.unlock();
      return dio.request(options.path, options: options);
    } else {
      return error;
    }
  }
}

void addHeaders(RequestOptions options, String token) {
  options.headers['content-Type'] = 'application/json';
  options.headers['Authorization'] = "Bearer " + token ?? '';
  // options.queryParameters = {'token' : token};
}
