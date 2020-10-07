import 'dart:async';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:iconapp/routes/router.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/sources/local/shared_preferences.dart';
import 'package:iconapp/stores/auth/auth_store.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/stores/home/home_store.dart';
import 'package:iconapp/stores/user/user_store.dart';

import 'notifications.dart';

final firebasePlugin = FlutterLocalNotificationsPlugin();
const channelName = 'fcm_default_channel';

final messaging = FirebaseMessaging();

class Fcm {
  StreamSubscription<String> tokenRefreshSubscription;

  void setFirebase() {
    final sp = sl<SharedPreferencesService>();
    final auth = sl<AuthStore>();
    final user = sl<UserStore>();
    final android = AndroidInitializationSettings('app_icon');
    final ios = IOSInitializationSettings();
    final init = InitializationSettings(android, ios);
    firebasePlugin.initialize(init,
        onSelectNotification: onNotificationClicked);

    messaging.configure(
      onLaunch: (message) async {
        print('onLaunch');
        return Future.value();
      },
      onResume: (message) async {
        print('onResume');
        return Future.value();
      },
      onBackgroundMessage: Platform.isIOS ? null : backgroundHandler,
      onMessage: (message) async => _handleNotification(message),
    );

    messaging.getToken().then(
      (token) {
        // only send the push token if authenticated.
        if (auth.isSignedIn) {
          user.updatePushToken((token));
        }

        return sp.setString(StorageKey.fcmToken, token);
      },
    );

    tokenRefreshSubscription = messaging.onTokenRefresh.listen(
      (token) => sp.setString(StorageKey.fcmToken, token),
    );
  }

  Future<String> onNotificationClicked(String conversationId) async {
    if (conversationId != null) {
      final home = sl<HomeStore>();
      final id = int.parse(conversationId);
      final conversation = home.getConversationById(id);

      if (conversation != null) {
        ExtendedNavigator.named($Router.routerName).push(
          Routes.chatScreen,
          arguments: ChatScreenArguments(conversation: conversation),
        );
      }
    }

    return '';
  }

  Future<void> cancelNotification(int id) async {
    await firebasePlugin.cancel(id);
  }

  static Future<dynamic> backgroundHandler(Map<String, dynamic> message) async {
    _handleNotification(message);
    return Future<void>.value();
  }

  // todo implement
  void dispose() {
    tokenRefreshSubscription?.cancel();
  }
}

void _handleNotification(Map<String, dynamic> message) {
  final openedConversationId = sl<ChatStore>().conversation?.id ?? 0;

  final conversationId = message['data']['conversationId'] as String;

  if (openedConversationId != conversationId) {
    final body = message['data']['body'] as String;
    final title = message['data']['title'] as String;
    final type = message['data']['notificationType'] as String;

    switch (type) {
      case "message_text":
        showTextNotification(
          channelName,
          channelName,
          conversationId,
          title,
          body,
          conversationId,
        );
        break;
      case "message_photo":
        showImageNotification(
          channelName,
          channelName,
          conversationId,
          title,
          body,
          conversationId,
        );
        break;
    }
  }
}
