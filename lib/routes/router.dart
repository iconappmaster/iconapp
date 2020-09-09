import 'package:auto_route/auto_route_annotations.dart';

import 'package:iconapp/screens/chat_screen.dart';
import 'package:iconapp/screens/chat_settings_screen.dart';
import 'package:iconapp/screens/create_categories_screen.dart';
import 'package:iconapp/screens/create_details_screen.dart';
import 'package:iconapp/screens/create_icons_screen.dart';
import 'package:iconapp/screens/descrioption_screen.dart';
import 'package:iconapp/screens/full_screen_photo.dart';
import 'package:iconapp/screens/full_video_screen.dart';
import 'package:iconapp/screens/rename_conversation.dart';
import 'package:iconapp/screens/home_screen.dart';
import 'package:iconapp/screens/login_screen.dart';
import 'package:iconapp/screens/onboarding_phone.dart';
import 'package:iconapp/screens/onboarding_profile.dart';
import 'package:iconapp/screens/search_results_screen.dart';
import 'package:iconapp/screens/settings_screen.dart';
import 'package:iconapp/screens/splash_screen.dart';
import 'package:iconapp/screens/story_edit_screen.dart';
import 'package:iconapp/screens/story_screen.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: [
    MaterialRoute(page: SplashScreen, initial: true),
    MaterialRoute(page: LoginScreen),
    MaterialRoute(page: OnboardingPhone),
    MaterialRoute(page: OnboardingProfile),
    MaterialRoute(page: HomeScreen),
    MaterialRoute(page: AppSettingsScreen),
    MaterialRoute(page: ChatScreen),
    CupertinoRoute(page: ChatSettingsScreen, fullscreenDialog: true),
    MaterialRoute(page: VideoScreen),
    MaterialRoute(page: FullPhotoScreen),
    CupertinoRoute(page: SelectIconScreen, fullscreenDialog: true),
    CupertinoRoute(page: CreateCategoryScreen),
    MaterialRoute(page: EditConversation),
    CupertinoRoute(page: CreateDetailsScreen),
    CupertinoRoute(page: SearchResultsScreen),
    CupertinoRoute(page: StoryScreen),
    CupertinoRoute(page: StoryEditScreen),
    CupertinoRoute(page: DescriptionScreen),
  ],
)
class $Router {}