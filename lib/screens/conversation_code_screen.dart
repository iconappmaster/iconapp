import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/widgets/create/create_app_bar.dart';
import 'package:iconapp/widgets/onboarding/base_onboarding_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'onboarding_phone.dart';

class ConversationCodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseGradientBackground(
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            AppBarWithDivider(
              title: 'Enter Conversation',
              subtitle: 'type the code to enter',
            ),
            Positioned(
                top: MediaQuery.of(context).size.height * .25,
                child: Icon(
                  Icons.lock,
                  color: white,
                  size: 60,
                )),
            Positioned(
              top: MediaQuery.of(context).size.height * .35,
              child: PinCodeTextField(
                appContext: context,
                obscureText: true,
                autoFocus: true,
                length: 4,
                animationType: AnimationType.fade,
                pinTheme: pinTheme,
                textStyle: pinCode,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.phone,
                animationDuration: const Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
                onChanged: (code) => print(code),
                onCompleted: (v) async {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
