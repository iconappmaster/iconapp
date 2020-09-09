import 'dart:async';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/stores/chat/chat_store.dart';

import 'package:flutter/material.dart';
import '../global/bubble.dart';
import '../global/like_menu/likes_menu.dart';
import 'reply_slider.dart';
import 'icon_bubble.dart';
import '../../core/dependencies/locator.dart';
import '../../core/theme.dart';
import '../../data/models/message_model.dart';
import '../global/hebrew_input_text.dart';
import '../global/slidable/slidable.dart';
import '../../core/extensions/int_ext.dart';

class TextMessage extends StatefulWidget {
  final MessageModel message;
  final bool isMe;
  final int index;

  const TextMessage({
    Key key,
    @required this.message,
    @required this.isMe,
    @required this.index,
  }) : super(key: key);

  @override
  _TextMessageState createState() => _TextMessageState();
}

class _TextMessageState extends State<TextMessage> {
  SlidableController _controller;
  BuildContext _sliderContext;
  bool _isOpen = false;

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() {
    _controller = SlidableController(
      onSlideAnimationChanged: (s) => print(s), // do not remove
      onSlideIsOpenChanged: (isOpen) {
        if (mounted) {
          setState(() {
            _isOpen = isOpen;
            sl<ChatStore>().setReplyMessage(widget.message);
            final slide = Slidable.of(_sliderContext);
            Future.delayed(Duration(milliseconds: 250), () => slide.close());
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.message.status == MessageStatus.pending
        ? blueBerry
        : widget.isMe ? darkIndigo2 : blueberry2;

    final store = sl<ChatStore>();

    return Likeble(
      message: widget.message,
      child: Replyble(
        isEnabled: store.conversation.userRole != UserRole.viewer,
        isOpen: _isOpen,
        keyName: widget.message.id.toString(),
        controller: _controller,
        builder: (context, index, animation, step) {
          _sliderContext = context;
          return ReplyButton(message: widget.message);
        },
        child: IconBubble(
          padding: BubbleEdges.only(left: 12, right: 12, top: 15, bottom: 7),
          message: widget.message,
          isMe: widget.isMe,
          child: Stack(children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              color: color,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  HebrewText(widget.message.sender?.fullName ?? '',
                      style: chatMessageName, textAlign: TextAlign.start),
                  SelectableText(widget.message?.body ?? '',
                      style: chatMessageBody, textAlign: TextAlign.start),
                  SizedBox(height: 8),
                ],
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: HebrewText(
                widget.message.status == MessageStatus.pending
                    ? ''
                    : widget.message?.timestamp?.humanReadableTime() ?? '',
                style: chatMessageBody.copyWith(fontSize: 9),
                textAlign: TextAlign.start,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
