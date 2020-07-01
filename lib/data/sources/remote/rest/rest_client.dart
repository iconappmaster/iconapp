import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'header_interceptor.dart';
import 'logger_interceptor.dart';
part 'rest_client.g.dart';

const String baseUrlProd = 'https://implement.com';
const String baseUrlDev = 'https://implement.com';

@RestApi(baseUrl: baseUrlProd)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
}

Dio getDioClient() {
  final dio = Dio();
  dio.interceptors.addAll([
    HeaderInterceptor(dio),
    LoggingInterceptors(),
  ]);
  return dio;
}
