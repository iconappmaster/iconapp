import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/stores/login/login_store.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/global/next_button.dart';
import 'package:iconapp/widgets/onboarding/base_onboarding_widget.dart';
import 'package:iconapp/widgets/onboarding/onboarding_appbar.dart';
import 'package:pin_code_fields/models/pin_theme.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../core/extensions/context_ext.dart';
import '../generated/locale_keys.g.dart';
import 'dart:ui' as ui;
import 'package:easy_localization/easy_localization.dart';

class OnboardingPhone extends StatefulWidget {
  @override
  _OnboardingPhoneState createState() => _OnboardingPhoneState();
}

class _OnboardingPhoneState extends State<OnboardingPhone> {
  @override
  Widget build(BuildContext context) {
    final store = sl<LoginStore>();

    return BaseGradientWidget(
      child: Observer(
        builder: (_) => Stack(
          fit: StackFit.expand,
          alignment: Alignment.topCenter,
          children: <Widget>[
            IconAppbar(),
            _OnboardingPhoneTitle(),
            _OnboardingPhoneSubtitle(store: store),
            PhoneNumberInput(store: store),
            _CheckSign(store: store),
            _SmsCounter(store: store),
            _PinCode(store: store),
            _nextButton(store, context),
            _SendAgain(store: store),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    sl<LoginStore>().dispose();
    super.dispose();
  }

  Visibility _nextButton(LoginStore store, BuildContext context) {
    return Visibility(
      visible: store.isIdle,
      child: Positioned(
          top: context.heightPlusStatusbarPerc(.447),
          child: NextButton(
            enabled: store.numberValid,
            onClick: () {
              context.unFocus();
              store.verifyPhone();
            },
            onError: () => context.showErrorFlushbar(
                message: LocaleKeys.onboarding_phone_tooShort.tr()),
          )),
    );
  }
}

class _SendAgain extends StatelessWidget {
  final LoginStore store;

  const _SendAgain({Key key, @required this.store}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !store.isIdle,
      child: Positioned(
        top: context.heightPlusStatusbarPerc(.444),
        child: RichText(
          text: TextSpan(children: [
            TextSpan(text: 'לא קיבלתי את הקוד. ', style: loginSmallText),
            TextSpan(
                text: 'שלח שוב',
                style: smallLine.copyWith(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.normal),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async => store.sendAgain()),
          ]),
        ),
      ),
    );
  }
}

class _SmsCounter extends StatelessWidget {
  final LoginStore store;

  const _SmsCounter({
    Key key,
    @required this.store,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Visibility(
        visible: !store.isIdle,
        child: Positioned(
          top: context.heightPlusStatusbarPerc(.408),
          child: HebrewText(
            LocaleKeys.onboarding_phoneCounting
                .tr(args: [store.displayCountdown]),
            style: loginSmallText,
          ),
        ),
      ),
    );
  }
}

class _PinCode extends StatelessWidget {
  final LoginStore store;

  const _PinCode({
    Key key,
    @required this.store,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pinTheme = PinTheme(
        borderWidth: .7,
        inactiveColor: cornflower,
        selectedColor: Colors.transparent,
        selectedFillColor: cornflower,
        inactiveFillColor: Colors.transparent,
        shape: PinCodeFieldShape.underline,
        disabledColor: cornflower,
        activeColor: cornflower,
        fieldWidth: 40,
        activeFillColor: Colors.transparent);

    return Visibility(
      visible: !store.isIdle,
      child: Positioned(
        top: context.heightPlusStatusbarPerc(.323),
        child: Container(
          width: context.widthPx * .686,
          child: Directionality(
            textDirection: ui.TextDirection.ltr,
            child: PinCodeTextField(
              length: 6,
              animationType: AnimationType.slide,
              obsecureText: false,
              pinTheme: pinTheme,
              textStyle: pinCode,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.phone,
              animationDuration: Duration(milliseconds: 300),
              backgroundColor: Colors.transparent,
              enableActiveFill: true,
              onChanged: (code) => store.updateCode(code),
              onCompleted: (v) => ExtendedNavigator.of(context)
                  .pushNamed(Routes.onboardingProfile),
            ),
          ),
        ),
      ),
    );
  }
}

class _OnboardingPhoneSubtitle extends StatelessWidget {
  const _OnboardingPhoneSubtitle({
    Key key,
    @required this.store,
  }) : super(key: key);

  final LoginStore store;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: store.isIdle
          ? context.heightPlusStatusbarPerc(.221)
          : context.heightPlusStatusbarPerc(.29),
      child: HebrewText(
        store.isIdle
            ? LocaleKeys.onboarding_phoneSubtitle.tr()
            : LocaleKeys.onboarding_enterCode.tr(),
        style: loginSmallText,
      ),
    );
  }
}

class _OnboardingPhoneTitle extends StatelessWidget {
  const _OnboardingPhoneTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: context.heightPlusStatusbarPerc(.134),
      child: HebrewText(
        LocaleKeys.onboarding_phoneTitle.tr(),
        style: loginBigText,
      ),
    );
  }
}

class _CheckSign extends StatelessWidget {
  const _CheckSign({
    Key key,
    @required this.store,
  }) : super(key: key);

  final LoginStore store;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !store.isIdle,
      child: Positioned(
        top: context.heightPlusStatusbarPerc(.212),
        right: context.widthPx * .155,
        child: Image.asset(
          'assets/images/check.png',
          width: context.widthPx * .086,
        ),
      ),
    );
  }
}

class PhoneNumberInput extends StatefulWidget {
  final LoginStore store;

  const PhoneNumberInput({Key key, @required this.store}) : super(key: key);
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
    return AnimatedPositioned(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 700),
        top: widget.store.isIdle
            ? context.heightPlusStatusbarPerc(.272)
            : context.heightPlusStatusbarPerc(.2),
        child: Wrap(
          direction: Axis.horizontal,
          children: <Widget>[
            _buildPhone(context, inputDecor, widget.store),
            SizedBox(width: context.widthPx * .04),
            _buildPrefix(context, inputDecor, widget.store),
          ],
        ));
  }

  Widget _buildPhone(
      BuildContext context, InputDecoration inputDecor, LoginStore store) {
    return Container(
      width: context.widthPx * .29,
      child: TextField(
        focusNode: phoneFocus,
        maxLength: 7,
        textAlign: TextAlign.left,
        decoration: inputDecor,
        style: phoneNumber.copyWith(
            color: store.isIdle ? white : white.withOpacity(.4)),
        onChanged: (phone) => store.updatePhone(phone),
        keyboardType: TextInputType.phone,
      ),
    );
  }

  Widget _buildPrefix(
      BuildContext context, InputDecoration inputDecor, LoginStore store) {
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
        style: phoneNumber.copyWith(
            color: store.isIdle ? white : white.withOpacity(.4)),
        onChanged: (prefix) {
          if (prefix.length == 3) {
            prefixFocus.unfocus();
            store.updatePhonePrefix(prefix);
            FocusScope.of(context).requestFocus(phoneFocus);
          }
        },
      ),
    );
  }
}

class BlueDivider extends StatelessWidget {
  final Color color;

  const BlueDivider({Key key, this.color = darkBlueGrey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color,
      endIndent: 0,
      indent: 0,
      thickness: 1,
      height: 0,
    );
  }
}
