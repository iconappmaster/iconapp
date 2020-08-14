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
  final Animation<double> animation;

  const PhotoMessage({
    Key key,
    @required this.message,
    @required this.animation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = message.status == MessageStatus.pending ? blueBerry : darkIndigo2;
    return SizeTransition(
      sizeFactor: animation,
      child: AnimatedContainer(
        key: Key(message.id.toString()),
        duration: Duration(milliseconds: 400),
        constraints: BoxConstraints(maxHeight: 225),
        child: IconBubble(
          padding: BubbleEdges.all(0),
          color: color,
          onTap: () => ExtendedNavigator.of(context).pushNamed(
            Routes.fullImageScreen,
            arguments: FullImageScreenArguments(
              photo: PhotoModel(url: message.body),
            ),
          ),
          child: message.body.startsWith('http')
              ? NetworkPhoto(url: message.body)
              : Image.file(File(message.body)),
        ),
      ),
    );
  }
}

class VideoMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class TextMessage extends StatelessWidget {
  final MessageModel message;
  final Animation<double> animation;
  const TextMessage({Key key, @required this.message, this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color =
        message.status == MessageStatus.pending ? blueBerry : darkIndigo2;
    return SizeTransition(
      sizeFactor: animation,
      child: Stack(
        children: [
          IconBubble(
            color: color,
            onTap: () async {
              await sl<ChatStore>().likeMessage(message.id);
            },
            child: Container(
              color: color,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  HebrewText(message.sender?.fullName ?? '',
                      style: chatMessageName, textAlign: TextAlign.start),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      HebrewText(message.body,
                          style: chatMessageBody, textAlign: TextAlign.start),
                      SizedBox(width: 10),
                    ],
                  ),
                  // HebrewText(
                  //   message.timestamp.humanReadableTime(),
                  //   style: chatMessageBody.copyWith(fontSize: 10),
                  // ),
                ],
              ),
            ),
          ),
          // if (message.likeCount > 0)
          Positioned(
            top: 0,
            right: 25,
            child: LikeBubble(
              isLiked: message?.isLiked ?? false,
              likeNumber: message?.likeCount ?? 0,
            ),
          ),
        ],
      ),
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
  final Color color;
  final BubbleEdges padding;

  const IconBubble(
      {Key key,
      @required this.child,
      @required this.onTap,
      @required this.color,
      this.padding})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Bubble(
        elevation: 3,
        stick: true,
        padding: padding ?? BubbleEdges.all(15),
        margin: BubbleEdges.only(right: 9, top: 5, bottom: 5, left: 9),
        alignment: Alignment.centerRight,
        color: color,
        nip: BubbleNip.rightTop,
        child: child,
      ),
    );
  }
}
