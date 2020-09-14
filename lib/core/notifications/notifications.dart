import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/data/sources/local/shared_preferences.dart';

class NotificationsManager {
  final _messaging = FirebaseMessaging();
  StreamSubscription _subscription;

  Future init() async {
    final sp = sl<SharedPreferencesService>();
    _messaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        final msg = MessageModel.fromJson(message);
        print(msg);
      },
      onLaunch: (Map<String, dynamic> message) async {
        _printMsg(message);
      },
      onResume: (Map<String, dynamic> message) async {
        _printMsg(message);
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

    _messaging.setAutoInitEnabled(true);

    _messaging.requestNotificationPermissions();

    _messaging.configure();

    String token = await _messaging.getToken();
    sp.setString(StorageKey.fcmToken, token);
  }

  void _printMsg(Map<String, dynamic> message) {
    print('ON TOKEN REFRESH EVET $message');
  }

  void dispose() {
    _subscription?.cancel();
  }
}
