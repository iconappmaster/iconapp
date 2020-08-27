import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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

    return Observer(
      builder: (_) => Container(
        height: context.heightPlusStatusbarPerc(.116),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, top: 34.0, right: 21.3),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ChatBackButton(
                  url: store.conversation?.backgroundPhoto?.url ?? ''),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    HebrewText(store?.conversation?.name ?? '',
                        style: loginBigText),
                    HebrewText('${store.conversation?.numberOfParticipants ?? 0} משתתפים',
                        style: fieldLabel), // should come from socket
                  ],
                ),
              ),
              Observer(builder: (_) {
                return InkResponse(
                  onTap: () =>
                      store.pinConversation(!store.conversation.isPinned),
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) =>
                        ScaleTransition(scale: animation, child: child),
                    child: store.conversation?.isPinned ?? false
                        ? SvgPicture.asset('assets/images/pin_purple.svg',
                            key: const Key('pinned'), height: 26, width: 26)
                        : SvgPicture.asset('assets/images/pin.svg',
                            key: const Key('unpinned'), height: 26, width: 26),
                  ),
                );
              }),
              IconButton(
                visualDensity: VisualDensity.comfortable,
                icon: SvgPicture.asset('assets/images/dots.svg',
                    height: 26, width: 26),
                onPressed: () => ExtendedNavigator.of(context)
                    .pushNamed(Routes.chatSettingsScreen),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
