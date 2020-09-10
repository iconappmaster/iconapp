// MESSAGE TYPES
import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/widgets/global/bubble.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/global/network_photo.dart';

import 'compose/reply_widgets.dart';
import 'like_buuble.dart';

class IconBubble extends StatefulWidget {
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
  _IconBubbleState createState() => _IconBubbleState();
}

final bubbleKey = GlobalKey();

class _IconBubbleState extends State<IconBubble> {
  // double _bubbleWidth;

  double getWidgetWidth() {
    RenderBox renderBox = bubbleKey.currentContext.findRenderObject();
    Size size = renderBox.size;
    return size.width;
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.message.status == MessageStatus.pending
        ? blueBerry
        : widget.isMe ? darkIndigo2 : blueberry2;

    final horizontalLikePadding = EdgeInsets.symmetric(horizontal: 3);
    return Column(
      children: [
        Row(
          mainAxisAlignment:
              widget.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            if (widget.isMe) EmojiPlus(likeAsset: widget.message?.likeType),
            GestureDetector(
              onDoubleTap: widget.onDoubleTap,
              onTap: widget.onTap,
              child: Column(
                children: [
                  Bubble(
                    elevation: 1,
                    stick: true,
                    padding:
                        widget.padding ?? BubbleEdges.symmetric(horizontal: 5),
                    margin:
                        BubbleEdges.only(right: 9, top: 5, bottom: 5, left: 9),
                    alignment: widget.isMe
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    color: color,
                    nip: widget.isMe ? BubbleNip.leftTop : BubbleNip.rightTop,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: 80,
                        minHeight: 55,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (widget.message?.repliedToMessage != null)
                            MessageReply(widget: widget, width: 200),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (widget.message.messageType ==
                                      MessageType.text &&
                                  !widget.isMe)
                                Container(
                                  width: 40,
                                  height: 40,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(4.2),
                                    child: NetworkPhoto(
                                        url: widget.message.sender.photo.url),
                                  ),
                                ),
                              SizedBox(width: 8),
                              widget.child,
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (!widget.isMe) EmojiPlus(likeAsset: widget.message?.likeType),
          ],
        ),
        // if (showLikeIndicator)/

        AnimatedContainer(
          duration: Duration(milliseconds: 250),
          height: showLikeIndicator ? 25 : 0,
          child: Padding(
            padding: EdgeInsets.only(
              left: widget.isMe ? 16 : 0,
              right: widget.isMe ? 0 : 16,
              bottom: 4.7,
            ),
            child: Row(
              mainAxisAlignment:
                  widget.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
                if ((widget.message.likeCounts.like1 > 0) ?? false)
                  EmojiLikeBubble(
                    likeAsset: likeOneKey,
                    padding: horizontalLikePadding,
                    count: widget.message?.likeCounts?.like1 ?? 0,
                  ),
                if (widget.message.likeCounts.like2 > 0 ?? false)
                  EmojiLikeBubble(
                    likeAsset: likeTwoKey,
                    padding: horizontalLikePadding,
                    count: widget.message.likeCounts?.like2 ?? 0,
                  ),
                if (widget.message.likeCounts.like3 > 0 ?? false)
                  EmojiLikeBubble(
                    likeAsset: likeThreeKey,
                    padding: horizontalLikePadding,
                    count: widget.message.likeCounts?.like3 ?? 0,
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }

  bool get showLikeIndicator =>
      widget.message.likeCounts.like1 > 0 ||
      widget.message.likeCounts.like2 > 0 ||
      widget.message.likeCounts.like3 > 0;
}

class MessageReply extends StatelessWidget {
  final double width;
  const MessageReply({
    Key key,
    @required this.widget,
    @required this.width,
  }) : super(key: key);

  final IconBubble widget;

  @override
  Widget build(BuildContext context) {
    final message = widget?.message?.repliedToMessage;
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        height: 63,
        width: width,
        decoration: BoxDecoration(
            color: paleGreyTwo,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(3.7),
              bottomLeft: Radius.circular(3.7),
            )),
        child: Stack(
          fit: StackFit.loose,
          children: [
            Positioned(
              right: 0,
              child: Container(
                width: 5,
                height: 63,
                color: cornflower,
              ),
            ),
            Positioned(
                right: 20,
                top: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HebrewText(message.sender?.fullName ?? '',
                        style: replayTitle),
                    SizedBox(height: 5),
                    if (message != null) getReplyBody(message)
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
