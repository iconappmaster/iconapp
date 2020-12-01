import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/stores/archive/archive_store.dart';
import 'package:iconapp/widgets/global/slidable/slidable.dart';
import 'package:iconapp/widgets/global/slidable/slidable_action_pane.dart';
import 'package:iconapp/widgets/global/slidable/slide_action.dart';
import '../../core/theme.dart';
import '../../data/models/conversation_model.dart';
import '../global/custom_text.dart';
import '../global/network_photo.dart';
import '../global/white_circle.dart';
import '../../core/extensions/context_ext.dart';
import 'conversation_last_message.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:iconapp/widgets/global/timeago.dart' as time;

const double _indicatorSize = 22;

class ConversationTile extends StatelessWidget {
  final Conversation conversation;
  final Function onTap;

  const ConversationTile({
    Key key,
    @required this.conversation,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      actions: [
        IconSlideAction(
          color: cornflower,
          caption: 'הסתר',
          icon: Icons.archive,
          onTap: () => sl<ArchiveStore>().archiveConversation(conversation.id),
        )
      ],
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 9.3),
        child: Material(
          color: darkIndigo2,
          child: InkWell(
            onTap: onTap,
            child: Container(
              height: 80,
              padding: EdgeInsets.only(top: 8.7, bottom: 8.7, left: 8.7),
              width: context.widthPx,
              decoration: BoxDecoration(
                boxShadow: itemShadow,
                borderRadius: BorderRadius.circular(4.8),
              ),
              child: Stack(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: 8),
                    Stack(children: [
                      WhiteCircle(
                          widget: NetworkPhoto(
                              placeHolder:
                                  'assets/images/group_placeholder.svg',
                              placeHolderPadding: 20,
                              imageUrl:
                                  conversation?.backgroundPhoto?.url ?? '',
                              height: 56,
                              width: 56)),
                      if (conversation.isSubscribed)
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(2),
                            height: 18,
                            width: 18,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: white),
                            child: Icon(
                              Icons.notifications_active,
                              color: cornflower,
                              size: 15,
                            ),
                          ),
                        )
                    ]),
                    SizedBox(width: 5.7),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: CustomText(
                              conversation.name,
                              style: nameWhite,
                              maxLines: 1,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          SizedBox(height: 4),
                          conversation?.lastMessage != null
                              ? HomeTileConversationMessage(
                                  model: conversation?.lastMessage)
                              : CustomText(LocaleKeys.home_noMessages.tr(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  style: lastWritten),
                        ],
                      ),
                    ),
                  ],
                ),
                if (conversation.lastMessage != null)
                  Positioned(
                    top: 8,
                    left: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomText(
                            time.format(
                                DateTime.fromMillisecondsSinceEpoch(
                                    conversation.lastMessage.timestamp * 1000),
                                locale: 'he'),
                            // model.lastMessage?.timestamp?.humanReadableTime() ?? '',
                            style: timeOfMessage),
                        SizedBox(height: 8.7),
                        Row(
                          children: [
                            if (conversation?.shouldShowNewBadge ?? false)
                              NewBadge(),
                            SizedBox(width: 7),
                            if (conversation?.isPinned) Pin(),
                            if (conversation.areNotificationsDisabled)
                              SvgPicture.asset(
                                'assets/images/mute.svg',
                                height: _indicatorSize,
                                width: _indicatorSize,
                              )
                          ],
                        )
                      ],
                    ),
                  ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

class Pin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: _indicatorSize,
      width: _indicatorSize,
      decoration: BoxDecoration(shape: BoxShape.circle, color: blueberry2),
      child: Center(
        child: SvgPicture.asset('assets/images/pin.svg', height: 13, width: 13),
      ),
    );
  }
}

class NewBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        height: 20.7,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(colors: [
              lightishRed,
              pinkRed,
            ])),
        child: Center(child: CustomText('חדש', style: newMessageNumber)));
  }
}
