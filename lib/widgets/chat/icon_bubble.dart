// MESSAGE TYPES
import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/widgets/global/bubble.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:iconapp/widgets/global/network_photo.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'compose/reply_widgets.dart';
import 'like_buuble.dart';

class IconBubble extends StatefulWidget {
  final Widget child;
  final bool showPin;
  final Function onTap;
  final Function onDoubleTap;
  final Function onLongTap;
  final BubbleEdges padding;
  final bool isMe;
  final MessageModel message;
  final Function onEmjiTap;
  final AutoScrollController controller;
  final Color forcedColord;
  final bool hideEmoji;
  final bool hideAvatar;

  const IconBubble({
    Key key,
    @required this.child,
    @required this.message,
    @required this.isMe,
    this.onLongTap,
    this.onTap,
    this.onDoubleTap,
    this.padding,
    this.onEmjiTap,
    this.controller,
    this.showPin = true,
    this.forcedColord,
    this.hideEmoji = false,
    this.hideAvatar = false,
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
    final color = widget.forcedColord != null
        ? widget.forcedColord
        : widget.message.status == MessageStatus.pending
            ? blueBerry
            : widget.isMe ? darkIndigo2 : blueberry2;

    final horizontalLikePadding = EdgeInsets.symmetric(horizontal: 3);
    return Column(
      children: [
        Row(
          mainAxisAlignment:
              widget.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            // show the emoji+ sign in the right side
            if (!widget.hideEmoji && widget.isMe)
              EmojiPlus(
                isMe: widget.isMe,
                message: widget.message,
                likeAsset: widget.message?.likeType,
              ),
            GestureDetector(
              onLongPress: widget.onLongTap,
              onDoubleTap: widget.onDoubleTap,
              onTap: widget.onTap,
              child: Column(
                children: [
                  Bubble(
                    elevation: 1,
                    stick: true,
                    padding:
                        widget.padding ?? BubbleEdges.symmetric(horizontal: 4),
                    margin:
                        BubbleEdges.only(right: 4, top: 5, bottom: 5, left: 4),
                    alignment: widget.isMe
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    color: color,
                    nip: widget.showPin
                        ? widget.isMe ? BubbleNip.leftTop : BubbleNip.rightTop
                        : BubbleNip.no,
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
                            MessageReply(
                                widget: widget,
                                width: MediaQuery.of(context).size.width * .7),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (!widget.hideAvatar &&
                                  widget.message.messageType ==
                                      MessageType.text &&
                                  !widget.isMe)
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0, top: 7.0),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4.2),
                                      child: NetworkPhoto(
                                        imageUrl:
                                            widget.message.sender?.photo != null
                                                ? widget.message.sender?.photo
                                                        ?.url ??
                                                    ''
                                                : '',
                                      ),
                                    ),
                                  ),
                                ),
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
            // show the emoji+ sign in the left side
            if (!widget.hideEmoji && !widget.isMe)
              EmojiPlus(
                  likeAsset: widget.message?.likeType,
                  isMe: widget.isMe,
                  message: widget.message,
              ),
          ],
        ),
        if (widget.message.likeCounts != null)
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
                mainAxisAlignment: widget.isMe
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
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
        height: 75,
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
                height: 80,
                color: cornflower,
              ),
            ),
            Positioned(
              right: 20,
              top: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(message.sender?.fullName ?? '',
                      style: replayTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis),
                  if (message != null)
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .6,
                      child: getReplyBody(message, width),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
