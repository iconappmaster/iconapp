import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:iconapp/data/repositories/auth_repository.dart';
import 'package:iconapp/data/repositories/chat_repository.dart';
import 'package:iconapp/data/repositories/group_create_repository.dart';
import 'package:iconapp/data/repositories/login_repository.dart';
import 'package:iconapp/data/repositories/media_repository.dart';
import 'package:iconapp/data/repositories/search_repository.dart';
import 'package:iconapp/data/sources/local/shared_preferences.dart';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';
import 'package:iconapp/stores/auth/auth_store.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/stores/chat_settings/chat_settings_store.dart';
import 'package:iconapp/stores/group_create/group_create_store.dart';
import 'package:iconapp/stores/login/login_store.dart';
import 'package:iconapp/stores/media/media_store.dart';
import 'package:iconapp/stores/oboarding/onboarding_store.dart';
import 'package:iconapp/stores/search/search_store.dart';
import 'package:iconapp/stores/socket/socket_manager.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/repositories/user_repository.dart';
import '../../stores/user/user_store.dart';

final sl = GetIt.I;

void initLocator() {

  // LOGIN
   sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(restClient: sl()));

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
  sl.registerLazySingleton<OnboardingStore>(() => OnboardingStore());
  // Profile

  // Search
  sl.registerLazySingleton<SearchStore>(() => SearchStore());
  sl.registerLazySingleton<SearchRepository>(() => SearchRepositoryImpl());

  // Settings

  // Chat
  sl.registerLazySingleton<ChatStore>(() => ChatStore());
  sl.registerLazySingleton<ChatSettingsStore>(() => ChatSettingsStore());
  sl.registerLazySingleton<ChatRepository>(
      () => ChatRepositoryImpl(restClient: sl()));

  // Group Creation
  sl.registerLazySingleton<GroupCreateStore>(() => GroupCreateStore());
  sl.registerLazySingleton<GroupCreateRepository>(() => GroupCreateRepositoryImpl());

  // User
   sl.registerLazySingleton<UserStore>(() => UserStore());
   sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
     restClient: sl(),
     sp: sl(),
   ));

}
