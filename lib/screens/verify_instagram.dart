import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:iconapp/widgets/global/next_button.dart';
import 'package:iconapp/widgets/onboarding/base_onboarding_widget.dart';
import 'package:iconapp/widgets/onboarding/onboarding_appbar.dart';
import 'package:url_launcher/url_launcher.dart';

const welcomeTitle =
    'על מנת שנוכל לאשר את זהותך, שלח/י לנו את הקוד שקיבלת בהודעה באינסטוש.';
const buttonText = 'לאינסטוש של אייקון';
const subTitle = 'אנחנו נזהה אותך ונעדכן בהקדם על אישורך כאייקון.';

const iconInstagramUrl = 'https://www.instagram.com/icon_app_/';

// This screen is a welcome screen that force the user to agree to our icon terms
class VerifyInstagramScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  title: buttonText,
                  onClick: () async {
                    if (await canLaunch(iconInstagramUrl))
                      launch(iconInstagramUrl);

                    ExtendedNavigator.of(context)..pop()..pop()..pop()..pop();
                  }),
            ),
          ),
          SizedBox(height: 20),
          CustomText(subTitle, style: loginSmallText),
        ],
      ),
    );
  }
}
