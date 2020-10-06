import 'package:flutter/material.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/widgets/global/base_dialog.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/global/next_button.dart';
import '../../core/extensions/context_ext.dart';
import 'package:easy_localization/easy_localization.dart';

class ChatWelcomeDialog extends StatelessWidget {
  final String groupName;

  const ChatWelcomeDialog({
    Key key,
    @required this.groupName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      height: context.heightPlusStatusbarPerc(.5),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Positioned(
              top: 14.3,
              child: CustomText(
                  LocaleKeys.chat_welcomeTitle.tr(args: [groupName]),
                  style: dialogTitle)),
          Positioned(
              top: 48,
              child: Container(
                height: context.heightPlusStatusbarPerc(.28),
                width: context.widthPx * .66,
                child: SingleChildScrollView(
                  child: CustomText(LocaleKeys.chat_welcomeContent.tr(),
                      style: dialogContent, textAlign: TextAlign.start),
                ),
              )),
          Padding(
            padding: EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: NextButton(
                  height: 44,
                  title: LocaleKeys.action_close.tr(),
                  onClick: () => sl<ChatStore>().setWelcomeDialogSeen()),
            ),
          )
        ],
      ),
    );
  }
}
