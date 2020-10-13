import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import '../../core/theme.dart';
import '../../data/models/conversation_model.dart';
import '../global/custom_text.dart';
import '../global/network_photo.dart';
import '../global/white_circle.dart';
import '../../core/extensions/context_ext.dart';
import 'conversation_last_message.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:iconapp/widgets/global/timeago.dart' as time;

const double _indicatorSize = 27;

class ConversationTile extends StatelessWidget {
  final Conversation model;

  const ConversationTile({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 81.7,
      padding: EdgeInsets.only(top: 8.7, bottom: 8.7, right: 8.7, left: 15.7),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 9.3),
      width: context.widthPx,
      decoration: BoxDecoration(
        boxShadow: itemShadow,
        borderRadius: BorderRadius.circular(4.8),
        color: darkIndigo2,
      ),
      child: Material(
        color: Colors.transparent,
        child: Stack(children: [
          InkWell(
            splashColor: cornflower,
            // onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                WhiteCircle(
                    widget: NetworkPhoto(
                        placeHolder: 'assets/images/group_placeholder.svg',
                        placeHolderPadding: 20,
                        url: model?.backgroundPhoto?.url ?? '',
                        height: 56,
                        width: 56)),
                SizedBox(width: 10.7),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: CustomText(model.name,
                            style: nameWhite,
                            maxLines: 1,
                            textAlign: TextAlign.start),
                      ),
                      SizedBox(height: 4),
                      model?.lastMessage != null
                          ? HomeTileConversationMessage(
                              model: model?.lastMessage)
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
          ),
          if (model.lastMessage != null)
            Positioned(
              top: 3,
              left: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomText(
                      time.format(
                          DateTime.fromMillisecondsSinceEpoch(
                              model.lastMessage.timestamp * 1000),
                          locale: 'he'),
                      // model.lastMessage?.timestamp?.humanReadableTime() ?? '',
                      style: timeOfMessage),
                  SizedBox(height: 8.7),
                  Row(
                    children: [
                      _MessageCounter(count: model.numberOfUnreadMessages),
                      SizedBox(width: 7),
                      if (model?.isPinned) _Pin(),
                      if (model.areNotificationsDisabled)
                        SvgPicture.asset('assets/images/mute.svg',
                            height: _indicatorSize, width: _indicatorSize)
                    ],
                  )
                ],
              ),
            ),
        ]),
      ),
    );
  }
}

class _Pin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: _indicatorSize,
      width: _indicatorSize,
      decoration: BoxDecoration(shape: BoxShape.circle, color: blueberry2),
      child: Center(
        child: SvgPicture.asset('assets/images/pin.svg', height: 16, width: 16),
      ),
    );
  }
}

class _MessageCounter extends StatelessWidget {
  final int count;
  const _MessageCounter({
    Key key,
    @required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return count > 0
        ? Container(
            height: 20.7,
            width: 20.7,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  lightishRed,
                  pinkRed,
                ],
              ),
            ),
            child: Center(
                child: CustomText(count.toString(), style: newMessageNumber)))
        : Container();
  }
}
