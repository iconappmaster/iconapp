import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import '../../core/extensions/context_ext.dart';
import '../../core/theme.dart';
import '../global/hebrew_input_text.dart';
import 'chat_back_button.dart';

class ChatAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = sl<ChatStore>();
    final conversation = store.getState?.conversation?.conversation;
    return Container(
      height: context.heightPlusStatusbarPerc(.116),
      child: Padding(
        padding: const EdgeInsets.only(top: 34.0, right: 21.3),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ChatBackButton(url: conversation?.photo?.url ?? ''),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  HebrewText(conversation?.name ?? '', style: loginBigText),
                  HebrewText('12,000 משתתפים',
                      style: fieldLabel), // should come from socket
                ],
              ),
            ),
            IconButton(
              icon: SvgPicture.asset('assets/images/pin.svg',
                  height: 26, width: 26),
              onPressed: () {},
            ),
            IconButton(
              icon: SvgPicture.asset('assets/images/dots.svg',
                  height: 26, width: 26),
              onPressed: () => ExtendedNavigator.of(context)
                  .pushNamed(Routes.chatSettingsScreen),
            ),
          ],
        ),
      ),
    );
  }
}
