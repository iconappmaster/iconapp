import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/sources/local/shared_preferences.dart';
import 'package:iconapp/stores/home/home_store.dart';
import 'notifications.dart';


final firebasePlugin = FlutterLocalNotificationsPlugin();
const channelName = 'channel1';

class Fcm {
  StreamSubscription<String> subscription;

  void setFirebase() {
    final sp = sl<SharedPreferencesService>();
    final notificaitons = sl<NotificationsHelper>();

    var android = AndroidInitializationSettings('app_icon');
    var ios = IOSInitializationSettings();
    var init = InitializationSettings(android, ios);
    firebasePlugin.initialize(
      init,
      onSelectNotification: onNotificationClicked,
    );
    final FirebaseMessaging _messaging = FirebaseMessaging();

    _messaging.configure(
      onBackgroundMessage: Platform.isIOS ? null : backgroundHandler,
      onMessage: (message) async {
        final title = message['notification']['title'];
        final body = message['notification']['body'];
        final conversationId = message['data']['conversationId'] ?? '';

        notificaitons.showNotification(
          channelName,
          channelName,
          conversationId,
          title,
          body,
          conversationId,
        );
      },
      onLaunch: (message) async {
        print("onLaunch: $message");
      },
      onResume: (message) async {
        print("onResume: $message");
      },
    );

    _messaging
        .getToken()
        .then((token) => sp.setString(StorageKey.fcmToken, token));

    subscription = _messaging.onTokenRefresh.listen(
      (token) => sp.setString(StorageKey.fcmToken, token),
    );
  }

  Future<String> onNotificationClicked(String conversationId) async {
    final id = int.tryParse(conversationId, radix: 0);
    if (id != 0) {
      final conversation = sl<HomeStore>().getConversationById(id);

      if (conversation != null) {
        print('navigate');
      }
    }

    return '';
  }

  Future<void> cancelNotification(int id) async {
    await firebasePlugin.cancel(id);
  }

//updated myBackgroundMessageHandler
  static Future<dynamic> backgroundHandler(Map<String, dynamic> message) async {
    print(message);

    final notification = sl<NotificationsHelper>();

    final title = message['notification']['title'];
    final body = message['notification']['body'];

    notification.showNotification(
      channelName,
      channelName,
      2,
      title,
      body,
      'payload',
    );

    return Future<void>.value();
  }

  // todo implement
  void dispose() {
    subscription?.cancel();
  }
}
