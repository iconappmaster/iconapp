// MESSAGE TYPES
import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/message_model.dart';

import 'like_buuble.dart';

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
        : isMe ? darkIndigo2 : blueberry2;

    final horizontalLikePadding = EdgeInsets.symmetric(horizontal: 3);

    return Column(
      children: [
        Stack(
          fit: StackFit.loose,
          children: [
            GestureDetector(
              onDoubleTap: onDoubleTap,
              onTap: onTap,
              child: Bubble(
                  elevation: 1,
                  stick: true,
                  padding: padding ?? BubbleEdges.symmetric(horizontal: 5),
                  margin:
                      BubbleEdges.only(right: 9, top: 5, bottom: 5, left: 9),
                  alignment:
                      isMe ? Alignment.centerLeft : Alignment.centerRight,
                  color: color,
                  nip: isMe ? BubbleNip.leftTop : BubbleNip.rightTop,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: 80, minHeight: 55),
                    child: child,
                  )),
            ),
            Positioned(
              left: isMe ? 25 : null,
              right: isMe ? null : 25,
              child: LikeBubble(likeAsset: message?.likeType),
            ),
          ],
        ),
        // if (showLikeIndicator)/

        AnimatedContainer(
          duration: Duration(milliseconds: 250),
          height: showLikeIndicator ? 25 : 0,
          child: Padding(
            padding: EdgeInsets.only(
              left: isMe ? 16 : 0,
              right: isMe ? 0 : 16,
              bottom: 4.7,
            ),
            child: Row(
              mainAxisAlignment:
                  isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
                if ((message.likeCounts.like1 > 0) ?? false)
                  LikeBubble(
                    likeAsset: likeOneKey,
                    padding: horizontalLikePadding,
                    count: message?.likeCounts?.like1 ?? 0,
                  ),
                if (message.likeCounts.like2 > 0 ?? false)
                  LikeBubble(
                    likeAsset: likeTwoKey,
                    padding: horizontalLikePadding,
                    count: message.likeCounts?.like2 ?? 0,
                  ),
                if (message.likeCounts.like3 > 0 ?? false)
                  LikeBubble(
                    likeAsset: likeThreeKey,
                    padding: horizontalLikePadding,
                    count: message.likeCounts?.like3 ?? 0,
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }

  bool get showLikeIndicator =>
      message.likeCounts.like1 > 0 ??
      false || message.likeCounts.like2 > 0 ??
      false || message.likeCounts.like3 > 0 ??
      false;
}
