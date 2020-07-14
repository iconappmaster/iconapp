import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/widgets/login/login_background.dart';
import '../core/extensions/context_ext.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/stores/login/login_store.dart';
import 'package:iconapp/widgets/global/next_button.dart';
import '../generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

import 'onboarding_phone.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = sl<LoginStore>();
    return Scaffold(
      body: Observer(
        builder: (_) => Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: <Widget>[
            LoginBackgroundImage(),
            Positioned(
              bottom: context.heightPx * .091,
              child: NextButton(
                onClick: () => ExtendedNavigator.of(context)
                    .pushNamed(Routes.onboardingPhone),
              ),
            ),
            Positioned(
                bottom: context.heightPx * .04, child: PrivacyAndTerms()),
            Positioned(
                top: context.heightPx * .249,
                child: SvgPicture.asset('assets/images/welcome_to_icon.svg',
                    height: context.heightPx * .18)),
            if (store.getState.loading) ...[
              Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator()),
            ],
          ],
        ),
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
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(text: LocaleKeys.policy_terms.tr(), style: smallLine),
          TextSpan(
              text: LocaleKeys.policy_link.tr(),
              style: smallLine.copyWith(decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  // if (await canLaunch(termsOfService)) {
                  //   await launch(termsOfService);
                  // }
                }),
          TextSpan(text: LocaleKeys.policy_prefix.tr(), style: smallLine)
        ]),
      ),
    );
  }
}
