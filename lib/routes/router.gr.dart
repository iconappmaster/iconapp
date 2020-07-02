// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/router_utils.dart';
import 'package:iconapp/screens/login_screen.dart';
import 'package:iconapp/screens/onboarding_screen.dart';
import 'package:iconapp/screens/home_screen.dart';
import 'package:iconapp/screens/settings_screen.dart';
import 'package:iconapp/screens/profile_screen.dart';
import 'package:iconapp/screens/contacts_screen.dart';
import 'package:iconapp/screens/search_screen.dart';
import 'package:iconapp/screens/chat_screen.dart';
import 'package:iconapp/screens/create_group_screen.dart';
import 'package:iconapp/screens/story_screen.dart';
import 'package:iconapp/screens/full_video_screen.dart';
import 'package:iconapp/screens/full_image_screen.dart';

class Router {
  static const loginScreen = '/';
  static const onboardinScreen = '/onboardin-screen';
  static const homeScreen = '/home-screen';
  static const settingsScreen = '/settings-screen';
  static const profileScreen = '/profile-screen';
  static const contactsScreen = '/contacts-screen';
  static const searchScreen = '/search-screen';
  static const chatScreen = '/chat-screen';
  static const createGroupScreen = '/create-group-screen';
  static const storyScreen = '/story-screen';
  static const fullVideoScreen = '/full-video-screen';
  static const fullImageScreen = '/full-image-screen';
  static GlobalKey<NavigatorState> get navigatorKey =>
      getNavigatorKey<Router>();
  static NavigatorState get navigator => navigatorKey.currentState;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Router.loginScreen:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
          settings: settings,
        );
      case Router.onboardinScreen:
        return MaterialPageRoute(
          builder: (_) => OnboardinScreen(),
          settings: settings,
        );
      case Router.homeScreen:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
          settings: settings,
        );
      case Router.settingsScreen:
        return MaterialPageRoute(
          builder: (_) => SettingsScreen(),
          settings: settings,
        );
      case Router.profileScreen:
        return MaterialPageRoute(
          builder: (_) => ProfileScreen(),
          settings: settings,
        );
      case Router.contactsScreen:
        return MaterialPageRoute(
          builder: (_) => ContactsScreen(),
          settings: settings,
        );
      case Router.searchScreen:
        return MaterialPageRoute(
          builder: (_) => SearchScreen(),
          settings: settings,
        );
      case Router.chatScreen:
        return MaterialPageRoute(
          builder: (_) => ChatScreen(),
          settings: settings,
        );
      case Router.createGroupScreen:
        return MaterialPageRoute(
          builder: (_) => CreateGroupScreen(),
          settings: settings,
        );
      case Router.storyScreen:
        return MaterialPageRoute(
          builder: (_) => StoryScreen(),
          settings: settings,
        );
      case Router.fullVideoScreen:
        return MaterialPageRoute(
          builder: (_) => FullVideoScreen(),
          settings: settings,
        );
      case Router.fullImageScreen:
        return MaterialPageRoute(
          builder: (_) => FullImageScreen(),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}
