import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../core/dependencies/locator.dart';
import '../core/theme.dart';
import '../data/models/conversation_model.dart';
import '../generated/locale_keys.g.dart';
import '../stores/home/home_store.dart';
import '../widgets/create/create_app_bar.dart';
import '../widgets/global/cupertino_loader.dart';
import '../widgets/global/custom_text.dart';
import '../widgets/onboarding/base_onboarding_widget.dart';
import '../routes/router.gr.dart';
import '../core/extensions/context_ext.dart';
import 'package:easy_localization/easy_localization.dart';

const codeDigits = 6;

class LockScreen extends StatefulWidget {
  final Conversation conversation;
  const LockScreen({Key key, @required this.conversation}) : super(key: key);

  @override
  _LockScreenState createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  final store = sl<HomeStore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseGradientBackground(
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            AppBarWithDivider(
              title: LocaleKeys.lock_title.tr(),
              subtitle: LocaleKeys.lock_subtitle.tr(),
            ),
            Center(
              child: Observer(
                builder: (_) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    store.isLoading ? CupertinoLoader() : Icon(Icons.lock, color: cornflower, size: 60),
                    SizedBox(height: 28),
                    CustomText(
                      LocaleKeys.lock_content.tr(),
                      style: addParticipent.copyWith(color: cornflower),
                    ),
                    SizedBox(height: 38),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 48.0),
                        child: PinCodeTextField(
                          appContext: context,
                          obscureText: true,
                          autoFocus: true,
                          length: codeDigits,
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
                    LockSendButton(store: store, conversation: widget.conversation),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    store.setConversationCode('');
    super.dispose();
  }
}

class LockSendButton extends StatelessWidget {
  const LockSendButton({
    Key key,
    @required this.store,
    @required this.conversation,
  }) : super(key: key);

  final HomeStore store;
  final Conversation conversation;

  @override
  Widget build(BuildContext context) {
    final home = sl<HomeStore>();
    return Observer(builder: (_) {
      return MaterialButton(
          color: home.conversationCode.length == codeDigits
              ? cornflower
              : cornflower.withOpacity(
                  .5,
                ),
          onPressed: () async {
            if (store.conversationCode?.length == 6) {
              if (await store.verifyConversationCode(conversation.id)) {
                ExtendedNavigator.of(context)
                  ..pushChatScreen(conversation: conversation)
                  ..pop();
              } else {
                context.showToast(LocaleKeys.lock_wrongCode.tr());
              }
            }
          },
          child: CustomText(LocaleKeys.general_send.tr(),
              style: systemMessage.copyWith(
                  color: white.withOpacity(
                .9,
              ))));
    });
  }
}
