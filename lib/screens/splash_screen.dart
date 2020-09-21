import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/screens/onboarding_phone.dart';
import 'package:iconapp/stores/auth/auth_store.dart';
import 'package:iconapp/stores/home/home_store.dart';
import 'package:iconapp/stores/user/user_store.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/login/login_background.dart';
import '../core/extensions/context_ext.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthStore _authStore;
  UserStore _userStore;
  HomeStore _homeStore;

  @override
  void initState() {
    super.initState();
    _authStore = sl<AuthStore>();
    _userStore = sl<UserStore>();
    _homeStore = sl<HomeStore>();

    init();
  }

  Future init() async {
    // if user is signed in then init the user store
    if (_authStore.isSignedIn) {
      await _userStore.init();
      await _homeStore.getConversations();
    }

    Future.delayed(
      Duration(milliseconds: 500),
      () => _authStore.checkCurrentAuthState(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return _authStore.state.maybeWhen(
            onboarding: () => OnboardingPhone(),
            authenticated: () => HomeScreen(),
            unauthenticated: () => LoginScreen(),
            orElse: () => SplashContent());
      },
    );
  }
}

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: <Widget>[
        LoginBackgroundImage(),
        Positioned(
          top: context.heightPx * .366,
          child: Container(
            height: context.heightPx * .268,
            width: context.widthPx * .395,
            child: SvgPicture.asset('assets/images/icon_logo.svg'),
          ),
        ),
        Positioned(
            bottom: 100,
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                  width: 25,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(white),
                    strokeWidth: 1,
                  ),
                ),
                SizedBox(height: 16),
                Material(
                    color: Colors.transparent,
                    child: CustomText(
                      'מאתחל ...',
                      style: chatMessageBody,
                    ))
              ],
            ))
      ],
    );
  }
}
