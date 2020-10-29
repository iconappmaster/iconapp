import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/stores/verify_icon/verify_icon_store.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:iconapp/widgets/global/next_button.dart';
import 'package:iconapp/widgets/global/round_checkbox.dart';
import 'package:iconapp/widgets/onboarding/base_onboarding_widget.dart';
import 'package:iconapp/widgets/onboarding/onboarding_appbar.dart';
import 'package:iconapp/routes/router.gr.dart';
import '../core/extensions/context_ext.dart';

const rules =
    'אני פונה לזיהוי כאייקון מעצם היותי ידוענ/ית, מוביל/ת דעה או מוביל/ת תוכן. אם יתברר ע"י המערכת שפניתי ללא כל עילה סבירה השימוש באפליקציה יחסם לחודש ימים.';
const terms = 'אני מאשר/ת את תנאי השימוש של אייקון.';
const flush = 'אנא אשר את התנאים';
const welcomeTitle = 'ברוכים הבאים לתהליך ההזדהות כאייקון';

// This screen is a welcome screen that force the user to agree to our icon terms
class VerifyWelcomeScreen extends StatelessWidget {
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
          _VerifyAgreementRule(
              onTap: (r) => store.agreedRules = r,
              isSelected: store.agreedRules,
              text: rules),
          SizedBox(height: 20),
          _VerifyAgreementRule(
            onTap: (t) => store.agreedTerms = t,
            isSelected: store.agreedTerms,
            text: terms,
          ),
          SizedBox(height: 50),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 17),
              child: Observer(
                builder: (_) => NextButton(
                  title: 'המשך',
                  onClick: () {
                    store.canNavigateToSendCode
                        ? ExtendedNavigator.of(context)
                            .pushVerifyIconEmailScreen()
                        : context.showFlushbar(message: flush);
                  },
                ),
              )),
        ],
      ),
    );
  }
}

class _VerifyAgreementRule extends StatelessWidget {
  final bool isSelected;
  final String text;
  final Function(bool) onTap;

  const _VerifyAgreementRule({
    Key key,
    this.isSelected = false,
    @required this.text,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 41.0),
      child: Row(
        children: [
          RoundCheckBox(
            uncheckedColor: Colors.transparent,
            borderColor: cornflower,
            isChecked: isSelected,
            onTap: onTap,
            size: 28,
          ),
          SizedBox(width: 7.3),
          Expanded(
              child: CustomText(
            text,
            style: loginSmallText,
            textAlign: TextAlign.start,
          ))
        ],
      ),
    );
  }
}
