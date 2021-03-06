import 'dart:ui' as ui;
import 'package:auto_route/auto_route.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/hooks/timer_hook.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/screens/onboarding_profile.dart';
import 'package:iconapp/stores/auth/auth_store.dart';
import 'package:iconapp/stores/home/home_store.dart';
import 'package:iconapp/stores/language/language_store.dart';
import 'package:iconapp/stores/login/login_store.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:iconapp/widgets/global/langauge_switch.dart';
import 'package:iconapp/widgets/global/next_button.dart';
import 'package:iconapp/widgets/onboarding/base_onboarding_widget.dart';
import 'package:iconapp/widgets/onboarding/onboarding_appbar.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import '../core/extensions/context_ext.dart';
import '../generated/locale_keys.g.dart';

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

FocusNode _pinCodeFocusNode = FocusNode();

/// [OnboardingScreen] used to verify the user with [Phone] number and
/// an [SMS] code that is being sent.
/// The store for this page is [LoginStore] that manages the [Timer], [VerifyPhone]
/// call and [VerifyCode] that returns the user with the [Token].
class OnboardingScreen extends HookWidget {
  final store = sl<LoginStore>();

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      _pinCodeFocusNode = FocusNode();
      return _dispose;
    }, const []);

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
            Positioned(
              top: context.heightPlusStatusbarPerc(.02),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80.0),
                child: LanguageSwitch(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _dispose() {
    sl<LoginStore>().dispose();
    _pinCodeFocusNode.dispose();
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
            TextSpan(text: LocaleKeys.onboarding_sendAgainTitle.tr(), style: loginSmallText),
            TextSpan(
              text: LocaleKeys.onboarding_sendAgain.tr(),
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

class _SmsCounter extends HookWidget {
  final LoginStore store;

  const _SmsCounter({
    Key key,
    @required this.store,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int time = 0;

    if (store.isPinCodeMode) {
      time = useCountDown(defaultCountTimeSec);
    }

    return Observer(
      builder: (_) {
        return Visibility(
          visible: store.isPinCodeMode,
          child: Positioned(
            top: context.heightPlusStatusbarPerc(.46),
            child: CustomText(
              time == 0
                  ? LocaleKeys.onboarding_didCodeSent.tr()
                  : LocaleKeys.onboarding_phoneCounting.tr(
                      args: [
                        time.toString(),
                      ],
                    ),
              style: loginSmallText,
            ),
          ),
        );
      },
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
                      serverError: () => context.showFlushbar(message: LocaleKeys.general_server_error).tr(),
                      wrongCode: () => context.showFlushbar(message: LocaleKeys.onboarding_wrongCode.tr())),
                  (success) => success.when(
                    navigateHome: () async {
                      await sl<HomeStore>().getConversations();
                      sl<AuthStore>()
                        ..setSignedIn()
                        ..validateAuthState();

                      ExtendedNavigator.of(context).pushAndRemoveUntil(Routes.mainNavigator, (route) => false);
                    },
                    navigateProfile: () =>
                        ExtendedNavigator.of(context).pushOnboardingProfile(mode: OnboardingMode.onboarding),
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
      top: store.isPhoneMode ? context.heightPlusStatusbarPerc(.21) : context.heightPlusStatusbarPerc(.335),
      child: CustomText(
        store.isPhoneMode ? LocaleKeys.onboarding_phoneSubtitle.tr() : LocaleKeys.onboarding_enterCode.tr(),
        textDirection: language.textDirection,
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
        textDirection: language.textDirection,
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
    final size = 35.0;
    return Visibility(
      visible: store.isPinCodeMode,
      child: Positioned(
        top: context.heightPlusStatusbarPerc(.268),
        right: context.widthPx * .24,
        child: Stack(children: [
          if (store.getState.loading)
            SizedBox(
              height: size,
              width: size,
              child: CircularProgressIndicator(
                backgroundColor: white,
                strokeWidth: 1,
              ),
            ),
          Image.asset(
            'assets/images/check.png',
            width: size,
            height: size,
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
        top: store.isPhoneMode ? context.heightPlusStatusbarPerc(.272) : context.heightPlusStatusbarPerc(.2),
        child: Column(
          children: <Widget>[
            CountryCodePicker(
                onChanged: (countryCode) => store.updateCountryCode(countryCode.dialCode),
                initialSelection: 'IL',
                favorite: ['+972', 'IL'],
                showCountryOnly: true,
                showFlag: true,
                textStyle: phoneNumber,
                showOnlyCountryWhenClosed: false,
                alignLeft: false,
                hideMainText: true,
                onInit: (countryCode) => store.updateCountryCode(countryCode.dialCode)),
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
            hintText: LocaleKeys.onboarding_phoneNumberHint.tr(),
            hintStyle: phoneNumber.copyWith(color: whiteOpacity50, decoration: TextDecoration.none),
            counterText: '',
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent))),
      ),
    );
  }
}
