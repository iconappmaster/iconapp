import 'package:auto_route/auto_route_annotations.dart';
import 'package:iconapp/core/ads/provider_ads/custom_ad.dart';
import 'package:iconapp/core/video/default_player/default_player.dart';
import 'package:iconapp/core/video/feed_player/feed_player.dart';
import 'package:iconapp/screens/alerts_screen.dart';
import 'package:iconapp/screens/archive_screen.dart';
import 'package:iconapp/screens/chat_screen.dart';
import 'package:iconapp/screens/chat_settings_screen.dart';
import 'package:iconapp/screens/create_categories_screen.dart';
import 'package:iconapp/screens/create_details_screen.dart';
import 'package:iconapp/screens/create_icons_screen.dart';
import 'package:iconapp/screens/media_descrioption_screen.dart';
import 'package:iconapp/screens/photo_gallery_screen.dart';
import 'package:iconapp/screens/full_video_screen.dart';
import 'package:iconapp/screens/rename_conversation.dart';
import 'package:iconapp/screens/home_screen.dart';
import 'package:iconapp/screens/login_screen.dart';
import 'package:iconapp/screens/onboarding_phone.dart';
import 'package:iconapp/screens/onboarding_profile.dart';
import 'package:iconapp/screens/search_results_screen.dart';
import 'package:iconapp/screens/settings_screen.dart';
import 'package:iconapp/screens/main_navigator.dart';
import 'package:iconapp/screens/story_duration_picker.dart';
import 'package:iconapp/screens/story_edit_screen.dart';
import 'package:iconapp/screens/story_screen.dart';
import 'package:iconapp/screens/verify_icon_email_screen.dart';
import 'package:iconapp/screens/verify_instagram.dart';
import 'package:iconapp/screens/verify_send_code_screen.dart';
import 'package:iconapp/screens/verify_welcome_screen.dart';
import 'package:iconapp/screens/video_gallery_screen.dart';
import 'package:iconapp/widgets/global/single_image.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: [
    MaterialRoute(page: MainNavigator, initial: true),
    MaterialRoute(page: LoginScreen),
    MaterialRoute(page: OnboardingScreen),
    MaterialRoute(page: OnboardingProfile),
    MaterialRoute(page: HomeScreen),
    MaterialRoute(page: SettingsScreen),
    MaterialRoute(page: ChatScreen),
    CupertinoRoute(page: ChatSettingsScreen, fullscreenDialog: true),
    MaterialRoute(page: PhotoGalleryScreen),
    MaterialRoute(page: VideoScreen), // should get rid of that
    MaterialRoute(page: VideoGalleryScreen), // should get rid of that
    MaterialRoute(page: DefaultVideoPlayer),
    MaterialRoute(page: FeedPlayer),
    CupertinoRoute(page: SelectIconScreen, fullscreenDialog: true),
    CupertinoRoute(page: CreateCategoryScreen),
    MaterialRoute(page: EditConversation),
    CupertinoRoute(page: CreateDetailsScreen),
    CupertinoRoute(page: SearchResultsScreen),
    CupertinoRoute(page: StoryScreen),
    CupertinoRoute(page: StoryEditScreen),
    CupertinoRoute(page: MediaDescriptionScreen),
    MaterialRoute(page: SingleImage),
    CupertinoRoute(page: AlertScreen),
    CupertinoRoute(page: StoryDurationPicker, fullscreenDialog: true),
    CupertinoRoute(page: VerifyWelcomeScreen),
    CupertinoRoute(page: VerifySendCodeScreen),
    CupertinoRoute(page: VerifyIconEmailScreen),
    CupertinoRoute(page: VerifyInstagramScreen),
    CupertinoRoute(page: ArchiveScreen),
    MaterialRoute(page: CustomAd),
  ],
)
class $Router {
  static String routerName = "route";
}
