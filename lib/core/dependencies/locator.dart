import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:iconapp/core/ads/photo_interstitial.dart';
import 'package:iconapp/core/deep_link.dart';
import 'package:iconapp/core/keys.dart';
import 'package:iconapp/core/notifications/fcm.dart';
import 'package:iconapp/core/story_cacher.dart';
import 'package:iconapp/data/repositories/alert_repository.dart';
import 'package:iconapp/data/repositories/comments_repository.dart';
import 'package:iconapp/data/repositories/verify_icon_repository.dart';
import 'package:iconapp/stores/alerts/alert_store.dart';
import 'package:iconapp/stores/comments/comments_store.dart';
import 'package:iconapp/stores/search_results/search_results_store.dart';
import 'package:iconapp/stores/story/story_edit_store.dart';
import 'package:iconapp/stores/verify_icon/verify_icon_store.dart';
import 'package:image_picker/image_picker.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/chat_repository.dart';
import '../../data/repositories/chat_settings_repository.dart';
import '../../data/repositories/create_repository.dart';
import '../../data/repositories/home_repository.dart';
import '../../data/repositories/login_repository.dart';
import '../../data/repositories/media_repository.dart';
import '../../data/repositories/search_repository.dart';
import '../../data/repositories/story_repository.dart';
import '../../data/sources/local/shared_preferences.dart';
import '../../data/sources/remote/rest/rest_client.dart';
import '../../stores/auth/auth_store.dart';
import '../../stores/chat/chat_store.dart';
import '../../stores/chat_settings/chat_settings_store.dart';
import '../../stores/create/create_category_store.dart';
import '../../stores/create/create_details_store.dart';
import '../../stores/create/create_icon_store.dart';
import '../../stores/home/home_store.dart';
import '../../stores/login/login_store.dart';
import '../../stores/media/media_store.dart';
import '../../stores/oboarding/onboarding_store.dart';
import '../../stores/search/search_store.dart';
import '../../data/sources/socket/socket_manager.dart';
import '../../stores/story/story_store.dart';
import '../../data/repositories/user_repository.dart';
import '../../stores/user/user_store.dart';
import '../bus.dart';

final sl = GetIt.I;

void initLocator() {
  // LOGIN
  sl.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(restClient: sl()));

  // Socket
  sl.registerLazySingleton<Socket>(() => Socket());

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
  sl.registerLazySingleton<HomeStore>(() => HomeStore());
  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(restClient: sl(), socket: sl(), cache: sl()));

  // Onboarding
  sl.registerLazySingleton<OnboardingStore>(() => OnboardingStore());

  // Search
  sl.registerLazySingleton<SearchStore>(() => SearchStore());
  sl.registerLazySingleton<SearchRepository>(
    () => SearchRepositoryImpl(restClient: sl()),
  );

  // Chat
  sl.registerLazySingleton<ChatStore>(() => ChatStore());
  sl.registerLazySingleton<ChatSettingsStore>(() => ChatSettingsStore());
  sl.registerLazySingleton<ChatSettingsRepository>(
      () => ChatSettingsRepositoryImpl(restClient: sl()));
  sl.registerLazySingleton<ChatRepository>(() => ChatRepositoryImpl(
        remote: sl(),
        socket: sl(),
        cache: sl(),
      ));

  // Conversation create
  sl.registerLazySingleton<CreateCategoryStore>(() => CreateCategoryStore());
  sl.registerLazySingleton<CreateIconStore>(() => CreateIconStore());
  sl.registerLazySingleton<CreateDetailsStore>(() => CreateDetailsStore());
  sl.registerLazySingleton<CreateRepository>(
      () => GroupCreateRepositoryImpl(sl()));

  // User
  sl.registerLazySingleton<UserStore>(() => UserStore());
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
        restClient: sl(),
        sp: sl(),
      ));

  sl.registerLazySingleton<SearchResultStore>(() => SearchResultStore());

  // Story
  sl.registerLazySingleton<StoryStore>(() => StoryStore());
  sl.registerLazySingleton<StoryEditStore>(() => StoryEditStore());
  sl.registerLazySingleton<StoryRepository>(
    () => StoryRepositoryImpl(rest: sl(), socket: sl()),
  );

  // Bus
  sl.registerLazySingleton<Bus>(() => Bus());

  // Notifications
  sl.registerLazySingleton<Fcm>(() => Fcm());

  // Device
  sl.registerLazySingleton<NavigationService>(() => NavigationService());

  // Comments
  sl.registerLazySingleton<CommentsStore>(() => CommentsStore());
  sl.registerLazySingleton<CommentsRepository>(
    () => CommentsRepositoryImpl(
      client: sl(),
      socket: sl(),
    ),
  );
  // Alerts
  sl.registerLazySingleton<AlertStore>(() => AlertStore());
  sl.registerLazySingleton<AlertRepository>(
      () => AlertRepositoryImpl(rest: sl()));

  // Verify Icon
  sl.registerLazySingleton<VerifyIconStore>(() => VerifyIconStore());
  sl.registerLazySingleton<VerifyIconRepository>(
      () => VerifyIconRepositoryImpl(rest: sl()));

  sl.registerLazySingleton<StoryCacheManager>(() => StoryCacheManager());
  
  sl.registerLazySingleton<DynamicLink>(() => DynamicLink());
  
  sl.registerLazySingleton<InterstitialAdMob>(() => InterstitialAdMob());
}
