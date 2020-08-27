import 'dart:async';
import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:iconapp/core/bus.dart';
import 'package:iconapp/widgets/chat/events/slide_event.dart';
import 'package:iconapp/widgets/global/like_menu/focused_menu.dart';
import 'package:iconapp/widgets/global/like_menu/modals.dart';
import 'reply_slider.dart';
import 'bubble.dart';
import '../../core/dependencies/locator.dart';
import '../../core/theme.dart';
import '../../data/models/message_model.dart';
import '../../stores/chat/chat_store.dart';
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
      onSlideAnimationChanged: (value) => print(value),
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
    final chat = sl<ChatStore>();

    return FocusedMenuHolder(
      menuItems: [
        FocusedMenuItem(
          asset: 'assets/images/wow.svg',
          key: 'like_1',
          onPressed: () {},
        ),
        FocusedMenuItem(
          asset: 'assets/images/king.svg',
          key: 'like_2',
          onPressed: () {},
        ),
        FocusedMenuItem(
          asset: 'assets/images/other_purple.svg',
          key: 'like_3',
          onPressed: () {},
        ),
      ],
      onPressed: () {},
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        color: _isOpen ? darkBlueGrey : Colors.transparent,
        child: ReplySlider(
          isOpen: _isOpen,
          keyName: widget.message.id.toString(),
          controller: controller,
          builder: _replyBuilder,
          child: IconBubble(
            padding: BubbleEdges.only(left: 4, right: 12, top: 8, bottom: 5),
            message: widget.message,
            isMe: widget.isMe,
            onDoubleTap: () => chat.likeMessage(widget.message),
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
                      SizedBox(height: 3),
                      HebrewText(widget.message?.body ?? '',
                          style: chatMessageBody, textAlign: TextAlign.start),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                bottom: 0,
                child: HebrewText(
                  widget.message?.timestamp?.humanReadableTime() ?? '',
                  style: chatMessageBody.copyWith(fontSize: 9),
                  textAlign: TextAlign.start,
                ),
              )
            ]),
          ),
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
