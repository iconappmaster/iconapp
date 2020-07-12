import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/screens/home_screen.dart';
import 'package:iconapp/screens/onboarding_screen.dart';
import 'package:iconapp/stores/auth/auth_store.dart';
import 'package:logger/logger.dart';
import 'data/sources/local/shared_preferences.dart';
import 'screens/login_screen.dart';

final logger = Logger();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initLocator();
  await initSharedPreferences();
  runApp(MyApp());
}

Future<void> initSharedPreferences() async =>
    await sl<SharedPreferencesService>().init();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final store = sl<AuthStore>();
    store.checkCurrentAuthState();
    return MaterialApp(
      onGenerateRoute: Router(),
      title: 'Icon',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Observer(
          builder: (_) => store.authState.when(
              initial: () => Scaffold(body: Container()),
              onboarding: () => OnboardinScreen(),
              authenticated: () => HomeScreen(),
              unauthenticated: () => LoginScreen())),
    );
  }
}
