import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationsManager {
  final _messaging = FirebaseMessaging();

  configure() {
    _messaging.configure(
      onBackgroundMessage: (message) async => print(message),
      onMessage: (message) async => print(message),
      onLaunch: (message) async => print(message),
      onResume: (message) async => print(message),
    );

    _messaging.onTokenRefresh.listen((event) => print(event));
    _messaging.setAutoInitEnabled(true);
  }
}