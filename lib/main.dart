import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/notifications/notifications.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/stores/socket/socket_manager.dart';
import 'package:logger/logger.dart';
import 'data/sources/local/shared_preferences.dart';
import 'generated/codegen_loader.g.dart';

final logger = Logger();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initLocator();
  // await _initSharedPreferences();
  // await sl<SocketStore>().init();
  // sl<NotificationsManager>().init();
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
  Future<void> _initSharedPreferences() async =>
      await sl<SharedPreferencesService>().init();

  @override
  void initState() {
    init();
    super.initState();
  }

  Future init() async {
    initLocator();
    await _initSharedPreferences();
    await sl<SocketStore>().init();
    await sl<NotificationsManager>().init();
  }

  @override
  void didChangeDependencies() {
    context.locale = Locale('he', 'HE');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
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
      builder: ExtendedNavigator(router: Router()),
    );
  }
}
