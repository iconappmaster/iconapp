import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          // Container(height: 100, width: 100, color: Colors.cyan,),
          SvgPicture.asset('asssets/images/icon_logo.svg'),
        ],
      ),
    );
  }
}

// home: Observer(
//   builder: (_) => store.authState.maybeWhen(
//       onboarding: () => OnboardinScreen(),
//       authenticated: () => HomeScreen(),
//       unauthenticated: () => LoginScreen(),
//       orElse: () => null),
// ),