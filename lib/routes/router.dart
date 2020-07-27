import 'package:auto_route/auto_route_annotations.dart';

import 'package:iconapp/screens/camera_screen.dart';
import 'package:iconapp/screens/chat_screen.dart';
import 'package:iconapp/screens/chat_settings_screen.dart';
import 'package:iconapp/screens/create_group.dart';
import 'package:iconapp/screens/full_image_screen.dart';
import 'package:iconapp/screens/full_video_screen.dart';
import 'package:iconapp/screens/home_screen.dart';
import 'package:iconapp/screens/login_screen.dart';
import 'package:iconapp/screens/onboarding_phone.dart';
import 'package:iconapp/screens/onboarding_profile.dart';
import 'package:iconapp/screens/profile_screen.dart';
import 'package:iconapp/screens/search_screen.dart';
import 'package:iconapp/screens/settings_screen.dart';
import 'package:iconapp/screens/splash_screen.dart';
import 'package:iconapp/screens/story_screen.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: [
    MaterialRoute(page: SplashScreen, initial: true),
    MaterialRoute(page: LoginScreen),
    MaterialRoute(page: OnboardingPhone),
    MaterialRoute(page: OnboardingProfile),
    MaterialRoute(page: HomeScreen),
    MaterialRoute(page: SettingsScreen),
    MaterialRoute(page: ProfileScreen),
    MaterialRoute(page: SearchScreen),
    MaterialRoute(page: ChatScreen),
    CupertinoRoute(page: ChatSettings,fullscreenDialog: true),
    MaterialRoute(page: StoryScreen),
    MaterialRoute(page: FullVideoScreen),
    MaterialRoute(page: FullImageScreen),
    MaterialRoute(page: CameraScreen),
    CupertinoRoute(page: SelectContactsScreen, fullscreenDialog: true),
    CupertinoRoute(page: SelectCategoryScreen),
    CupertinoRoute(page: GroupNamePhoto),
  ],
)
class $Router {}
