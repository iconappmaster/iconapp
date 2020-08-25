// MESSAGE TYPES
import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';

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
        : isMe ? darkIndigo2 : blueberry2;
    return GestureDetector(
      onDoubleTap: onDoubleTap,
      onTap: onTap,
      child: Bubble(
        
          elevation: 1,
          stick: true,
          padding: padding ?? BubbleEdges.all(3),
          margin: BubbleEdges.only(right: 9, top: 3, bottom: 3, left: 9),
          alignment: isMe ? Alignment.centerLeft : Alignment.centerRight,
          color: color,
          nip: isMe ? BubbleNip.leftTop : BubbleNip.rightTop,
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: 80, minHeight: 55),
            child: child,
          )),
    );
  }
}
