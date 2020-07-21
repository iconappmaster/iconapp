import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/screens/onboarding_phone.dart';
import 'package:iconapp/stores/auth/auth_store.dart';
import 'package:iconapp/widgets/login/login_background.dart';
import '../core/extensions/context_ext.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthStore _store;

  @override
  void initState() { 
    super.initState();
    
  }
  @override
  void didChangeDependencies() {
    // TODO should I move it to init?
    _store ??= sl<AuthStore>();
    Future.delayed(Duration(seconds: 2), () => _store.checkCurrentAuthState());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return _store.authState.maybeWhen(
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
      ],
    );
  }
}
