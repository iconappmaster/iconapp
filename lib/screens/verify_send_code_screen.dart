import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/stores/verify_icon/verify_icon_store.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:iconapp/widgets/global/lottie_loader.dart';
import 'package:iconapp/widgets/global/next_button.dart';
import 'package:iconapp/widgets/onboarding/base_onboarding_widget.dart';
import 'package:iconapp/widgets/onboarding/onboarding_appbar.dart';
import 'package:iconapp/routes/router.gr.dart';
import '../core/extensions/context_ext.dart';
import 'package:easy_localization/easy_localization.dart';

// This screen is a welcome screen that force the user to agree to our icon terms
class VerifySendCodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = sl<VerifyIconStore>();
    return BaseGradientBackground(
      gradient: grapeDarkIndigo,
      child: Observer(
        builder: (_) => Column(
          children: [
            IconAppbar(showBack: true),
            SizedBox(height: 20),
            CustomText(LocaleKeys.verify_welcomeTitle.tr(), style: personalDetailsHint.copyWith(color: white)),
            SizedBox(height: 20),
            NextButton(
              onClick: () => _requestVerifyCode(store, context),
              title: LocaleKeys.verify_button.tr(),
            ),
            SizedBox(height: 20),
            if (store.codeSent)
              RichText(
                text: TextSpan(children: [
                  TextSpan(text: LocaleKeys.verify_noCode.tr(), style: loginSmallText),
                  TextSpan(
                    text: LocaleKeys.verify_sendAgain.tr(),
                    style: smallLine.copyWith(decoration: TextDecoration.underline, fontWeight: FontWeight.normal),
                    recognizer: TapGestureRecognizer()..onTap = () => _requestVerifyCode(store, context),
                  ),
                ]),
              ),
            SizedBox(height: 20),
            if (store.loading) LottieLoader(),
          ],
        ),
      ),
    );
  }

  Future _requestVerifyCode(VerifyIconStore store, BuildContext context) async {
    if (await store.requestIconVerificationCode()) {
      ExtendedNavigator.of(context).pushVerifyInstagramScreen();
    } else {
      context.showFlushbar(message: 'את/ה כבר אייקון');
    }
  }
}
