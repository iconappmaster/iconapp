import 'package:get_it/get_it.dart';
import 'package:iconapp/stores/auth/auth_store.dart';

final sl = GetIt.I;

void initLocator() {
  // Auth
  sl.registerLazySingleton<AuthStore>(() => AuthStore());

  // Rest Api
    
  // Home

  // Login

  // Onboarding

  // Profile

  // Search

  // Settings

  // Chat
}
