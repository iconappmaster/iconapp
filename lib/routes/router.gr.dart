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
import 'package:iconapp/screens/full_image_screen.dart';
import 'package:iconapp/data/models/photo_model.dart';
import 'package:iconapp/screens/create_icons_screen.dart';
import 'package:iconapp/screens/create_categories_screen.dart';
import 'package:iconapp/screens/rename_conversation.dart';
import 'package:iconapp/screens/create_details_screen.dart';
import 'package:iconapp/screens/search_results_screen.dart';

class Routes {
  static const String splashScreen = '/';
  static const String loginScreen = '/login-screen';
  static const String onboardingPhone = '/onboarding-phone';
  static const String onboardingProfile = '/onboarding-profile';
  static const String homeScreen = '/home-screen';
  static const String appSettingsScreen = '/app-settings-screen';
  static const String chatScreen = '/chat-screen';
  static const String chatSettingsScreen = '/chat-settings-screen';
  static const String fullVideoScreen = '/full-video-screen';
  static const String fullImageScreen = '/full-image-screen';
  static const String selectIconScreen = '/select-icon-screen';
  static const String createCategoryScreen = '/create-category-screen';
  static const String editConversation = '/edit-conversation';
  static const String createDetailsScreen = '/create-details-screen';
  static const String searchResultsScreen = '/search-results-screen';
  static const all = <String>{
    splashScreen,
    loginScreen,
    onboardingPhone,
    onboardingProfile,
    homeScreen,
    appSettingsScreen,
    chatScreen,
    chatSettingsScreen,
    fullVideoScreen,
    fullImageScreen,
    selectIconScreen,
    createCategoryScreen,
    editConversation,
    createDetailsScreen,
    searchResultsScreen,
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
    RouteDef(Routes.fullVideoScreen, page: FullVideoScreen),
    RouteDef(Routes.fullImageScreen, page: FullImageScreen),
    RouteDef(Routes.selectIconScreen, page: SelectIconScreen),
    RouteDef(Routes.createCategoryScreen, page: CreateCategoryScreen),
    RouteDef(Routes.editConversation, page: EditConversation),
    RouteDef(Routes.createDetailsScreen, page: CreateDetailsScreen),
    RouteDef(Routes.searchResultsScreen, page: SearchResultsScreen),
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
    FullVideoScreen: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => FullVideoScreen(),
        settings: data,
      );
    },
    FullImageScreen: (RouteData data) {
      var args = data.getArgs<FullImageScreenArguments>(
          orElse: () => FullImageScreenArguments());
      return MaterialPageRoute<dynamic>(
        builder: (context) => FullImageScreen(key: args.key, photo: args.photo),
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

  Future<dynamic> pushFullVideoScreen() =>
      pushNamed<dynamic>(Routes.fullVideoScreen);

  Future<dynamic> pushFullImageScreen({
    Key key,
    PhotoModel photo,
  }) =>
      pushNamed<dynamic>(
        Routes.fullImageScreen,
        arguments: FullImageScreenArguments(key: key, photo: photo),
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

//FullImageScreen arguments holder class
class FullImageScreenArguments {
  final Key key;
  final PhotoModel photo;
  FullImageScreenArguments({this.key, this.photo});
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
