import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/stores/login/login_store.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/global/next_button.dart';
import 'package:iconapp/widgets/onboarding/onboarding_appbar.dart';
import '../core/extensions/context_ext.dart';
import '../generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class OnboardingPhone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = sl<LoginStore>();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: purpleGradient),
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.topCenter,
          children: <Widget>[
            OnboardingAppbar(),
            Positioned(
              top: context.heightPlusStatusbarPerc(.447),
              child: NextButton(
                onClick: () => '',
              ),
            ),
            Positioned(
              top: context.heightPlusStatusbarPerc(.134),
              child: HebrewText(
                LocaleKeys.onboarding_phoneTitle.tr(),
                style: loginBigText,
              ),
            ),
            Positioned(
              top: context.heightPlusStatusbarPerc(.221),
              child: HebrewText(
                LocaleKeys.onboarding_phoneSubtitle.tr(),
                style: loginSmallText,
              ),
            ),
            Positioned(
              top: context.heightPlusStatusbarPerc(.272),
              child: PhoneNumberInput(),
            ),
            Positioned(
              top: context.heightPlusStatusbarPerc(.22),
              right: context.widthPx * .134,
              child: SvgPicture.asset(
                'assets/images/check.svg',
                height: context.heightPlusStatusbarPerc(.047),
                width: context.widthPx * .083,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PhoneNumberInput extends StatefulWidget {
  @override
  _PhoneNumberInputState createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  final prefixController = TextEditingController(text: '05');
  final phoneFocus = FocusNode();
  final prefixFocus = FocusNode();

  @override
  void initState() {
    prefixController.selection = TextSelection.fromPosition(
        TextPosition(offset: prefixController.text.length));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final inputDecor = const InputDecoration(
      counterText: '',
      enabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: cornflower)),
      border: const UnderlineInputBorder(
        borderSide: const BorderSide(
          width: .3,
          color: cornflower,
        ),
      ),
    );
    return Wrap(
      direction: Axis.horizontal,
      children: <Widget>[
        _buildPhone(context, inputDecor),
        SizedBox(width: context.widthPx * .04),
        _buildPrefix(context, inputDecor),
      ],
    );
  }

  Container _buildPhone(BuildContext context, InputDecoration inputDecor) {
    return Container(
      width: context.widthPx * .29,
      child: TextField(
        focusNode: phoneFocus,
        maxLength: 9,
        textAlign: TextAlign.left,
        decoration: inputDecor,
        style: phoneNumber,
        keyboardType: TextInputType.phone,
      ),
    );
  }

  Container _buildPrefix(BuildContext context, InputDecoration inputDecor) {
    return Container(
      width: context.widthPx * .155,
      child: TextField(
        focusNode: prefixFocus,
        autofocus: true,
        keyboardType: TextInputType.phone,
        textAlign: TextAlign.left,
        controller: prefixController,
        maxLength: 3,
        maxLengthEnforced: true,
        decoration: inputDecor,
        style: phoneNumber,
        onChanged: (prefix) {
          if (prefix.length == 3) {
            prefixFocus.unfocus();
            FocusScope.of(context).requestFocus(phoneFocus);
          }
        },
      ),
    );
  }
}

class BlueDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: cornflower,
      endIndent: 0,
      indent: 0,
      height: .3,
    );
  }
}
