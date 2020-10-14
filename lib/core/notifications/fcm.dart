import 'dart:async';
import 'dart:convert';
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

  void setFirebase() async {
    final sp = sl<SharedPreferencesService>();
    final auth = sl<AuthStore>();
    final user = sl<UserStore>();

    final android = AndroidInitializationSettings('app_icon');

    final ios = IOSInitializationSettings();

    final init = InitializationSettings(
      android,
      ios,
    );

    firebasePlugin.initialize(
      init,
      onSelectNotification: onNotificationClicked,
    );

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
      onMessage: (message) async => _handleNotification(
        message: message,
        foregroundMessage: true,
      ),
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
      // parse the convesraton id from string to int
      final id = int.tryParse(conversationId);

      // check if the parsed is ok
      if (id != null) {
        final home = sl<HomeStore>();
        final sp = sl<SharedPreferencesService>();
        // get conversation from all cached conversations
        final conversation = await home.getCachedConversationById(id);

        if (conversation != null) {
          /// cache the conversation the should be opend. use it on [MainNavigator]
          final json = jsonEncode(conversation.toJson());
          await sp.setString(StorageKey.fcmConversation, json);

          ExtendedNavigator.named($Router.routerName)
              .push(Routes.mainNavigator);
        }
      }
    }

    return '';
  }

  Future<void> cancelNotification(int id) async {
    await firebasePlugin.cancel(id);
  }

  static Future<dynamic> backgroundHandler(Map<String, dynamic> message) async {
    _handleNotification(message: message, foregroundMessage: false);
    return Future<void>.value();
  }

  // todo implement
  void dispose() {
    tokenRefreshSubscription?.cancel();
  }
}

void _handleNotification(
    {Map<String, dynamic> message, bool foregroundMessage}) {
  final dataConversationId = message['data']['conversationId'] as String;

  // Handle notification from FCM (with notification { } payload)
  if (dataConversationId == null) {
    final title = message['notification']['title'];
    final body = message['notification']['body'];
    showTextNotification(channelName, channelName, "0", title, body, body);
  } else {
    // handle data payload
    var openedConversationId = 0;

    if (foregroundMessage) {
      // if notification comes from foreground then get the conversationId
      // that's for not showing notfication to a specific chat when it's open
      openedConversationId = sl<ChatStore>().conversation?.id ?? 0;
    }

    if (openedConversationId != int.tryParse(dataConversationId)) {
      final body = message['data']['body'] as String;
      final title = message['data']['title'] as String;
      final type = message['data']['notificationType'] as String;

      switch (type) {
        case "message_text":
          showTextNotification(
            channelName,
            channelName,
            dataConversationId,
            title,
            body,
            dataConversationId,
          );
          break;
        case "message_photo":
          showImageNotification(
            channelName,
            channelName,
            dataConversationId,
            title,
            body,
            dataConversationId,
          );
          break;
        case "message_video":
          showTextNotification(
            channelName,
            channelName,
            dataConversationId,
            title,
            body,
            dataConversationId,
          );
          break;

        case "message_audio":
          showTextNotification(
            channelName,
            channelName,
            dataConversationId,
            title,
            body,
            dataConversationId,
          );
          break;
      }
    }
  }
}
