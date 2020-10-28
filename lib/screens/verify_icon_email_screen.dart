import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/stores/verify_icon/verify_icon_store.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:iconapp/widgets/global/input_box.dart';
import 'package:iconapp/widgets/global/lottie_loader.dart';
import 'package:iconapp/widgets/global/next_button.dart';
import 'package:iconapp/widgets/onboarding/base_onboarding_widget.dart';
import 'package:iconapp/widgets/onboarding/onboarding_appbar.dart';
import '../core/extensions/string_ext.dart';
import 'package:iconapp/routes/router.gr.dart';

// This screen is a welcome screen that force the user to agree to our icon terms
class VerifyIconEmailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final verify = sl<VerifyIconStore>();
    return BaseGradientBackground(
      gradient: grapeDarkIndigo,
      child: Column(
        children: [
          IconAppbar(showBack: true),
          SizedBox(height: 20),
          CustomText('הוספ/י את כתובת המייל שלך',
              style: personalDetailsHint.copyWith(color: white)),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: InputText(
                validator: (input) =>
                    input.isValidAddress() ? null : "בדוק את האימייל שלך",
                keyboardType: TextInputType.emailAddress,
                onChange: (email) => verify.email = email,
                hint: 'you@email.com',
                hintStyle: emailHint,
                textStyle: emailHint.copyWith(color: white),
              ),
            ),
          ),
          SizedBox(height: 30),
          Observer(
            builder: (_) => NextButton(
                enabled: verify.email.isValidAddress(),
                onClick: () {
                  final isValid = verify.email.isValidAddress.call();
                  if (isValid) {
                    ExtendedNavigator.of(context).pushVerifyInstagramScreen();
                  }
                }),
          ),
          if (verify.loading) LottieLoader(),
        ],
      ),
    );
  }
}
