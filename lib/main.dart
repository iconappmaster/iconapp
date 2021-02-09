import 'dart:async';
import 'dart:io';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/keys.dart';
import 'package:iconapp/routes/router.dart' as router;
import 'package:iconapp/routes/router.gr.dart' as rGenerated;
import 'package:iconapp/data/sources/socket/socket_manager.dart';
import 'package:iconapp/stores/analytics/analytics_firebase.dart';
import 'package:iconapp/stores/language/language_store.dart';
import 'package:iconapp/stores/redemption/coin_animation_store.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:logger/logger.dart';
import 'package:lottie/lottie.dart';
import 'core/bus.dart';
import 'core/notifications/fcm.dart';
import 'data/sources/local/shared_preferences.dart';
import 'generated/codegen_loader.g.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:showcaseview/showcaseview.dart';

final logger = Logger();
const appName = 'Icon';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Inform the plugin that this app supports pending purchases on Android.
  // An error will occur on Android if you access the plugin `instance`
  // without this call.
  //
  // On iOS this is a no-op.
  if (Platform.isAndroid) {
    InAppPurchaseConnection.enablePendingPurchases();
  }

  Admob.initialize();

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
  Analytics _analytics;
  CoinAnimationStore _coinStore;

  StreamSubscription<LanguageChangedEvnet> _languageSubscription;

  @override
  void initState() {
    init();

    _socket = sl<Socket>();
    _coinStore = sl<CoinAnimationStore>();
    // setup firebase listeners
    sl<Fcm>().setFirebase();
    _analytics = sl<Analytics>();

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
    FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

    // Pass all uncaught errors from the framework to Crashlytics.
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  }

  @override
  void didChangeDependencies() {
    _listenLanguageChanges();
    super.didChangeDependencies();
  }

  void _listenLanguageChanges() {
    _languageSubscription = sl<Bus>().on<LanguageChangedEvnet>().listen((event) {
      switch (event.direction) {
        case LanguageDirection.ltr:
          context.locale = Locale('en', 'US');
          break;
        case LanguageDirection.rtl:
          context.locale = Locale('he', 'HE');
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    }

    return ShowCaseWidget(
        onFinish: () => _finishTutorial(context),
        builder: Builder(
          builder: (context) => MaterialApp(
            navigatorKey: NavigationService.navigationKey,
            debugShowCheckedModeBanner: false,
            navigatorObservers: <NavigatorObserver>[_analytics.observer],
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            title: appName,
            theme: ThemeData(primarySwatch: Colors.blue, visualDensity: VisualDensity.adaptivePlatformDensity),
            onGenerateRoute: rGenerated.Router(),
            builder: (context, child) {
              return Stack(children: [
                ExtendedNavigator(
                  name: router.$Router.routerName,
                  router: rGenerated.Router(),
                ),
                Observer(builder: (_) {
                  return Visibility(
                      visible: _coinStore.showCoins,
                      child: Positioned(
                          child: SizedBox(
                              height: MediaQuery.of(context).size.height * .4,
                              width: MediaQuery.of(context).size.height * .6,
                              child: Lottie.asset('assets/animations/coin_collect.json',
                                  onLoaded: (composition) => Timer(composition.duration - Duration(seconds: 2),
                                      () => _coinStore.setShowCoins(false))))));
                }),
              ]);
            },
          ),
        ));
  }

  void _finishTutorial(BuildContext context) {
    final sp = sl<SharedPreferencesService>();

    final homeShowed = sp.contains(StorageKey.tutorialHome);

    if (!homeShowed) {
      sp.setBool(StorageKey.tutorialHome, true);
    }
  }

  @override
  void dispose() {
    _socket.disconnect();
    _languageSubscription?.cancel();
    sl<Fcm>().dispose();

    super.dispose();
  }

  Future<void> _initSharedPreferences() async => await sl<SharedPreferencesService>().init();
}
