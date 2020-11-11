import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/keys.dart';
import 'package:iconapp/routes/router.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/data/sources/socket/socket_manager.dart';
import 'package:logger/logger.dart';
import 'core/notifications/fcm.dart';
import 'data/sources/local/shared_preferences.dart';
import 'generated/codegen_loader.g.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

final logger = Logger();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

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

    // setup firebase listeners
    sl<Fcm>().setFirebase();
    super.initState();
  }

  Future init() async {
    initLocator();
    await _initSharedPreferences();

    await _socket
      ..init()
      ..connect();

    initCrashlytics();
  }

  initCrashlytics() {
    // Set `enableInDevMode` to true to see reports while in debug mode
    // This is only to be used for confirming that reports are being
    // submitted as expected. It is not intended to be used for everyday
    // development.
    Crashlytics.instance.enableInDevMode = true;

    // Pass all uncaught errors from the framework to Crashlytics.
    FlutterError.onError = Crashlytics.instance.recordFlutterError;
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
      navigatorKey: NavigationService.navigationKey,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      onGenerateRoute: Router(),
      title: 'Icon',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      builder: (_, child) =>
          ExtendedNavigator(name: $Router.routerName, router: Router()),
    );
  }

  @override
  void dispose() {
    _socket.disconnect();
    sl<Fcm>().dispose();
    super.dispose();
  }

  Future<void> _initSharedPreferences() async =>
      await sl<SharedPreferencesService>().init();
}
