import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:iconapp/main.dart';

class LoggingInterceptors extends Interceptor {
  @override
  Future<FutureOr> onRequest(RequestOptions options) async {
    logger.i(
        "--> ${options.method != null ? options.method.toUpperCase() : 'METHOD'} ${"" + (options.baseUrl ?? "") + (options.path ?? "")}");
    print("Headers:");
    options.headers.forEach((k, v) => print('$k: $v'));
    if (options.queryParameters != null) {
      logger.i("queryParameters:");
      options.queryParameters.forEach((k, v) => logger.i('$k: $v'));
      printWrapped('Row Request\n${jsonEncode(options.queryParameters)}');
    }
    if (options.data != null) {
      logger.i("Body: ${options.data}");
      printWrapped('Body: ${options.data}');
    }
    logger.i(
        "--> END ${options.method != null ? options.method.toUpperCase() : 'METHOD'}");

    return options;
  }

  @override
  Future<FutureOr> onError(DioError dioError) async {
    logger.e(
        "<-- ${dioError.message} ${(dioError.response?.request != null ? (dioError.response.request.baseUrl + dioError.response.request.path) : 'URL')}");
    logger.e(
        "${dioError.response != null ? dioError.response.data : 'Unknown Error'}");
    logger.e("<-- End error");
    return dioError;
  }

  @override
  Future<FutureOr> onResponse(Response response) async {
    logger.i(
        "<-- ${response.statusCode} ${(response.request != null ? (response.request.baseUrl + response.request.path) : 'URL')}");
    print("Headers:");
    response.headers?.forEach((k, v) => print('$k: $v'));
    if (response.data is List<dynamic>) {
      printPrettyJson(response.data);
    }
    print("<-- END HTTP");
  }
}

void printWrapped(String text) {
  final pattern = new RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) {
    JsonEncoder encoder = new JsonEncoder.withIndent('  ');
    String prettyprint = encoder.convert(match.group(0));
    logger.v(prettyprint);
  });
}

String prettyJson(List<dynamic> json, {int indent = 2}) {
  var spaces = ' ' * indent;
  var encoder = JsonEncoder.withIndent(spaces);
  return encoder.convert(json);
}

void printPrettyJson(List<dynamic> json, {int indent = 2}) {
  logger.wtf(prettyJson(json, indent: indent));
}
