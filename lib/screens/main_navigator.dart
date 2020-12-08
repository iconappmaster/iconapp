import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/ads/provider_ads/store/custom_ads_store.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/screens/onboarding_phone.dart';
import 'package:iconapp/screens/splash_screen.dart';
import 'package:iconapp/stores/analytics/analytics_consts.dart';
import 'package:iconapp/stores/auth/auth_store.dart';
import 'package:iconapp/stores/home/home_store.dart';
import 'package:iconapp/stores/user/user_store.dart';
import 'package:iconapp/routes/router.gr.dart';
import '../stores/analytics/analytics_firebase.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class MainNavigator extends StatefulWidget {
  @override
  _MainNavigatorState createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  final user = sl<UserStore>();
  final auth = sl<AuthStore>();
  final home = sl<HomeStore>();
  final ad = sl<CustomAdsStore>();
  
  @override
  void didChangeDependencies() {
    init();
    super.didChangeDependencies();
  }

  Future init() async {
    if (auth.isSignedIn) {
      await user.init();
      await home.getConversations();

      if (!ad.addShown) {
        await ExtendedNavigator.of(context).pushCustomAd();
      }

      _sendAnalytics();
    }

    auth.validateAuthState();
  }

  void _sendAnalytics() {
    analytics.setUserId(user.getUser.id);
    analytics.sendAnalyticsEvent(OPENED_APP, {});
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
