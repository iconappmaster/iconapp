// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/models/conversation_model.dart';
import '../data/models/photo_model.dart';
import '../data/models/story_image.dart';
import '../data/models/story_model.dart';
import '../screens/alerts_screen.dart';
import '../screens/chat_screen.dart';
import '../screens/chat_settings_screen.dart';
import '../screens/create_categories_screen.dart';
import '../screens/create_details_screen.dart';
import '../screens/create_icons_screen.dart';
import '../screens/descrioption_screen.dart';
import '../screens/full_video_screen.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/main_navigator.dart';
import '../screens/onboarding_phone.dart';
import '../screens/onboarding_profile.dart';
import '../screens/photo_gallery_screen.dart';
import '../screens/rename_conversation.dart';
import '../screens/search_results_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/story_edit_screen.dart';
import '../screens/story_screen.dart';
import '../widgets/chat/message_photo.dart';

class Routes {
  static const String mainNavigator = '/';
  static const String loginScreen = '/login-screen';
  static const String onboardingScreen = '/onboarding-screen';
  static const String onboardingProfile = '/onboarding-profile';
  static const String homeScreen = '/home-screen';
  static const String appSettingsScreen = '/app-settings-screen';
  static const String chatScreen = '/chat-screen';
  static const String chatSettingsScreen = '/chat-settings-screen';
  static const String videoScreen = '/video-screen';
  static const String photoGalleryScreen = '/photo-gallery-screen';
  static const String selectIconScreen = '/select-icon-screen';
  static const String createCategoryScreen = '/create-category-screen';
  static const String editConversation = '/edit-conversation';
  static const String createDetailsScreen = '/create-details-screen';
  static const String searchResultsScreen = '/search-results-screen';
  static const String storyScreen = '/story-screen';
  static const String storyEditScreen = '/story-edit-screen';
  static const String descriptionScreen = '/description-screen';
  static const String singleImage = '/single-image';
  static const String alertScreen = '/alert-screen';
  static const all = <String>{
    mainNavigator,
    loginScreen,
    onboardingScreen,
    onboardingProfile,
    homeScreen,
    appSettingsScreen,
    chatScreen,
    chatSettingsScreen,
    videoScreen,
    photoGalleryScreen,
    selectIconScreen,
    createCategoryScreen,
    editConversation,
    createDetailsScreen,
    searchResultsScreen,
    storyScreen,
    storyEditScreen,
    descriptionScreen,
    singleImage,
    alertScreen,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.mainNavigator, page: MainNavigator),
    RouteDef(Routes.loginScreen, page: LoginScreen),
    RouteDef(Routes.onboardingScreen, page: OnboardingScreen),
    RouteDef(Routes.onboardingProfile, page: OnboardingProfile),
    RouteDef(Routes.homeScreen, page: HomeScreen),
    RouteDef(Routes.appSettingsScreen, page: AppSettingsScreen),
    RouteDef(Routes.chatScreen, page: ChatScreen),
    RouteDef(Routes.chatSettingsScreen, page: ChatSettingsScreen),
    RouteDef(Routes.videoScreen, page: VideoScreen),
    RouteDef(Routes.photoGalleryScreen, page: PhotoGalleryScreen),
    RouteDef(Routes.selectIconScreen, page: SelectIconScreen),
    RouteDef(Routes.createCategoryScreen, page: CreateCategoryScreen),
    RouteDef(Routes.editConversation, page: EditConversation),
    RouteDef(Routes.createDetailsScreen, page: CreateDetailsScreen),
    RouteDef(Routes.searchResultsScreen, page: SearchResultsScreen),
    RouteDef(Routes.storyScreen, page: StoryScreen),
    RouteDef(Routes.storyEditScreen, page: StoryEditScreen),
    RouteDef(Routes.descriptionScreen, page: DescriptionScreen),
    RouteDef(Routes.singleImage, page: SingleImage),
    RouteDef(Routes.alertScreen, page: AlertScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    MainNavigator: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => MainNavigator(),
        settings: data,
      );
    },
    LoginScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginScreen(),
        settings: data,
      );
    },
    OnboardingScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => OnboardingScreen(),
        settings: data,
      );
    },
    OnboardingProfile: (data) {
      final args = data.getArgs<OnboardingProfileArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => OnboardingProfile(
          key: args.key,
          mode: args.mode,
        ),
        settings: data,
      );
    },
    HomeScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeScreen(),
        settings: data,
      );
    },
    AppSettingsScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AppSettingsScreen(),
        settings: data,
      );
    },
    ChatScreen: (data) {
      final args = data.getArgs<ChatScreenArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => ChatScreen(
          key: args.key,
          conversation: args.conversation,
        ),
        settings: data,
      );
    },
    ChatSettingsScreen: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const ChatSettingsScreen(),
        settings: data,
        fullscreenDialog: true,
      );
    },
    VideoScreen: (data) {
      final args = data.getArgs<VideoScreenArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => VideoScreen(
          key: args.key,
          url: args.url,
          showToolbar: args.showToolbar,
          mute: args.mute,
        ),
        settings: data,
      );
    },
    PhotoGalleryScreen: (data) {
      final args = data.getArgs<PhotoGalleryScreenArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => PhotoGalleryScreen(
          key: args.key,
          galleryItems: args.galleryItems,
          intialIndex: args.intialIndex,
        ),
        settings: data,
      );
    },
    SelectIconScreen: (data) {
      final args = data.getArgs<SelectIconScreenArguments>(nullOk: false);
      return CupertinoPageRoute<dynamic>(
        builder: (context) => SelectIconScreen(
          key: args.key,
          mode: args.mode,
        ),
        settings: data,
        fullscreenDialog: true,
      );
    },
    CreateCategoryScreen: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => CreateCategoryScreen(),
        settings: data,
      );
    },
    EditConversation: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => EditConversation(),
        settings: data,
      );
    },
    CreateDetailsScreen: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => CreateDetailsScreen(),
        settings: data,
      );
    },
    SearchResultsScreen: (data) {
      final args = data.getArgs<SearchResultsScreenArguments>(nullOk: false);
      return CupertinoPageRoute<dynamic>(
        builder: (context) => SearchResultsScreen(
          key: args.key,
          id: args.id,
          mode: args.mode,
          name: args.name,
        ),
        settings: data,
      );
    },
    StoryScreen: (data) {
      final args = data.getArgs<StoryScreenArguments>(
        orElse: () => StoryScreenArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => StoryScreen(
          key: args.key,
          currentStory: args.currentStory,
        ),
        settings: data,
      );
    },
    StoryEditScreen: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => StoryEditScreen(),
        settings: data,
      );
    },
    DescriptionScreen: (data) {
      final args = data.getArgs<DescriptionScreenArguments>(nullOk: false);
      return CupertinoPageRoute<dynamic>(
        builder: (context) => DescriptionScreen(
          key: args.key,
          url: args.url,
          type: args.type,
        ),
        settings: data,
      );
    },
    SingleImage: (data) {
      final args = data.getArgs<SingleImageArguments>(nullOk: false);
      return CupertinoPageRoute<dynamic>(
        builder: (context) => SingleImage(
          key: args.key,
          url: args.url,
        ),
        settings: data,
      );
    },
    AlertScreen: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => AlertScreen(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension RouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushMainNavigator() => push<dynamic>(Routes.mainNavigator);

  Future<dynamic> pushLoginScreen() => push<dynamic>(Routes.loginScreen);

  Future<dynamic> pushOnboardingScreen() =>
      push<dynamic>(Routes.onboardingScreen);

  Future<dynamic> pushOnboardingProfile({
    Key key,
    @required OnboardingMode mode,
  }) =>
      push<dynamic>(
        Routes.onboardingProfile,
        arguments: OnboardingProfileArguments(key: key, mode: mode),
      );

  Future<dynamic> pushHomeScreen() => push<dynamic>(Routes.homeScreen);

  Future<dynamic> pushAppSettingsScreen() =>
      push<dynamic>(Routes.appSettingsScreen);

  Future<dynamic> pushChatScreen({
    Key key,
    @required Conversation conversation,
  }) =>
      push<dynamic>(
        Routes.chatScreen,
        arguments: ChatScreenArguments(key: key, conversation: conversation),
      );

  Future<dynamic> pushChatSettingsScreen() =>
      push<dynamic>(Routes.chatSettingsScreen);

  Future<dynamic> pushVideoScreen({
    Key key,
    @required String url,
    bool showToolbar = true,
    bool mute = false,
  }) =>
      push<dynamic>(
        Routes.videoScreen,
        arguments: VideoScreenArguments(
            key: key, url: url, showToolbar: showToolbar, mute: mute),
      );

  Future<dynamic> pushPhotoGalleryScreen({
    Key key,
    @required List<PhotoModel> galleryItems,
    @required int intialIndex,
  }) =>
      push<dynamic>(
        Routes.photoGalleryScreen,
        arguments: PhotoGalleryScreenArguments(
            key: key, galleryItems: galleryItems, intialIndex: intialIndex),
      );

  Future<dynamic> pushSelectIconScreen({
    Key key,
    @required SelectIconMode mode,
  }) =>
      push<dynamic>(
        Routes.selectIconScreen,
        arguments: SelectIconScreenArguments(key: key, mode: mode),
      );

  Future<dynamic> pushCreateCategoryScreen() =>
      push<dynamic>(Routes.createCategoryScreen);

  Future<dynamic> pushEditConversation() =>
      push<dynamic>(Routes.editConversation);

  Future<dynamic> pushCreateDetailsScreen() =>
      push<dynamic>(Routes.createDetailsScreen);

  Future<dynamic> pushSearchResultsScreen({
    Key key,
    @required int id,
    @required SearchResulsMode mode,
    @required String name,
  }) =>
      push<dynamic>(
        Routes.searchResultsScreen,
        arguments: SearchResultsScreenArguments(
            key: key, id: id, mode: mode, name: name),
      );

  Future<dynamic> pushStoryScreen({
    Key key,
    StoryModel currentStory,
  }) =>
      push<dynamic>(
        Routes.storyScreen,
        arguments: StoryScreenArguments(key: key, currentStory: currentStory),
      );

  Future<dynamic> pushStoryEditScreen() =>
      push<dynamic>(Routes.storyEditScreen);

  Future<dynamic> pushDescriptionScreen({
    Key key,
    @required String url,
    @required MediaType type,
  }) =>
      push<dynamic>(
        Routes.descriptionScreen,
        arguments: DescriptionScreenArguments(key: key, url: url, type: type),
      );

  Future<dynamic> pushSingleImage({
    Key key,
    @required String url,
  }) =>
      push<dynamic>(
        Routes.singleImage,
        arguments: SingleImageArguments(key: key, url: url),
      );

  Future<dynamic> pushAlertScreen() => push<dynamic>(Routes.alertScreen);
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// OnboardingProfile arguments holder class
class OnboardingProfileArguments {
  final Key key;
  final OnboardingMode mode;
  OnboardingProfileArguments({this.key, @required this.mode});
}

/// ChatScreen arguments holder class
class ChatScreenArguments {
  final Key key;
  final Conversation conversation;
  ChatScreenArguments({this.key, @required this.conversation});
}

/// VideoScreen arguments holder class
class VideoScreenArguments {
  final Key key;
  final String url;
  final bool showToolbar;
  final bool mute;
  VideoScreenArguments(
      {this.key,
      @required this.url,
      this.showToolbar = true,
      this.mute = false});
}

/// PhotoGalleryScreen arguments holder class
class PhotoGalleryScreenArguments {
  final Key key;
  final List<PhotoModel> galleryItems;
  final int intialIndex;
  PhotoGalleryScreenArguments(
      {this.key, @required this.galleryItems, @required this.intialIndex});
}

/// SelectIconScreen arguments holder class
class SelectIconScreenArguments {
  final Key key;
  final SelectIconMode mode;
  SelectIconScreenArguments({this.key, @required this.mode});
}

/// SearchResultsScreen arguments holder class
class SearchResultsScreenArguments {
  final Key key;
  final int id;
  final SearchResulsMode mode;
  final String name;
  SearchResultsScreenArguments(
      {this.key, @required this.id, @required this.mode, @required this.name});
}

/// StoryScreen arguments holder class
class StoryScreenArguments {
  final Key key;
  final StoryModel currentStory;
  StoryScreenArguments({this.key, this.currentStory});
}

/// DescriptionScreen arguments holder class
class DescriptionScreenArguments {
  final Key key;
  final String url;
  final MediaType type;
  DescriptionScreenArguments(
      {this.key, @required this.url, @required this.type});
}

/// SingleImage arguments holder class
class SingleImageArguments {
  final Key key;
  final String url;
  SingleImageArguments({this.key, @required this.url});
}
