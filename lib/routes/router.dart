import 'package:auto_route/auto_route_annotations.dart';
import 'package:iconapp/screens/lock_screen.dart';
import 'package:iconapp/screens/redemption_screen.dart';
import '../core/ads/provider_ads/custom_ad.dart';
import '../core/video/default_player/default_player.dart';
import '../core/video/feed_player/feed_player.dart';
import '../screens/alerts_screen.dart';
import '../screens/archive_screen.dart';
import '../screens/chat_screen.dart';
import '../screens/chat_settings_screen.dart';
import '../screens/create_categories_screen.dart';
import '../screens/create_details_screen.dart';
import '../screens/create_icons_screen.dart';
import '../screens/media_descrioption_screen.dart';
import '../screens/photo_gallery_screen.dart';
import '../screens/full_video_screen.dart';
import '../screens/rename_conversation.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/onboarding_phone.dart';
import '../screens/onboarding_profile.dart';
import '../screens/search_results_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/main_navigator.dart';
import '../screens/story_duration_picker.dart';
import '../screens/story_edit_screen.dart';
import '../screens/story_screen.dart';
import '../screens/verify_icon_email_screen.dart';
import '../screens/verify_instagram.dart';
import '../screens/verify_send_code_screen.dart';
import '../screens/verify_welcome_screen.dart';
import '../screens/video_gallery_screen.dart';
import '../widgets/global/single_image.dart';

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
    CupertinoRoute(page: CustomAd),
    CupertinoRoute(page: LockScreen),
    CupertinoRoute(page: RedemptionScreen, fullscreenDialog: true),
  ],
)
class $Router {
  static String routerName = "route";
}
