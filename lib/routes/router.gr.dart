// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:iconapp/screens/splash_screen.dart';
import 'package:iconapp/screens/login_screen.dart';
import 'package:iconapp/screens/onboarding_screen.dart';
import 'package:iconapp/screens/home_screen.dart';
import 'package:iconapp/screens/settings_screen.dart';
import 'package:iconapp/screens/profile_screen.dart';
import 'package:iconapp/screens/search_screen.dart';
import 'package:iconapp/screens/chat_screen.dart';
import 'package:iconapp/screens/create_group_screen.dart';
import 'package:iconapp/screens/story_screen.dart';
import 'package:iconapp/screens/full_video_screen.dart';
import 'package:iconapp/screens/full_image_screen.dart';
import 'package:iconapp/data/models/photo_model.dart';
import 'package:iconapp/screens/camera_screen.dart';

class Routes {
  static const String splashScreen = '/';
  static const String loginScreen = '/login-screen';
  static const String onboardinScreen = '/onboardin-screen';
  static const String homeScreen = '/home-screen';
  static const String settingsScreen = '/settings-screen';
  static const String profileScreen = '/profile-screen';
  static const String searchScreen = '/search-screen';
  static const String chatScreen = '/chat-screen';
  static const String createGroupScreen = '/create-group-screen';
  static const String storyScreen = '/story-screen';
  static const String fullVideoScreen = '/full-video-screen';
  static const String fullImageScreen = '/full-image-screen';
  static const String cameraScreen = '/camera-screen';
  static const all = <String>{
    splashScreen,
    loginScreen,
    onboardinScreen,
    homeScreen,
    settingsScreen,
    profileScreen,
    searchScreen,
    chatScreen,
    createGroupScreen,
    storyScreen,
    fullVideoScreen,
    fullImageScreen,
    cameraScreen,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashScreen, page: SplashScreen),
    RouteDef(Routes.loginScreen, page: LoginScreen),
    RouteDef(Routes.onboardinScreen, page: OnboardinScreen),
    RouteDef(Routes.homeScreen, page: HomeScreen),
    RouteDef(Routes.settingsScreen, page: SettingsScreen),
    RouteDef(Routes.profileScreen, page: ProfileScreen),
    RouteDef(Routes.searchScreen, page: SearchScreen),
    RouteDef(Routes.chatScreen, page: ChatScreen),
    RouteDef(Routes.createGroupScreen, page: CreateGroupScreen),
    RouteDef(Routes.storyScreen, page: StoryScreen),
    RouteDef(Routes.fullVideoScreen, page: FullVideoScreen),
    RouteDef(Routes.fullImageScreen, page: FullImageScreen),
    RouteDef(Routes.cameraScreen, page: CameraScreen),
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
    OnboardinScreen: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => OnboardinScreen(),
        settings: data,
      );
    },
    HomeScreen: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeScreen(),
        settings: data,
      );
    },
    SettingsScreen: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SettingsScreen(),
        settings: data,
      );
    },
    ProfileScreen: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProfileScreen(),
        settings: data,
      );
    },
    SearchScreen: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SearchScreen(),
        settings: data,
      );
    },
    ChatScreen: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ChatScreen(),
        settings: data,
      );
    },
    CreateGroupScreen: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => CreateGroupScreen(),
        settings: data,
      );
    },
    StoryScreen: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => StoryScreen(),
        settings: data,
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
    CameraScreen: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => CameraScreen(),
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

  Future<dynamic> pushOnboardinScreen() =>
      pushNamed<dynamic>(Routes.onboardinScreen);

  Future<dynamic> pushHomeScreen() => pushNamed<dynamic>(Routes.homeScreen);

  Future<dynamic> pushSettingsScreen() =>
      pushNamed<dynamic>(Routes.settingsScreen);

  Future<dynamic> pushProfileScreen() =>
      pushNamed<dynamic>(Routes.profileScreen);

  Future<dynamic> pushSearchScreen() => pushNamed<dynamic>(Routes.searchScreen);

  Future<dynamic> pushChatScreen() => pushNamed<dynamic>(Routes.chatScreen);

  Future<dynamic> pushCreateGroupScreen() =>
      pushNamed<dynamic>(Routes.createGroupScreen);

  Future<dynamic> pushStoryScreen() => pushNamed<dynamic>(Routes.storyScreen);

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

  Future<dynamic> pushCameraScreen() => pushNamed<dynamic>(Routes.cameraScreen);
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//FullImageScreen arguments holder class
class FullImageScreenArguments {
  final Key key;
  final PhotoModel photo;
  FullImageScreenArguments({this.key, this.photo});
}
