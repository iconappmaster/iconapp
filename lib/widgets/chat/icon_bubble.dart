// MESSAGE TYPES
import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/widgets/global/bubble.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';

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
        Stack(
          fit: StackFit.loose,
          children: [
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
                      constraints: BoxConstraints(minWidth: 80, minHeight: 55),
                      child: widget.message?.repliedToMessage != null
                          ? Wrap(
                              direction: Axis.vertical,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Container(
                                    height: 63,
                                    width: 200,
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
                                          child: HebrewText(
                                              widget?.message?.repliedToMessage
                                                      ?.sender?.fullName ??
                                                  '',
                                              style: replayTitle),
                                        ),
                                        Positioned(
                                          right: 20,
                                          top: 25,
                                          child: HebrewText(
                                              widget?.message?.repliedToMessage
                                                      ?.body ??
                                                  '',
                                              maxLines: 2,
                                              style: replayTitle),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                widget.child,
                              ],
                            )
                          : widget.child,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: widget.isMe ? 40 : null,
              right: widget.isMe ? null : 40,
              child: LikeBubble(likeAsset: widget.message?.likeType),
            ),
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
                  LikeBubble(
                    likeAsset: likeOneKey,
                    padding: horizontalLikePadding,
                    count: widget.message?.likeCounts?.like1 ?? 0,
                  ),
                if (widget.message.likeCounts.like2 > 0 ?? false)
                  LikeBubble(
                    likeAsset: likeTwoKey,
                    padding: horizontalLikePadding,
                    count: widget.message.likeCounts?.like2 ?? 0,
                  ),
                if (widget.message.likeCounts.like3 > 0 ?? false)
                  LikeBubble(
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
