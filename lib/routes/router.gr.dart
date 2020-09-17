// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:iconapp/screens/splash_screen.dart';
import 'package:iconapp/screens/login_screen.dart';
import 'package:iconapp/screens/onboarding_phone.dart';
import 'package:iconapp/screens/onboarding_profile.dart';
import 'package:iconapp/screens/home_screen.dart';
import 'package:iconapp/screens/settings_screen.dart';
import 'package:iconapp/screens/chat_screen.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/screens/chat_settings_screen.dart';
import 'package:iconapp/screens/full_video_screen.dart';
import 'package:iconapp/screens/photo_gallery_screen.dart';
import 'package:iconapp/data/models/photo_model.dart';
import 'package:iconapp/screens/create_icons_screen.dart';
import 'package:iconapp/screens/create_categories_screen.dart';
import 'package:iconapp/screens/rename_conversation.dart';
import 'package:iconapp/screens/create_details_screen.dart';
import 'package:iconapp/screens/search_results_screen.dart';
import 'package:iconapp/screens/story_screen.dart';
import 'package:iconapp/data/models/story_model.dart';
import 'package:iconapp/screens/story_edit_screen.dart';
import 'package:iconapp/screens/descrioption_screen.dart';
import 'package:iconapp/data/models/story_image.dart';
import 'package:iconapp/widgets/chat/message_photo.dart';

class Routes {
  static const String splashScreen = '/';
  static const String loginScreen = '/login-screen';
  static const String onboardingPhone = '/onboarding-phone';
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
  static const all = <String>{
    splashScreen,
    loginScreen,
    onboardingPhone,
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
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashScreen, page: SplashScreen),
    RouteDef(Routes.loginScreen, page: LoginScreen),
    RouteDef(Routes.onboardingPhone, page: OnboardingPhone),
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
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashScreen: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SplashScreen(),
        settings: data,
      );
    },
    LoginScreen: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginScreen(),
        settings: data,
      );
    },
    OnboardingPhone: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => OnboardingPhone(),
        settings: data,
      );
    },
    OnboardingProfile: (RouteData data) {
      var args = data.getArgs<OnboardingProfileArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => OnboardingProfile(key: args.key, mode: args.mode),
        settings: data,
      );
    },
    HomeScreen: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeScreen(),
        settings: data,
      );
    },
    AppSettingsScreen: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AppSettingsScreen(),
        settings: data,
      );
    },
    ChatScreen: (RouteData data) {
      var args = data.getArgs<ChatScreenArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) =>
            ChatScreen(key: args.key, conversation: args.conversation),
        settings: data,
      );
    },
    ChatSettingsScreen: (RouteData data) {
      var args = data.getArgs<ChatSettingsScreenArguments>(
          orElse: () => ChatSettingsScreenArguments());
      return CupertinoPageRoute<dynamic>(
        builder: (context) => ChatSettingsScreen(key: args.key),
        settings: data,
        fullscreenDialog: true,
      );
    },
    VideoScreen: (RouteData data) {
      var args = data.getArgs<VideoScreenArguments>(nullOk: false);
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
    PhotoGalleryScreen: (RouteData data) {
      var args = data.getArgs<PhotoGalleryScreenArguments>(
          orElse: () => PhotoGalleryScreenArguments());
      return MaterialPageRoute<dynamic>(
        builder: (context) => PhotoGalleryScreen(
          key: args.key,
          galleryItems: args.galleryItems,
          intialIndex: args.intialIndex,
        ),
        settings: data,
      );
    },
    SelectIconScreen: (RouteData data) {
      var args = data.getArgs<SelectIconScreenArguments>(nullOk: false);
      return CupertinoPageRoute<dynamic>(
        builder: (context) => SelectIconScreen(key: args.key, mode: args.mode),
        settings: data,
        fullscreenDialog: true,
      );
    },
    CreateCategoryScreen: (RouteData data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => CreateCategoryScreen(),
        settings: data,
      );
    },
    EditConversation: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => EditConversation(),
        settings: data,
      );
    },
    CreateDetailsScreen: (RouteData data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => CreateDetailsScreen(),
        settings: data,
      );
    },
    SearchResultsScreen: (RouteData data) {
      var args = data.getArgs<SearchResultsScreenArguments>(nullOk: false);
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
    StoryScreen: (RouteData data) {
      var args = data.getArgs<StoryScreenArguments>(
          orElse: () => StoryScreenArguments());
      return CupertinoPageRoute<dynamic>(
        builder: (context) =>
            StoryScreen(key: args.key, currentStory: args.currentStory),
        settings: data,
      );
    },
    StoryEditScreen: (RouteData data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => StoryEditScreen(),
        settings: data,
      );
    },
    DescriptionScreen: (RouteData data) {
      var args = data.getArgs<DescriptionScreenArguments>(nullOk: false);
      return CupertinoPageRoute<dynamic>(
        builder: (context) => DescriptionScreen(
          key: args.key,
          url: args.url,
          type: args.type,
        ),
        settings: data,
      );
    },
    SingleImage: (RouteData data) {
      var args = data.getArgs<SingleImageArguments>(nullOk: false);
      return CupertinoPageRoute<dynamic>(
        builder: (context) => SingleImage(key: args.key, url: args.url),
        settings: data,
      );
    },
  };
}

// *************************************************************************
// Navigation helper methods extension
// **************************************************************************

extension RouterNavigationHelperMethods on ExtendedNavigatorState {
  Future<dynamic> pushSplashScreen() => pushNamed<dynamic>(Routes.splashScreen);

  Future<dynamic> pushLoginScreen() => pushNamed<dynamic>(Routes.loginScreen);

  Future<dynamic> pushOnboardingPhone() =>
      pushNamed<dynamic>(Routes.onboardingPhone);

  Future<dynamic> pushOnboardingProfile({
    Key key,
    @required OnboardingMode mode,
  }) =>
      pushNamed<dynamic>(
        Routes.onboardingProfile,
        arguments: OnboardingProfileArguments(key: key, mode: mode),
      );

  Future<dynamic> pushHomeScreen() => pushNamed<dynamic>(Routes.homeScreen);

  Future<dynamic> pushAppSettingsScreen() =>
      pushNamed<dynamic>(Routes.appSettingsScreen);

  Future<dynamic> pushChatScreen({
    Key key,
    @required Conversation conversation,
  }) =>
      pushNamed<dynamic>(
        Routes.chatScreen,
        arguments: ChatScreenArguments(key: key, conversation: conversation),
      );

  Future<dynamic> pushChatSettingsScreen({
    Key key,
  }) =>
      pushNamed<dynamic>(
        Routes.chatSettingsScreen,
        arguments: ChatSettingsScreenArguments(key: key),
      );

  Future<dynamic> pushVideoScreen({
    Key key,
    @required String url,
    bool showToolbar = true,
    bool mute = false,
  }) =>
      pushNamed<dynamic>(
        Routes.videoScreen,
        arguments: VideoScreenArguments(
            key: key, url: url, showToolbar: showToolbar, mute: mute),
      );

  Future<dynamic> pushPhotoGalleryScreen({
    Key key,
    List<PhotoModel> galleryItems,
    int intialIndex,
  }) =>
      pushNamed<dynamic>(
        Routes.photoGalleryScreen,
        arguments: PhotoGalleryScreenArguments(
            key: key, galleryItems: galleryItems, intialIndex: intialIndex),
      );

  Future<dynamic> pushSelectIconScreen({
    Key key,
    @required SelectIconMode mode,
  }) =>
      pushNamed<dynamic>(
        Routes.selectIconScreen,
        arguments: SelectIconScreenArguments(key: key, mode: mode),
      );

  Future<dynamic> pushCreateCategoryScreen() =>
      pushNamed<dynamic>(Routes.createCategoryScreen);

  Future<dynamic> pushEditConversation() =>
      pushNamed<dynamic>(Routes.editConversation);

  Future<dynamic> pushCreateDetailsScreen() =>
      pushNamed<dynamic>(Routes.createDetailsScreen);

  Future<dynamic> pushSearchResultsScreen({
    Key key,
    @required int id,
    @required SearchResulsMode mode,
    @required String name,
  }) =>
      pushNamed<dynamic>(
        Routes.searchResultsScreen,
        arguments: SearchResultsScreenArguments(
            key: key, id: id, mode: mode, name: name),
      );

  Future<dynamic> pushStoryScreen({
    Key key,
    StoryModel currentStory,
  }) =>
      pushNamed<dynamic>(
        Routes.storyScreen,
        arguments: StoryScreenArguments(key: key, currentStory: currentStory),
      );

  Future<dynamic> pushStoryEditScreen() =>
      pushNamed<dynamic>(Routes.storyEditScreen);

  Future<dynamic> pushDescriptionScreen({
    Key key,
    @required String url,
    @required MediaType type,
  }) =>
      pushNamed<dynamic>(
        Routes.descriptionScreen,
        arguments: DescriptionScreenArguments(key: key, url: url, type: type),
      );

  Future<dynamic> pushSingleImage({
    Key key,
    @required String url,
  }) =>
      pushNamed<dynamic>(
        Routes.singleImage,
        arguments: SingleImageArguments(key: key, url: url),
      );
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//OnboardingProfile arguments holder class
class OnboardingProfileArguments {
  final Key key;
  final OnboardingMode mode;
  OnboardingProfileArguments({this.key, @required this.mode});
}

//ChatScreen arguments holder class
class ChatScreenArguments {
  final Key key;
  final Conversation conversation;
  ChatScreenArguments({this.key, @required this.conversation});
}

//ChatSettingsScreen arguments holder class
class ChatSettingsScreenArguments {
  final Key key;
  ChatSettingsScreenArguments({this.key});
}

//VideoScreen arguments holder class
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

//PhotoGalleryScreen arguments holder class
class PhotoGalleryScreenArguments {
  final Key key;
  final List<PhotoModel> galleryItems;
  final int intialIndex;
  PhotoGalleryScreenArguments({this.key, this.galleryItems, this.intialIndex});
}

//SelectIconScreen arguments holder class
class SelectIconScreenArguments {
  final Key key;
  final SelectIconMode mode;
  SelectIconScreenArguments({this.key, @required this.mode});
}

//SearchResultsScreen arguments holder class
class SearchResultsScreenArguments {
  final Key key;
  final int id;
  final SearchResulsMode mode;
  final String name;
  SearchResultsScreenArguments(
      {this.key, @required this.id, @required this.mode, @required this.name});
}

//StoryScreen arguments holder class
class StoryScreenArguments {
  final Key key;
  final StoryModel currentStory;
  StoryScreenArguments({this.key, this.currentStory});
}

//DescriptionScreen arguments holder class
class DescriptionScreenArguments {
  final Key key;
  final String url;
  final MediaType type;
  DescriptionScreenArguments(
      {this.key, @required this.url, @required this.type});
}

//SingleImage arguments holder class
class SingleImageArguments {
  final Key key;
  final String url;
  SingleImageArguments({this.key, @required this.url});
}
