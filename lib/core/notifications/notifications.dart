import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/sources/local/shared_preferences.dart';

class NotificationsManager {
  final _messaging = FirebaseMessaging();
  StreamSubscription _subscription;

  Future init() async {
    final sp = sl<SharedPreferencesService>();
    _messaging.requestNotificationPermissions();
    _messaging.setAutoInitEnabled(true);

    _messaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        // final msg = MessageModel.fromJson(message);
        print('a');
      },
      onBackgroundMessage: myBackgroundMessageHandler,
      onLaunch: (Map<String, dynamic> message) async {
        print('a');
      },
      onResume: (Map<String, dynamic> message) async {
        print('a');
      },
    );

    await _messaging.requestNotificationPermissions(
      const IosNotificationSettings(
        sound: true,
        badge: true,
        alert: true,
        provisional: true,
      ),
    );

    _messaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print('requestNotificationPermissions $settings');
    });

    _subscription = _messaging.onTokenRefresh
        .listen((token) => sp.setString(StorageKey.fcmToken, token));

    String token = await _messaging.getToken();
    sp.setString(StorageKey.fcmToken, token);
  }

  static Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) {
    // if (message.containsKey('data')) {
    //   // Handle data message
    //   final dynamic data = message['data'];
    //   return data;
    // }

    // if (message.containsKey('notification')) {
    //   // Handle notification message
    //   final dynamic notification = message['notification'];
    //   return message['notification'];
    // }

    return message['notification'];
  }

  void dispose() {
    _subscription?.cancel();
  }
}
