import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/screens/onboarding_phone.dart';
import 'package:iconapp/screens/splash_screen.dart';
import 'package:iconapp/stores/analytics/analytics_consts.dart';
import 'package:iconapp/stores/auth/auth_store.dart';
import 'package:iconapp/stores/home/home_store.dart';
import 'package:iconapp/stores/user/user_store.dart';
import '../stores/analytics/analytics_firebase.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class MainNavigator extends StatelessWidget {
  final user = sl<UserStore>();
  final auth = sl<AuthStore>();
  final home = sl<HomeStore>();

  MainNavigator() {
    init();
  }

  Future init() async {
    if (auth.isSignedIn) {
      await user.init();
      await home.getConversations();
      analytics.setUserId(user.getUser.id);
      
      analytics.sendAnalyticsEvent(OPENED_APP, {});
    }

    auth.validateAuthState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return auth.state.maybeWhen(
          onboarding: () => OnboardingScreen(),
          authenticated: () => HomeScreen(),
          unauthenticated: () => LoginScreen(),
          orElse: () => SplashScreen(),
        );
      },
    );
  }
}
