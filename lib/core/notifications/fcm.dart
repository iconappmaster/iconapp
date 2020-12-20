import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/data/sources/local/shared_preferences.dart';
import 'package:iconapp/routes/router.dart';
import 'package:iconapp/stores/auth/auth_store.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/stores/home/home_store.dart';
import 'package:iconapp/stores/user/user_store.dart';
import 'package:iconapp/routes/router.gr.dart';

import 'notifications.dart';

final firebasePlugin = FlutterLocalNotificationsPlugin();
const channelName = 'fcm_default_channel';

final messaging = FirebaseMessaging();

class Fcm {
  StreamSubscription<String> tokenRefreshSubscription;

  void setFirebase() async {
    final sp = sl<SharedPreferencesService>();
    final auth = sl<AuthStore>();
    final user = sl<UserStore>();

    final android = AndroidInitializationSettings('app_icon');
    final ios = IOSInitializationSettings();
    final init = InitializationSettings(
      android: android,
      iOS: ios,
    );

    firebasePlugin.initialize(init, onSelectNotification: onSelectNotification);

    await messaging.requestNotificationPermissions();

    messaging.configure(
      onLaunch: _onLaunch,
      onResume: onResume,
      onBackgroundMessage: Platform.isIOS ? null : backgroundHandler,
      onMessage: (message) async => _showNotification(
        message: message,
        isConversationOpen: true,
      ),
    );

    _handleFCMToken(auth, user, sp);
  }

  Future onResume(message) async {
    if (message != null) {
      final id = int.tryParse(message["data"]["conversationId"]);
      await _handleOnNotificationTap(id);
    }
    return Future.value();
  }

  void _handleFCMToken(
      AuthStore auth, UserStore user, SharedPreferencesService sp) {
    messaging.getToken().then((token) => _updateToken(auth, user, token, sp));
    tokenRefreshSubscription = messaging.onTokenRefresh
        .listen((token) => _updateToken(auth, user, token, sp));
  }

  void _updateToken(AuthStore auth, UserStore user, String token,
      SharedPreferencesService sp) {
    if (auth.isSignedIn) user.updatePushToken((token));
    sp.setString(StorageKey.fcmToken, token);
  }

  Future _onLaunch(Map<String, dynamic> message) async {
    if (message != null) {
      final id = int.tryParse(message["data"]["conversationId"]);
      await _handleOnNotificationTap(id);
    }
    return Future.value();
  }

  Future _handleOnNotificationTap(int id) async {
    cancelAll();
    final sp = sl<SharedPreferencesService>();
    if (id != null) {
      if (sp.getBool(StorageKey.appForeground) ?? false) {
        final home = sl<HomeStore>();
        final conversation = await home.getCachedConversationById(id);
        if (conversation != null) {
          await _saveConversation(conversation, sp);

          ExtendedNavigator.named($Router.routerName)
              .pushChatScreen(conversation: conversation);
        }
      } else {
        final home = sl<HomeStore>();
        final sp = sl<SharedPreferencesService>();
        final conversation = await home.getCachedConversationById(id);
        if (conversation != null) {
          await _saveConversation(conversation, sp);
        }
      }
    }
  }

  Future _saveConversation(
      Conversation conversation, SharedPreferencesService sp) async {
    final json = jsonEncode(conversation.toJson());
    await sp.setString(StorageKey.fcmConversation, json);
  }

  Future<String> onSelectNotification(String conversationId) async {
    if (conversationId != null) {
      final id = int.tryParse(conversationId);
      _handleOnNotificationTap(id);
    }
    return 'NO SELECTION';
  }

  Future<void> cancelNotification(int id) async {
    await firebasePlugin.cancel(id);
  }

  static Future<dynamic> backgroundHandler(Map<String, dynamic> message) async {
    _showNotification(message: message, isConversationOpen: false);
    return Future<void>.value();
  }

  void dispose() {
    tokenRefreshSubscription?.cancel();
  }
}

void _showNotification({
  @required Map<String, dynamic> message,
  @required bool isConversationOpen,
}) {
  final fcmConversationId = message['data']['conversationId'] as String;

  if (fcmConversationId == null) {
    final title = message['notification']['title'];
    final body = message['notification']['body'];
    showTextNotification(channelName, channelName, "0", title, body, body);
  } else {
    // handle data payload
    var currentOpenConversationId = 0;

    if (isConversationOpen) {
      // if notification comes from foreground then get the conversationId.
      // That's for not showing notfication to a specific chat when it's open.
      currentOpenConversationId = sl<ChatStore>().conversation?.id ?? 0;
    }

    if (currentOpenConversationId != int.tryParse(fcmConversationId)) {
      final body = message['data']['body'] as String;
      final conversationName = message['data']['conversationName'] as String;
      showTextNotification(channelName, channelName, fcmConversationId,
          conversationName, body, fcmConversationId);
    }
  }
}
