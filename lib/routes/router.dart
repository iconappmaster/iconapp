import 'package:auto_route/auto_route_annotations.dart';

import 'package:iconapp/screens/camera_screen.dart';
import 'package:iconapp/screens/chat_screen.dart';
import 'package:iconapp/screens/create_group_screen.dart';
import 'package:iconapp/screens/full_image_screen.dart';
import 'package:iconapp/screens/full_video_screen.dart';
import 'package:iconapp/screens/home_screen.dart';
import 'package:iconapp/screens/login_screen.dart';
import 'package:iconapp/screens/onboarding_screen.dart';
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
    MaterialRoute(page: OnboardinScreen),
    MaterialRoute(page: HomeScreen),
    MaterialRoute(page: SettingsScreen),
    MaterialRoute(page: ProfileScreen),
    MaterialRoute(page: SearchScreen),
    MaterialRoute(page: ChatScreen),
    MaterialRoute(page: CreateGroupScreen),
    MaterialRoute(page: StoryScreen),
    MaterialRoute(page: FullVideoScreen),
    MaterialRoute(page: FullImageScreen),
    MaterialRoute(page: CameraScreen),
  ],
)
class $Router {}
