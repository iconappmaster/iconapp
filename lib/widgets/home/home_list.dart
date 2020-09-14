import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/stores/home/home_store.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/global/lottie_loader.dart';
import 'package:iconapp/widgets/global/network_photo.dart';
import 'package:iconapp/widgets/global/white_circle.dart';
import '../../core/extensions/context_ext.dart';
import '../../core/extensions/int_ext.dart';

const double _indicatorSize = 27;

class ConversationsList extends StatelessWidget {
  final Function(Conversation) onConversationTap;
  final ScrollController controller;

  const ConversationsList(
      {Key key, @required this.onConversationTap, this.controller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final store = sl<HomeStore>();
    return Observer(
      builder: (_) => Positioned(
        top: context.heightPlusStatusbarPerc(.12),
        child: Container(
          height: context.heightPx - context.heightPlusStatusbarPerc(.11),
          width: context.widthPx,
          child: store.isLoading && store.conversations.length == 0
              ? Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: LottieLoader(),
                  ))
              : ListView.builder(
                  controller: controller,
                  itemCount: store.conversations.length,
                  padding: EdgeInsets.only(
                      bottom: context.heightPlusStatusbarPerc(.2),
                      top: context.heightPlusStatusbarPerc(.07)),
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final conversation = store.conversations[index];
                    return ConversationTile(
                      model: conversation,
                      onTap: () => onConversationTap(conversation),
                    );
                  },
                ),
        ),
      ),
    );
  }
}

class ConversationTile extends StatelessWidget {
  final Conversation model;
  final Function onTap;

  const ConversationTile({
    Key key,
    this.model,
    @required this.onTap,
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
            onTap: onTap,
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
                        child: HebrewText(model.name,
                            style: nameWhite,
                            maxLines: 1,
                            textAlign: TextAlign.start),
                      ),
                      SizedBox(height: 4),
                      model?.lastMessage != null
                          ? HomeTileLastMessage(model: model?.lastMessage)
                          : HebrewText('אין הודעות',
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
                  HebrewText(
                      model.lastMessage?.timestamp?.humanReadableTime() ?? '',
                      style: timeOfMessage),
                  SizedBox(height: 8.7),
                  Row(
                    children: [
                      _MessageCounter(count: model.numberOfUnreadMessages),
                      SizedBox(width: 7),
                      if (model?.isPinned) _Pin(),
                      if (!model.areNotificationsEnabled)
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

class HomeTileLastMessage extends StatelessWidget {
  final MessageModel model;

  const HomeTileLastMessage({Key key, @required this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * .55),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (model?.sender?.fullName != null)
            HebrewText('${model?.sender?.fullName ?? ''}:',
                overflow: TextOverflow.fade,
                textAlign: TextAlign.start,
                style: lastWritten),

          SizedBox(width: 3),

          // if we have text
          if (model?.messageType == MessageType.text)
            Flexible(
              child: HebrewText(model?.body ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  style: lastWritten),
            ),

          if (model?.messageType != MessageType.text &&
              model?.messageType != MessageType.system)
            SvgPicture.asset(getImageType() ?? '', height: 20, width: 20),

          SizedBox(width: 5),

          HebrewText(getTextType() ?? '',
              overflow: TextOverflow.fade,
              textAlign: TextAlign.start,
              style: lastWritten),
        ],
      ),
    );
  }

  String getImageType() {
    switch (model?.messageType) {
      case MessageType.photo:
        return 'assets/images/camera.svg';
      case MessageType.video:
        return 'assets/images/play_thumb.svg';
      case MessageType.voice:
        return 'assets/images/microphone.svg';
      case MessageType.system:
        return null;
      case MessageType.text:
        return null;
    }

    return null;
  }

  String getTextType() {
    switch (model?.messageType) {
      case MessageType.photo:
        return 'תמונה';
      case MessageType.video:
        return 'וידאו';
      case MessageType.voice:
        return 'הקלטה';
      case MessageType.system:
        return '';
      case MessageType.text:
        return '';
    }

    return null;
  }

  String formatLastMessage(MessageModel msg) {
    String result = '';
    if (msg?.sender == null)
      result = 'קבוצה חדשה';
    else
      result = model.body?.startsWith('http') ?? false
          ? 'מדיה'
          : '${model.sender?.fullName}: ${model.body ?? ''}';

    return result;
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
                child: HebrewText(count.toString(), style: newMessageNumber)))
        : Container();
  }
}
