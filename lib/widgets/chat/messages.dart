// MESSAGE TYPES
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/data/models/photo_model.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/global/network_photo.dart';

class SystemMessage extends StatelessWidget {
  final String title;

  const SystemMessage({Key key, @required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
        height: 20,
        child: Center(child: HebrewText(title, style: systemMessage)),
      ),
    );
  }
}

class VoiceMessage extends StatelessWidget {
  final MessageModel message;
  final bool isMe;

  const VoiceMessage({
    Key key,
    @required this.message,
    @required this.isMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: isMe ? 0 : 100, right: isMe ? 100 : 0),
      child: IconBubble(
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            HebrewText(
              message.sender.fullName,
              style: newMessageNumber,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: Slider(
                      value: .4,
                      onChanged: (v) => print(v),
                      inactiveColor: white,
                      activeColor: cornflower,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: 40,
                  child: FloatingActionButton(
                      elevation: 0,
                      backgroundColor: white,
                      child: SvgPicture.asset(
                        'assets/images/play.svg',
                        height: 12.7,
                        width: 12.7,
                      ),
                      onPressed: () {}),
                ),
              ],
            ),
          ],
        ),
        message: message,
        isMe: isMe,
      ),
    );
  }
}

class PhotoMessage extends StatelessWidget {
  final MessageModel message;
  final bool isMe;

  const PhotoMessage({
    Key key,
    @required this.message,
    @required this.isMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = sl<ChatStore>();
    return Container(
      margin: EdgeInsets.only(right: isMe ? 50 : 0, left: isMe ? 0 : 50),
      child: Opacity(
        opacity: message.status == MessageStatus.pending ? .8 : 1,
        child: IconBubble(
          onDoubleTap: () async => await store.likeMessage(message),
          isMe: isMe,
          message: message,
          onTap: () => ExtendedNavigator.of(context).pushNamed(
              Routes.fullImageScreen,
              arguments: FullImageScreenArguments(
                  photo: PhotoModel(url: message?.body ?? ''))),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            HebrewText(message.sender?.fullName ?? '',
                style: chatMessageName, textAlign: TextAlign.start),
            SizedBox(height: 5),
            message.body.startsWith('http')
                ? AspectRatio(
                    aspectRatio: 1,
                    child: NetworkPhoto(url: message.body),
                  )
                : AspectRatio(
                    aspectRatio: 1,
                    child: Image.file(
                      File(message.body),
                      fit: BoxFit.cover,
                    ),
                  ),
          ]),
        ),
      ),
    );
  }
}

class VideoMessage extends StatelessWidget {
  final MessageModel message;
  // final Animation<double> animation;
  final bool isMe;

  const VideoMessage({
    Key key,
    @required this.message,
    // @required this.animation,
    @required this.isMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = sl<ChatStore>();
    return Container(
      key: Key(message.id.toString()),
      constraints: BoxConstraints(maxHeight: 225),
      child: IconBubble(
        onDoubleTap: () async => await store.likeMessage(message),
        isMe: isMe,
        message: message,
        onTap: () => ExtendedNavigator.of(context).pushNamed(
            Routes.fullVideoScreen,
            arguments: FullVideoScreenArguments(url: message?.body ?? '')),
        child: Stack(
          alignment: Alignment.center,
          children: [
            message.body.startsWith('http')
                ? NetworkPhoto(url: message?.extraData ?? '')
                : Image.file(File(message?.extraData ?? '')),
            SvgPicture.asset(
              'assets/images/play_button.svg',
              height: 56,
              width: 56,
            ),
          ],
        ),
      ),
    );
  }
}

class TextMessage extends StatelessWidget {
  final MessageModel message;
  final bool isMe;
  const TextMessage({
    Key key,
    @required this.message,
    @required this.isMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = message.status == MessageStatus.pending
        ? blueBerry
        : isMe ? cornflower : darkIndigo2;
    return Stack(
      children: [
        IconBubble(
          message: message,
          isMe: isMe,
          onDoubleTap: () async => await sl<ChatStore>().likeMessage(message),
          child: Container(
            color: color,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                HebrewText(message.sender?.fullName ?? '',
                    style: chatMessageName, textAlign: TextAlign.start),
                HebrewText(message.body,
                    style: chatMessageBody, textAlign: TextAlign.start),
              ],
            ),
          ),
        ),
        // if (message.likeCount > 0)
      ],
      // ),
    );
  }
}

class LikeBubble extends StatelessWidget {
  final bool isLiked;
  final int likeNumber;

  const LikeBubble({
    Key key,
    @required this.isLiked,
    @required this.likeNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      height: 19,
      decoration: BoxDecoration(
        color: blueberry3,
        borderRadius: BorderRadius.circular(13.3),
      ),
      child: Container(
        height: 16,
        padding: EdgeInsets.all(4),
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: cornflower,
          borderRadius: BorderRadius.circular(13.3),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
                isLiked
                    ? 'assets/images/like_red.svg'
                    : 'assets/images/like.svg',
                height: 12,
                width: 12),
            HebrewText(likeNumber.toString(), style: likeStyle)
          ],
        ),
      ),
    );
  }
}

class IconBubble extends StatelessWidget {
  final Widget child;
  final Function onTap;
  final Function onDoubleTap;
  final BubbleEdges padding;
  final bool isMe;
  final MessageModel message;

  const IconBubble({
    Key key,
    @required this.child,
    @required this.message,
    @required this.isMe,
    this.onTap,
    this.onDoubleTap,
    this.padding,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final color = message.status == MessageStatus.pending
        ? blueBerry
        : isMe ? cornflower : darkIndigo2;
    return GestureDetector(
      onDoubleTap: onDoubleTap,
      onTap: onTap,
      child: Stack(children: [
        Bubble(
          elevation: 3,
          stick: true,
          padding: padding ?? BubbleEdges.all(15),
          margin: BubbleEdges.only(right: 9, top: 5, bottom: 5, left: 9),
          alignment: isMe ? Alignment.centerLeft : Alignment.centerRight,
          color: color,
          nip: isMe ? BubbleNip.leftTop : BubbleNip.rightTop,
          child: child,
        ),
        // if (message.likeCount > 0 ?? false)
          // Positioned(
              // top: 0,
              // right: isMe ? null : 25,
              // left: isMe ? 25 : null,
              // child: LikeBubble(
                  // isLiked: message?.isLiked ?? false,
                  // likeNumber: message?.likeCount ?? 0)),
        // HebrewText(
        //   message.timestamp.humanReadableTime(),
        //   style: chatMessageBody.copyWith(fontSize: 10),
        // ),
      ]),
    );
  }
}
