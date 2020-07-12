import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:iconapp/data/repositories/auth_repository.dart';
import 'package:iconapp/data/repositories/chat_repository.dart';
import 'package:iconapp/data/repositories/search_repository.dart';
import 'package:iconapp/data/sources/local/shared_preferences.dart';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';
import 'package:iconapp/stores/auth/auth_store.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/stores/login/login_store.dart';
import 'package:iconapp/stores/socket/socket_manager.dart';

final sl = GetIt.I;

void initLocator() {
  // Socket
  sl.registerLazySingleton<SocketStore>(() => SocketStore());

  // Prefs
  sl.registerLazySingleton<SharedPreferencesService>(
      () => SharedPreferencesService());

  // Auth
  sl.registerLazySingleton<AuthStore>(() => AuthStore());
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(restClient: sl(), sp: sl()));

  // Login
  sl.registerLazySingleton<LoginStore>(() => LoginStore());

  // Rest
  sl.registerLazySingleton<Dio>(() => getDioClient());
  sl.registerLazySingleton<RestClient>(() => RestClient(sl()));

  // Search
  sl.registerLazySingleton<SearchRepository>(
      () => SearchRepositoryImpl(restClient: sl()));

  // Home

  // Onboarding

  // Profile

  // Search

  // Settings

  // Chat
  sl.registerLazySingleton<ChatStore>(() => ChatStore());
  sl.registerLazySingleton<ChatRepository>(
      () => ChatRepositoryImpl(restClient: sl()));
}
