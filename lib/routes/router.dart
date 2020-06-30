import 'package:auto_route/auto_route_annotations.dart';
import 'package:iconapp/screens/chat_screen.dart';
import 'package:iconapp/screens/contacts_screen.dart';
import 'package:iconapp/screens/create_group_screen.dart';
import 'package:iconapp/screens/home_screen.dart';
import 'package:iconapp/screens/login_screen.dart';
import 'package:iconapp/screens/onboarding_screen.dart';
import 'package:iconapp/screens/profile_screen.dart';
import 'package:iconapp/screens/search_screen.dart';
import 'package:iconapp/screens/settings_screen.dart';

@autoRouter
class $Router {
  @initial
  LoginScreen loginScreen;
  OnboardinScreen onboardinScreen;
  HomeScreen homeScreen;
  SettingsScreen settingsScreen;
  ProfileScreen profileScreen;
  ContactsScreen contactsScreen;
  SearchScreen searchScreen;
  ChatScreen chatScreen;
  CreateGroupScreen createGroupScreen;
}