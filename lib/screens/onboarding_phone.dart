import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/screens/onboarding_profile.dart';
import 'package:iconapp/stores/auth/auth_store.dart';
import 'package:iconapp/stores/login/login_store.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/global/next_button.dart';
import 'package:iconapp/widgets/onboarding/base_onboarding_widget.dart';
import 'package:iconapp/widgets/onboarding/onboarding_appbar.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../core/extensions/context_ext.dart';
import '../generated/locale_keys.g.dart';
import 'dart:ui' as ui;
import 'package:easy_localization/easy_localization.dart';

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

  Widget _nextButton(LoginStore store, BuildContext context) {
    return Visibility(
      visible: store.isPhoneMode,
      child: Positioned(
          top: context.heightPlusStatusbarPerc(.447),
          child: NextButton(
            enabled: store.numberValid,
            onClick: () {
              context.unFocus();
              store.verifyPhone();
            },
            onError: () => context.showFlushbar(
                message: LocaleKeys.onboarding_phone_tooShort.tr()),
          )),
    );
  }

  @override
  void dispose() {
    sl<LoginStore>().dispose();
    super.dispose();
  }
}

class _SendAgain extends StatelessWidget {
  final LoginStore store;

  const _SendAgain({Key key, @required this.store}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: store.isPinCodeMode,
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
        visible: store.isPinCodeMode,
        child: Positioned(
          top: context.heightPlusStatusbarPerc(.408),
          child: CustomText(
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
  Widget build(BuildContext ctx) {
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
      visible: store.isPinCodeMode,
      child: Positioned(
        top: ctx.heightPlusStatusbarPerc(.323),
        child: Container(
          width: ctx.widthPx * .686,
          child: Directionality(
            textDirection: ui.TextDirection.ltr,
            child: PinCodeTextField(
              appContext: ctx,
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
                      serverError: () => ctx
                          .showFlushbar(
                              message: LocaleKeys.general_server_error)
                          .tr(),
                      wrongCode: () => ctx.showFlushbar(
                          message: LocaleKeys.onboarding_wrongCode.tr())),
                  (success) => success.when(
                    navigateHome: () {
                      sl<AuthStore>()
                        ..setSignedIn()
                        ..checkCurrentAuthState();
                      ExtendedNavigator.of(ctx).pushAndRemoveUntil(
                          Routes.mainNavigator, (route) => false);
                    },
                    navigateProfile: () => ExtendedNavigator.of(ctx)
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
          ? context.heightPlusStatusbarPerc(.221)
          : context.heightPlusStatusbarPerc(.29),
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
        top: context.heightPlusStatusbarPerc(.212),
        right: context.widthPx * .06,
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

class PhoneNumberInput extends StatefulWidget {
  final LoginStore store;

  const PhoneNumberInput({Key key, @required this.store}) : super(key: key);
  @override
  _PhoneNumberInputState createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  final prefixController = TextEditingController(text: '05');
  final _countryCodeController = TextEditingController(text: '972');
  final phoneFocus = FocusNode();
  final prefixFocus = FocusNode();
  final countryCodeFocus = FocusNode();

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
        top: widget.store.isPhoneMode
            ? context.heightPlusStatusbarPerc(.272)
            : context.heightPlusStatusbarPerc(.2),
        child: Wrap(
          direction: Axis.horizontal,
          children: <Widget>[
            _buildPhone(context, inputDecor, widget.store),
            SizedBox(width: context.widthPx * .04),
            _buildPrefix(context, inputDecor, widget.store),
            SizedBox(width: context.widthPx * .04),
            _countryCode(context, inputDecor, widget.store),
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
        textAlign: TextAlign.center,
        decoration: inputDecor,
        style: phoneNumber.copyWith(
            color: store.isPhoneMode ? white : white.withOpacity(.4)),
        onChanged: (phone) => store.updatePhone(phone),
        keyboardType: TextInputType.phone,
      ),
    );
  }

  Widget _buildPrefix(
    BuildContext context,
    InputDecoration inputDecor,
    LoginStore store,
  ) {
    return Container(
      width: context.widthPx * .155,
      child: TextField(
        focusNode: prefixFocus,
        autofocus: true,
        keyboardType: TextInputType.phone,
        textAlign: TextAlign.center,
        controller: prefixController,
        maxLength: 3,
        maxLengthEnforced: true,
        decoration: inputDecor,
        style: phoneNumber.copyWith(
            color: store.isPhoneMode ? white : white.withOpacity(.4)),
        onChanged: (prefix) {
          store.updatePhonePrefix(prefix);
          if (prefix.length == 3) {
            prefixFocus.unfocus();
            FocusScope.of(context).requestFocus(phoneFocus);
          }
        },
      ),
    );
  }

  Widget _countryCode(
      BuildContext context, InputDecoration inputDecor, LoginStore store) {
    final style = phoneNumber.copyWith(
        color: store.isPhoneMode ? white : white.withOpacity(.4));
    return Container(
      width: context.widthPx * .155,
      child: Directionality(
        textDirection: ui.TextDirection.ltr,
        child: TextField(
          focusNode: countryCodeFocus,
          autofocus: false,
          keyboardType: TextInputType.phone,
          textAlign: TextAlign.center,
          maxLength: 3,
          controller: _countryCodeController,
          maxLengthEnforced: true,
          decoration: inputDecor.copyWith(prefixText: '+', prefixStyle: style),
          style: style,
          onChanged: (countryCode) {
              store.updateCountryCode(countryCode);
            if (countryCode.length == 3) {
              prefixFocus.unfocus();
              FocusScope.of(context).requestFocus(prefixFocus);
            }
          },
        ),
      ),
    );
  }
}
