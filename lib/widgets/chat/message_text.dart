import 'dart:async';
import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:iconapp/core/bus.dart';
import 'package:iconapp/widgets/chat/events/slide_event.dart';
import 'package:iconapp/widgets/global/like_menu/likes_menu.dart';
import 'reply_slider.dart';
import 'bubble.dart';
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
  SlidableController controller;
  SlidableState slide;
  StreamSubscription<SlidableOpenEvent> subscripbiton;
  BuildContext _sliderContext;
  bool _isOpen = false;

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() {
    final bus = sl<Bus>();
    subscripbiton = bus.on<SlidableOpenEvent>().listen((event) {
      if (widget.index != event.index && _sliderContext != null) {
        Slidable.of(_sliderContext).close();
      }
    });

    controller = SlidableController(
      onSlideIsOpenChanged: (isOpen) {
        if (mounted) {
          setState(() {
            _isOpen = isOpen;
          });
        }

        if (isOpen) bus.fire(SlidableOpenEvent(widget.index));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.message.status == MessageStatus.pending
        ? blueBerry
        : widget.isMe ? darkIndigo2 : blueberry2;

    return Likeble(
      message: widget.message,
      child: ReplySlider(
        isOpen: _isOpen,
        keyName: widget.message.id.toString(),
        controller: controller,
        builder: _replyBuilder,
        child: IconBubble(
          padding: BubbleEdges.only(left: 12, right: 12, top: 15, bottom: 7),
          message: widget.message,
          isMe: widget.isMe,
          child: Stack(children: [
            Container(
              color: color,
              child: Padding(
                padding: EdgeInsets.only(
                  left: widget.isMe ? 30.0 : 0,
                  right: widget.isMe ? 0 : 30.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    HebrewText(widget.message.sender?.fullName ?? '',
                        style: chatMessageName, textAlign: TextAlign.start),
                    SelectableText(widget.message?.body ?? '',
                        style: chatMessageBody, textAlign: TextAlign.start),
                  ],
                ),
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

  Widget _replyBuilder(context, index, animation, step) {
    _sliderContext = context;
    return ReplyButton();
  }

  @override
  void dispose() {
    subscripbiton?.cancel();
    super.dispose();
  }
}
