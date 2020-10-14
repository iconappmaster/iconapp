import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:iconapp/core/theme.dart';
import 'package:path_provider/path_provider.dart';
import 'fcm.dart';


// class NotificationsHelper {

Future<void> showTextNotification(String channelId, String channelName,
    String id, String title, String body, String payload) async {
  final androidPlatformChannelSpecifics = AndroidNotificationDetails(
    channelId,
    channelName,
    'main notificaiton channel',
    importance: Importance.Max,
    priority: Priority.High,
    ticker: 'ticker',
    visibility: NotificationVisibility.Public,
    playSound: true,
    sound: RawResourceAndroidNotificationSound('notification'),
    autoCancel: true,
    enableLights: true,
    color: cornflower,
  );

  final iOSPlatformChannelSpecifics = IOSNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
  );

  final platformChannelSpecifics = NotificationDetails(
    androidPlatformChannelSpecifics,
    iOSPlatformChannelSpecifics,
  );

  await firebasePlugin.show(
    int.tryParse(id),
    title,
    body,
    platformChannelSpecifics,
    payload: payload,
  );
}

Future<void> showImageNotification(String channelId, String channelName,
    String id, String title, String body, String payload) async {
  final bigPicturePath = await _downloadAndSaveFile(body, 'Picture');

  final style = BigPictureStyleInformation(
      FilePathAndroidBitmap(bigPicturePath),
      contentTitle: '$title',
      htmlFormatContentTitle: true,
      summaryText: '$body',
      htmlFormatSummaryText: true);

  final android = AndroidNotificationDetails(
    channelId,
    channelName,
    'big photo channel description',
    styleInformation: style,
  );
  final ios = IOSNotificationDetails(
    attachments: [
      IOSNotificationAttachment(bigPicturePath),
    ],
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
  );

  var platformChannel = NotificationDetails(
    android,
    ios,
  );

  await firebasePlugin.show(
      0, 'big text title', 'silent body', platformChannel);
}

Future<String> _downloadAndSaveFile(String url, String fileName) async {
  var directory = await getApplicationDocumentsDirectory();
  var filePath = '${directory.path}/$fileName';
  var response = await http.get(url);
  var file = File(filePath);
  await file.writeAsBytes(response.bodyBytes);
  return filePath;
}
