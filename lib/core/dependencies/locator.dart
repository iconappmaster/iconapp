import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:iconapp/data/repositories/auth_repository.dart';
import 'package:iconapp/data/repositories/chat_repository.dart';
import 'package:iconapp/data/repositories/media_repository.dart';
import 'package:iconapp/data/repositories/search_repository.dart';
import 'package:iconapp/data/sources/local/shared_preferences.dart';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';
import 'package:iconapp/stores/auth/auth_store.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/stores/login/login_store.dart';
import 'package:iconapp/stores/media/media_store.dart';
import 'package:iconapp/stores/search/search_store.dart';
import 'package:iconapp/stores/socket/socket_manager.dart';
import 'package:image_picker/image_picker.dart';

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

  // Media
  sl.registerLazySingleton<MediaStore>(() => MediaStore());
  sl.registerLazySingleton<MediaRepository>(() => MediaRepositoryImpl());
  sl.registerLazySingleton<ImagePicker>(() => ImagePicker());
  // Home

  // Onboarding

  // Profile

  // Search
  sl.registerLazySingleton<SearchStore>(() => SearchStore());
  sl.registerLazySingleton<SearchRepository>(() => SearchRepositoryImpl());

  // Settings

  // Chat
  sl.registerLazySingleton<ChatStore>(() => ChatStore());
  sl.registerLazySingleton<ChatRepository>(
      () => ChatRepositoryImpl(restClient: sl()));
}
