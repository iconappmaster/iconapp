import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/stores/home/home_store.dart';
import 'package:iconapp/widgets/create/create_app_bar.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:iconapp/widgets/onboarding/base_onboarding_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../routes/router.gr.dart';

class ConversationCodeScreen extends StatelessWidget {
  final Conversation conversation;
  const ConversationCodeScreen({Key key, @required this.conversation})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final store = sl<HomeStore>();
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
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.lock, color: cornflower, size: 60),
                  SizedBox(height: 28),
                  CustomText(
                    'Please enter your personal code',
                    style: addParticipent.copyWith(
                      color: cornflower,
                    ),
                  ),
                  SizedBox(height: 38),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48.0),
                      child: PinCodeTextField(
                        appContext: context,
                        obscureText: true,
                        autoFocus: true,
                        length: 6,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                            borderWidth: .4,
                            inactiveColor: cornflower,
                            selectedColor: Colors.transparent,
                            selectedFillColor: cornflower,
                            inactiveFillColor: Colors.transparent,
                            shape: PinCodeFieldShape.box,
                            disabledColor: cornflower,
                            activeColor: cornflower,
                            fieldWidth: 33,
                            fieldHeight: 33,
                            activeFillColor: Colors.transparent),
                        textStyle: pinCode,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.phone,
                        animationDuration: const Duration(milliseconds: 300),
                        backgroundColor: Colors.transparent,
                        enableActiveFill: true,
                        onChanged: (code) => store.setConversationCode(code),
                      )),
                  SizedBox(height: 28),
                  MaterialButton(
                    color: cornflower,
                    onPressed: () async {
                      await store.verifyConversationCode(conversation.id);
                      ExtendedNavigator.of(context)
                        ..pushChatScreen(conversation: conversation)
                        ..pop();
                    },
                    child: CustomText(
                      'SEND',
                      style:
                          systemMessage.copyWith(color: white.withOpacity(.9)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
