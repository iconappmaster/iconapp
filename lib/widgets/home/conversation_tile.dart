import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/stores/archive/archive_store.dart';
import 'package:iconapp/stores/language/language_store.dart';
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
    final messageDate = DateTime.fromMillisecondsSinceEpoch(
        conversation.lastMessage.timestamp * 1000);

    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      actions: [
        IconSlideAction(
          color: cornflower,
          caption: LocaleKeys.archive_slide.tr(),
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
              height: 85,
              padding: EdgeInsets.all(8.7),
              width: context.widthPx,
              decoration: BoxDecoration(
                boxShadow: itemShadow,
                borderRadius: BorderRadius.circular(4.8),
              ),
              child: Row(
                children: [
                  WhiteCircle(
                    widget: NetworkPhoto(
                        placeHolder: 'assets/images/group_placeholder.svg',
                        placeHolderPadding: 20,
                        imageUrl: conversation?.backgroundPhoto?.url ?? '',
                        height: 56,
                        width: 56),
                  ),
                  SizedBox(width: 10.7),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        conversation.name,
                        style: nameWhite,
                        maxLines: 1,
                        textAlign: language.direction == LanguageDirection.ltr
                            ? TextAlign.left
                            : TextAlign.right,
                      ),
                      SizedBox(width: 5),
                      conversation?.lastMessage != null
                          ? HomeTileConversationMessage(
                              model: conversation?.lastMessage)
                          : CustomText(
                              LocaleKeys.home_noMessages.tr(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: language.textAlign,
                              style: lastWritten,
                            ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        if ((messageDate.difference(DateTime.now()).inDays)
                                .abs() <
                            1)
                          CustomText(
                              time.format(
                                DateTime.fromMillisecondsSinceEpoch(
                                    conversation.lastMessage.timestamp * 1000),
                                locale:
                                    language.direction == LanguageDirection.ltr
                                        ? 'en'
                                        : 'he',
                              ),
                              textAlign: language.textAlign,
                              style: timeOfMessage),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            if (conversation.areNotificationsDisabled)
                              SvgPicture.asset(
                                'assets/images/mute.svg',
                                height: _indicatorSize,
                                width: _indicatorSize,
                              ),
                            if (conversation.isSubscribed)
                              RoundIcon(asset: 'assets/images/bell.svg'),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RoundIcon extends StatelessWidget {
  final String asset;

  const RoundIcon({Key key, this.asset = 'assets/images/pin.svg'})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: _indicatorSize,
      width: _indicatorSize,
      decoration: BoxDecoration(shape: BoxShape.circle, color: blueberry2),
      child: Center(
        child: SvgPicture.asset(asset, height: 13, width: 13),
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
      child: Center(
        child: CustomText(
          'חדש',
          style: newMessageNumber,
        ),
      ),
    );
  }
}
