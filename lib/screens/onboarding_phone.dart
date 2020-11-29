import 'dart:ui' as ui;
import 'package:auto_route/auto_route.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/screens/onboarding_profile.dart';
import 'package:iconapp/stores/auth/auth_store.dart';
import 'package:iconapp/stores/login/login_store.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:iconapp/widgets/global/next_button.dart';
import 'package:iconapp/widgets/onboarding/base_onboarding_widget.dart';
import 'package:iconapp/widgets/onboarding/onboarding_appbar.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../core/extensions/context_ext.dart';
import '../generated/locale_keys.g.dart';

FocusNode _pinCodeFocusNode = FocusNode();

/// [OnboardingScreen] used to verify the user with [Phone] number and
/// an [SMS] code that is being sent.
/// The store for this page is [LoginStore] that manages the [Timer], [VerifyPhone]
/// call and [VerifyCode] that returns the user with the [Token].
class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    _pinCodeFocusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final store = sl<LoginStore>();

    return BaseGradientBackground(
      child: Observer(
        builder: (_) => Stack(
          fit: StackFit.expand,
          alignment: Alignment.topCenter,
          children: <Widget>[
            IconAppbar(showBack: true),
            _OnboardingPhoneTitle(),
            _OnboardingPhoneSubtitle(store: store),
            _PhoneNumberInput(),
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

  Widget _nextButton(LoginStore store, BuildContext context) {
    return Visibility(
      visible: store.isPhoneMode,
      child: Positioned(
          top: context.heightPlusStatusbarPerc(.447),
          child: NextButton(
              enabled: store.numberValid,
              onClick: () {
                context.unFocus();
                _pinCodeFocusNode.requestFocus();
                store.verifyPhone();
              })),
    );
  }

  @override
  void dispose() {
    sl<LoginStore>().dispose();
    _pinCodeFocusNode.dispose();
    super.dispose();
  }
}

class _SendAgain extends StatelessWidget {
  final LoginStore store;

  const _SendAgain({
    Key key,
    @required this.store,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: store.isPinCodeMode,
      child: Positioned(
        top: context.heightPlusStatusbarPerc(.49),
        child: RichText(
          text: TextSpan(children: [
            TextSpan(text: 'לא קיבלתי את הקוד. ', style: loginSmallText),
            TextSpan(
              text: 'שלח שוב',
              style: smallLine.copyWith(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.normal,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  _pinCodeFocusNode = FocusNode();
                  store.sendAgain();
                },
            ),
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
        visible: store.isPinCodeMode,
        child: Positioned(
          top: context.heightPlusStatusbarPerc(.46),
          child: CustomText(
            int.tryParse(store.displayCountdown) > 0
                ? LocaleKeys.onboarding_phoneCounting
                    .tr(args: [store.displayCountdown])
                : 'הגיע?',
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
        shape: PinCodeFieldShape.box,
        disabledColor: cornflower,
        activeColor: cornflower,
        fieldWidth: 40,
        fieldHeight: 40,
        activeFillColor: Colors.transparent);

    return Visibility(
      visible: store.isPinCodeMode,
      child: Positioned(
        top: context.heightPlusStatusbarPerc(.38),
        child: Container(
          width: context.widthPx * .686,
          child: Directionality(
            textDirection: ui.TextDirection.ltr,
            child: PinCodeTextField(
              focusNode: _pinCodeFocusNode,
              appContext: context,
              autoFocus: true,
              length: 6,
              animationType: AnimationType.slide,
              pinTheme: pinTheme,
              textStyle: pinCode,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.phone,
              animationDuration: Duration(milliseconds: 300),
              backgroundColor: Colors.transparent,
              enableActiveFill: true,
              onChanged: (code) => store.updateCode(code),
              onCompleted: (v) async {
                final successFailure = await store.verifySms();
                successFailure.fold(
                  (error) => error.when(
                      serverError: () => context
                          .showFlushbar(
                              message: LocaleKeys.general_server_error)
                          .tr(),
                      wrongCode: () => context.showFlushbar(
                          message: LocaleKeys.onboarding_wrongCode.tr())),
                  (success) => success.when(
                    navigateHome: () {
                      sl<AuthStore>()
                        ..setSignedIn()
                        ..validateAuthState();

                      ExtendedNavigator.of(context).pushAndRemoveUntil(
                          Routes.mainNavigator, (route) => false);
                    },
                    navigateProfile: () => ExtendedNavigator.of(context)
                        .pushOnboardingProfile(mode: OnboardingMode.onboarding),
                  ),
                );
              },
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
      top: store.isPhoneMode
          ? context.heightPlusStatusbarPerc(.21)
          : context.heightPlusStatusbarPerc(.335),
      child: CustomText(
        store.isPhoneMode
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
      child: CustomText(
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
      visible: store.isPinCodeMode,
      child: Positioned(
        top: context.heightPlusStatusbarPerc(.21),
        right: context.widthPx * .36,
        child: Stack(children: [
          if (store.getState.loading)
            SizedBox(
                height: context.widthPx * .086,
                width: context.widthPx * .086,
                child: CircularProgressIndicator(
                    backgroundColor: white, strokeWidth: 2)),
          Image.asset(
            'assets/images/check.png',
            width: context.widthPx * .086,
            height: context.widthPx * .086,
          ),
        ]),
      ),
    );
  }
}

class _PhoneNumberInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = sl<LoginStore>();

    return AnimatedPositioned(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 700),
        top: store.isPhoneMode
            ? context.heightPlusStatusbarPerc(.272)
            : context.heightPlusStatusbarPerc(.2),
        child: Column(
          children: <Widget>[
            CountryCodePicker(
              onChanged: (countryCode) =>
                  store.updateCountryCode(countryCode.dialCode),
              initialSelection: 'IL',
              favorite: ['+972', 'IL'],
              showCountryOnly: true,
              showFlag: true,
              textStyle: phoneNumber,
              showOnlyCountryWhenClosed: false,
              alignLeft: false,
              hideMainText: true,
              onInit: (countryCode) =>
                  store.updateCountryCode(countryCode.dialCode),
            ),
            SizedBox(width: context.widthPx * .08),
            _buildPhone(context, store),
          ],
        ));
  }

  Widget _buildPhone(BuildContext context, LoginStore store) {
    return SizedBox(
        width: context.widthPx * .7,
        child: TextField(
            autofocus: true,
            style: phoneNumber.copyWith(decoration: TextDecoration.none),
            maxLength: 12,
            textAlign: TextAlign.center,
            onChanged: (phone) => store.updatePhone(phone),
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                hintText: 'לדוגמא: 054-1122244',
                hintStyle: phoneNumber.copyWith(
                    color: whiteOpacity50, decoration: TextDecoration.none),
                counterText: '',
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.transparent,
                )))));
  }
}
