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

const photoTag = 'photo';

class SystemMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class AudioMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class PhotoMessage extends StatelessWidget {
  final MessageModel message;
  // final Animation<double> animation;
  final bool isMe;

  const PhotoMessage({
    Key key,
    @required this.message,
    // @required this.animation,
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
            HebrewText(
              message.sender?.fullName ?? '',
              style: chatMessageName,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 5),
            message.body.startsWith('http')
                ? AspectRatio(
                    aspectRatio: 1,
                    child: NetworkPhoto(
                      url: message.body,
                    ),
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
  final Animation<double> animation;
  final bool isMe;

  const VideoMessage({
    Key key,
    @required this.message,
    @required this.animation,
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
        padding: BubbleEdges.all(0),
        onTap: () => ExtendedNavigator.of(context).pushNamed(
          Routes.fullImageScreen,
          arguments: FullImageScreenArguments(
            photo: PhotoModel(url: message?.body ?? ''),
          ),
        ),
        child: message.body.startsWith('http')
            ? NetworkPhoto(url: message.body)
            : Image.file(File(message.body)),
      ),
    );
  }
}

class TextMessage extends StatelessWidget {
  final MessageModel message;
  // final Animation<double> animation;
  final bool isMe;
  const TextMessage({
    Key key,
    @required this.message,
    @required this.isMe,
    // this.animation,
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
        if (message.likeCount > 0 ?? false)
          Positioned(
              top: 0,
              right: isMe ? null : 25,
              left: isMe ? 25 : null,
              child: LikeBubble(
                  isLiked: message?.isLiked ?? false,
                  likeNumber: message?.likeCount ?? 0)),
        // HebrewText(
        //   message.timestamp.humanReadableTime(),
        //   style: chatMessageBody.copyWith(fontSize: 10),
        // ),
      ]),
    );
  }
}
