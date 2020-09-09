import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/global/network_photo.dart';

Widget getReplyBody(MessageModel message) {
  switch (message.messageType) {
    case MessageType.text:
      return TextReply(messsage: message);
    case MessageType.photo:
      return PhotoReply();
    case MessageType.video:
      return VideoReply();
    case MessageType.voice:
      return AudioReply(message: message);
    case MessageType.system:
      return Container(); // nothing to do with it
  }
  return Container();
}

/// When user slides a message this panel will pop above the text message
class ReplyComposePanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = sl<ChatStore>();

    return Observer(
      builder: (_) => AnimatedContainer(
        duration: Duration(milliseconds: 150),
        curve: Curves.bounceInOut,
        height: store.isReplyMessage ? 70 : 0,
        margin: EdgeInsets.only(left: 7, right: 7, bottom: 8, top: 8),
        decoration: BoxDecoration(
          color: paleGrey,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              child: Container(
                width: 5,
                height: 70,
                color: cornflower,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 11.0,
                      horizontal: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HebrewText(store.replayMessage?.sender?.fullName ?? '',
                            style: replayTitle),
                        SizedBox(height: 5),
                        if (store.replayMessage != null)
                          getReplyBody(store.replayMessage),
                      ],
                    ),
                  ),
                ),
                if (store.replayMessage?.messageType == MessageType.photo ||
                    store.replayMessage?.messageType == MessageType.video)
                  Container(
                    height: 50,
                    width: 50,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(4.2),
                        child: NetworkPhoto(url: store?.replayMessage?.body)),
                  ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: () => store.resetReply(),
                    child: SvgPicture.asset(
                      'assets/images/close_purple.svg',
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TextReply extends StatelessWidget {
  final MessageModel messsage;
  const TextReply({
    Key key,
    @required this.messsage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HebrewText(
      messsage?.body ?? '',
      style: replayContnet,
      textAlign: TextAlign.start,
      maxLines: 1,
    );
  }
}

class PhotoReply extends StatelessWidget {
  const PhotoReply({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/images/camera.svg',
          height: 17,
          width: 17,
        ),
        SizedBox(width: 5),
        HebrewText(
          'תמונה',
          style: replayContnet,
          padding: EdgeInsets.only(bottom: 2),
        )
      ],
    );
  }
}

class VideoReply extends StatelessWidget {
  const VideoReply({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/images/play_thumb.svg',
          height: 17,
          width: 17,
        ),
        SizedBox(width: 5),
        HebrewText(
          'סרטון',
          style: replayContnet,
          padding: EdgeInsets.only(bottom: 2),
        )
      ],
    );
  }
}

class AudioReply extends StatelessWidget {
  final MessageModel message;

  const AudioReply({
    Key key,
    @required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset('assets/images/microphone.svg', height: 17, width: 17),
        SizedBox(width: 5),
        HebrewText(
          message.extraData,
          style: replayContnet,
          padding: EdgeInsets.only(bottom: 2),
        )
      ],
    );
  }
}
