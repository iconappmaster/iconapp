import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:iconapp/data/repositories/auth_repository.dart';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';
import 'package:iconapp/stores/auth/auth_store.dart';
import 'package:iconapp/stores/login/login_store.dart';

final sl = GetIt.I;

void initLocator() {
  // Auth
  sl.registerLazySingleton<AuthStore>(() => AuthStore());
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());

  // Login
  sl.registerLazySingleton<LoginStore>(() => LoginStore());

  // Rest Api
  // Rest
  sl.registerLazySingleton<Dio>(() => getDioClient());
  sl.registerLazySingleton<RestClient>(() => RestClient(sl()));

  // Home

  // Onboarding

  // Profile

  // Search

  // Settings

  // Chat
}
