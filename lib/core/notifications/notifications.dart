import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';

import 'fcm.dart';

class NotificationsHelper {
  final fcm = sl<Fcm>();

  Future<void> showNotification(String channelId, String channelName, int id,
      String title, String body, String payload) async {
    final androidPlatformChannelSpecifics = AndroidNotificationDetails(
      channelId,
      channelName,
      'main notificaiton channel',
      importance: Importance.Max,
      priority: Priority.High,
      ticker: 'ticker',
      autoCancel: true,
      enableLights: true,
      color: cornflower,
    );

    final iOSPlatformChannelSpecifics = IOSNotificationDetails();

    final platformChannelSpecifics = NotificationDetails(
      androidPlatformChannelSpecifics,
      iOSPlatformChannelSpecifics,
    );

    await firebasePlugin.show(
      id,
      title,
      body,
      platformChannelSpecifics,
      payload: payload,
    );
  }
}
