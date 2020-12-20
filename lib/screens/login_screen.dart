import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/stores/login/login_store.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/theme.dart';
import '../routes/router.gr.dart';
import '../widgets/login/login_background.dart';
import '../core/extensions/context_ext.dart';
import '../widgets/global/next_button.dart';

const policyUrl = 'https://www.icon-app.net/policy-en';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final login = sl<LoginStore>();
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: <Widget>[
          LoginBackgroundImage(),
          Positioned(
            bottom: context.heightPx * .145,
            child: NextButton(
              title: 'CONTINUE',
              onClick: () {
                if (login.agreeTerms)
                  ExtendedNavigator.of(context).pushOnboardingScreen();
                else {
                  context.showFlushbar(message: 'Please agree to the tearms');
                }
              },
            ),
          ),
          Positioned(bottom: context.heightPx * .054, child: PrivacyAndTerms()),
          Positioned(
            top: context.heightPx * .249,
            child: SvgPicture.asset(
              'assets/images/welcome_to_icon.svg',
              height: context.heightPx * .18,
            ),
          ),
        ],
      ),
    );
  }
}

class PrivacyAndTerms extends StatelessWidget {
  const PrivacyAndTerms({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final login = sl<LoginStore>();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        children: [
          RichText(
            textAlign: TextAlign.left,
            text: TextSpan(children: [
              TextSpan(
                  text: 'To log in, you must first read and accept our\n',
                  style: smallLine),
              TextSpan(
                  text: 'terms of use',
                  style:
                      smallLine.copyWith(decoration: TextDecoration.underline),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      if (await canLaunch(policyUrl)) launch(policyUrl);
                    }),
            ]),
          ),
          Observer(
            builder: (_) => Theme(
              data: Theme.of(context).copyWith(unselectedWidgetColor: white),
              child: Checkbox(
                checkColor: cornflower,
                activeColor: white,
                value: login.agreeTerms,
                onChanged: (bool value) => login.updateTerms(value),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
