import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/screens/onboarding_profile.dart';
import 'package:iconapp/stores/auth/auth_store.dart';
import 'package:iconapp/stores/login/login_store.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:ui' as ui;
import '../../core/extensions/context_ext.dart';
import 'package:easy_localization/easy_localization.dart';


class PinCode extends StatelessWidget {
  final LoginStore store;

  const PinCode({
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
        top: context.heightPlusStatusbarPerc(.333),
        child: Container(
          width: context.widthPx * .686,
          child: Directionality(
            textDirection: ui.TextDirection.ltr,
            child: PinCodeTextField(
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