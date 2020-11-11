import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/stores/login/login_store.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:iconapp/widgets/global/next_button.dart';
import 'package:iconapp/widgets/onboarding/base_onboarding_widget.dart';
import 'package:iconapp/widgets/onboarding/onboarding_appbar.dart';
import 'package:iconapp/widgets/onboarding/phone_number.dart';
import 'package:iconapp/widgets/onboarding/pin_code.dart';
import 'package:iconapp/widgets/onboarding/sms_counter.dart';
import '../core/extensions/context_ext.dart';
import '../generated/locale_keys.g.dart';
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
            SmsCounter(store: store),
            PinCode(store: store),
            _nextButton(store, context),
            SendAgain(store: store),
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
              message: LocaleKeys.onboarding_phone_tooShort.tr(),
            ),
          )),
    );
  }

  @override
  void dispose() {
    sl<LoginStore>().dispose();
    super.dispose();
  }
}

class SendAgain extends StatelessWidget {
  final LoginStore store;

  const SendAgain({
    Key key,
    @required this.store,
  }) : super(key: key);
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
                fontWeight: FontWeight.normal,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () async => store.sendAgain(),
            ),
          ]),
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
