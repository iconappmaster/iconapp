import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:logger/logger.dart';
import 'data/sources/local/shared_preferences.dart';
import 'generated/codegen_loader.g.dart';

final logger = Logger();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  initLocator();
  await initSharedPreferences();
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

Future<void> initSharedPreferences() async =>
    await sl<SharedPreferencesService>().init();

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
