import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/helpers/tutorial.dart';
import 'package:iconapp/screens/chat_screen.dart';
import 'package:iconapp/widgets/comments/comments_appbar_icon.dart';
import 'package:iconapp/widgets/global/report_dialog.dart';
import 'chat_back_button.dart';
import '../../core/dependencies/locator.dart';
import '../../routes/router.gr.dart';
import '../../stores/chat/chat_store.dart';
import '../../core/extensions/context_ext.dart';
import '../../core/theme.dart';
import '../global/custom_text.dart';

class ChatAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = sl<ChatStore>();

    return Observer(
      builder: (_) => Container(
        height: context.heightPlusStatusbarPerc(.1),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, top: 34.0, right: 8.3),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ChatBackButton(
                  url: store.conversation?.backgroundPhoto?.url ?? ''),
              SizedBox(width: 8),
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => _openChatSettings(store, context),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CustomText(store?.conversation?.name ?? '',
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          style: loginBigText),
                      CustomText(
                          '${store.conversation?.users?.length ?? 0} אייקונים, ${store.conversation?.numberOfParticipants ?? 0} עוקבים',
                          style: fieldLabel), // should come from socket
                    ],
                  ),
                ),
              ),
              SizedBox(width: 8),
              ReportButton(),
              SizedBox(width: 10),
              if (store.conversation.userRole != UserRole.viewer)
                CommentsAppBarIcon(onTap: () => showCommentsDialog(context)),
              SizedBox(width: 8),
              Observer(builder: (_) {
                final pinSize = 30.0;
                return InkResponse(
                  onTap: store.dataReady
                      ? () =>
                          store.pinConversation(!store.conversation.isPinned)
                      : () {},
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) =>
                        ScaleTransition(scale: animation, child: child),
                    child: store.conversation?.isPinned ?? false
                        ? SvgPicture.asset('assets/images/pin_purple.svg',
                            color:
                                store.dataReady ? cornflower : Colors.grey[500],
                            key: const Key('pinned'),
                            height: pinSize,
                            width: pinSize)
                        : SvgPicture.asset('assets/images/pin.svg',
                            color: store.dataReady ? white : Colors.grey[500],
                            key: const Key('unpinned'),
                            height: pinSize,
                            width: pinSize),
                  ),
                );
              }),
              SizedBox(width: 6),
              IconButton(
                key: menuKey,
                visualDensity: VisualDensity.comfortable,
                icon: SvgPicture.asset(
                  'assets/images/dots.svg',
                  height: 26,
                  width: 26,
                  color: store.dataReady ? white : Colors.grey[400],
                ),
                onPressed: _openChatSettings(store, context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Function _openChatSettings(ChatStore store, BuildContext context) {
    return store.dataReady
        ? () => ExtendedNavigator.of(context).pushChatSettingsScreen()
        : null;
  }
}

class ReportButton extends StatelessWidget {
  const ReportButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => _showReportBottomSheet(context),
        child: Icon(Icons.flag, color: white));
  }
}

Future _showReportBottomSheet(BuildContext context) async {
  showModalBottomSheet(
    context: context,
    builder: (_) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Directionality(
            textDirection: TextDirection.ltr,
            child: Text(
              'Report/Block Abusive Content',
              style: settingsAppbarTitle.copyWith(
                  fontSize: 20, color: Colors.black),
            ),
          ),
          ListTile(
              title: Directionality(
                textDirection: TextDirection.ltr,
                child: Text(
                  'Report Abuse',
                  style: settingsButton.copyWith(
                      fontSize: 18, color: Colors.black),
                ),
              ),
              onTap: () async {
                await showDialog(
                    context: context,
                     builder: (_) => ReportUserDialog(
                      mode: ReportMode.abuse,
                    ));
                await Navigator.pop(context);
              }),
          ListTile(
              onTap: () async {
                await showDialog(
                    context: context,
                     builder: (_) => ReportUserDialog(
                      mode: ReportMode.block,
                    ));
                await Navigator.pop(context);
                await Navigator.pop(context);
                context.showToast('Conversation blocked');
              },
              title: Directionality(
                textDirection: TextDirection.ltr,
                child: Text(
                  'Block content',
                  style: settingsButton.copyWith(
                      fontSize: 18, color: Colors.black),
                ),
              )),
        ],
      );
    },
  );
}
