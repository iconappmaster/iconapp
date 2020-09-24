import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/notifications/notifications.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/data/sources/socket/socket_manager.dart';
import 'package:logger/logger.dart';
import 'data/sources/local/shared_preferences.dart';
import 'generated/codegen_loader.g.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

final logger = Logger();

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
NotificationAppLaunchDetails notificationAppLaunchDetails;

class ReceivedNotification {
  final int id;
  final String title;
  final String body;
  final String payload;

  ReceivedNotification({
    @required this.id,
    @required this.title,
    @required this.body,
    @required this.payload,
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  notificationAppLaunchDetails =
      await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

  var initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
  // Note: permissions aren't requested here just to demonstrate that can be done later using the `requestPermissions()` method
  // of the `IOSFlutterLocalNotificationsPlugin` class
  var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      onDidReceiveLocalNotification:
          (int id, String title, String body, String payload) async {
            debugPrint('notification payload: ' + payload);
          });
  
  var initializationSettings = InitializationSettings(
      initializationSettingsAndroid, initializationSettingsIOS);
  
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
  });

  runApp(
    EasyLocalization(
      useOnlyLangCode: false,
      supportedLocales: [
        Locale('he', 'HE'),
        Locale('en', 'US'),
      ],
      path: 'assets/translations',
      fallbackLocale: Locale('he', 'HE'),
      assetLoader: CodegenLoader(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Socket _socket;

  @override
  void initState() {
    init();
    _socket = sl<Socket>();
    super.initState();
  }

  Future init() async {
    initLocator();
    await _initSharedPreferences();
    await _socket.init();
    await sl<NotificationsManager>().init();
    _socket.connect();
    initCrashlytics();
  }

  initCrashlytics() {
    // Set `enableInDevMode` to true to see reports while in debug mode
    // This is only to be used for confirming that reports are being
    // submitted as expected. It is not intended to be used for everyday
    // development.
    FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

    // Pass all uncaught errors from the framework to Crashlytics.
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  }

  @override
  void didChangeDependencies() {
    context.locale = Locale('he', 'HE');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      onGenerateRoute: Router(),
      title: 'Icon',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      builder: ExtendedNavigator(
        router: Router(),
      ),
    );
  }

  @override
  void dispose() {
    _socket.disconnect();
    super.dispose();
  }

  Future<void> _initSharedPreferences() async =>
      await sl<SharedPreferencesService>().init();
}
