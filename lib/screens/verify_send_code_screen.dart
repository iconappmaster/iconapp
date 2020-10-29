import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/stores/verify_icon/verify_icon_store.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:iconapp/widgets/global/lottie_loader.dart';
import 'package:iconapp/widgets/global/next_button.dart';
import 'package:iconapp/widgets/onboarding/base_onboarding_widget.dart';
import 'package:iconapp/widgets/onboarding/onboarding_appbar.dart';
import 'package:iconapp/routes/router.gr.dart';
import '../core/extensions/context_ext.dart';

const rules =
    'אני פונה לזיהוי כאייקון מעצם היותי ידוענ.ית, מוביל.ת דעה או מוביל.ת תוכן. אם יתברר ע"י המערכת שפניתי ללא כל עילה סבירה השימוש באפליקציה יחסם לחודש ימים.';
const terms = 'אני מאשר.ת את תנאי השימוש של אייקון.';
const flush = 'אנא אשר את התנאים';
const welcomeTitle = 'ברוכים הבאים לתהליך ההזדהות כאייקון';
const nextButton = 'שלחו לי את הקוד';

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
            CustomText(welcomeTitle,
                style: personalDetailsHint.copyWith(color: white)),
            SizedBox(height: 20),
            NextButton(
              onClick: () async => _requestVerifyCode(store, context),
              title: nextButton,
            ),
            SizedBox(height: 20),
            if (store.codeSent)
              RichText(
                text: TextSpan(children: [
                  TextSpan(text: 'לא קיבלתי את הקוד.', style: loginSmallText),
                  TextSpan(
                    text: 'שלחו שוב',
                    style: smallLine.copyWith(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.normal),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => _requestVerifyCode(store, context),
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
