import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/stores/verify_icon/verify_icon_store.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:iconapp/widgets/global/next_button.dart';
import 'package:iconapp/widgets/onboarding/base_onboarding_widget.dart';
import 'package:iconapp/widgets/onboarding/onboarding_appbar.dart';

const welcomeTitle =
    'על מנת שנוכל לאשר את זהותך, שלח.י לנו את הקוד שקיבלת בהודעה באינסטוש.';

// This screen is a welcome screen that force the user to agree to our icon terms
class VerifyInstagramScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = sl<VerifyIconStore>();
    return BaseGradientBackground(
      gradient: grapeDarkIndigo,
      child: Column(
        children: [
          IconAppbar(showBack: true),
          SizedBox(height: 20),
          CustomText(welcomeTitle,
              style: personalDetailsHint.copyWith(color: white)),
          SizedBox(height: 20),
          SizedBox(height: 50),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 17),
            child: Observer(
              builder: (_) => NextButton(
                title: 'לאינסטוש של אייקון',
                onClick: () {

                },
              ),
            ),
          ),
          SizedBox(height: 20),
          CustomText('אנחנו נזהה אותך ונעדכן בהקדם על אישורך כאייקון.',
              style: loginSmallText),
        ],
      ),
    );
  }
}
