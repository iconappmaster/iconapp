import 'dart:async';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/stores/chat/chat_store.dart';

import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:vibration/vibration.dart';
import '../global/bubble.dart';
import 'chat_list.dart';
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
  final bool showPin;
  final AutoScrollController controller;

  const TextMessage({
    Key key,
    @required this.message,
    @required this.isMe,
    @required this.index,
    @required this.controller,
    this.showPin = true,
  }) : super(key: key);

  @override
  _TextMessageState createState() => _TextMessageState();
}

class _TextMessageState extends State<TextMessage> {
  SlidableController _slidableController;
  BuildContext _sliderContext;
  bool _isOpen = false;
  ChatStore _chat;

  @override
  void initState() {
    _chat = sl<ChatStore>();
    init();
    super.initState();
  }

  void init() {
    _slidableController = SlidableController(
      onSlideAnimationChanged: (_) => print('onSlideChanged'),
      onSlideIsOpenChanged: (isOpen) {
        if (mounted) {
          setState(() async {
            await Vibration.vibrate(duration: 150);
            _isOpen = isOpen;
            _chat.setReplyMessage(widget.message);
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

    return ScrollableTile(
      index: widget.index,
      controller: widget.controller,
      child: Replyble(
        isEnabled: _chat.conversation.userRole != UserRole.viewer,
        isOpen: _isOpen,
        keyName: widget.message.id.toString(),
        controller: _slidableController,
        builder: (context, index, animation, step) {
          _sliderContext = context;
          return ReplyButton(message: widget.message);
        },
        child: IconBubble(
          showPin: widget.showPin,
          onTap: () {
            final repliedMessage = widget.message.repliedToMessage;
            if (repliedMessage != null) {
              final index = _chat.getMessages
                  .indexWhere((m) => m.id == repliedMessage.id);
              widget.controller.scrollToIndex(index);
            }
          },
          padding: const BubbleEdges.only(top: 5, bottom: 1),
          message: widget.message,
          isMe: widget.isMe,
          child: Stack(children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4),
              color: color,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CustomText(
                    widget.message.sender?.fullName ?? '',
                    style: chatMessageName,
                    textAlign: TextAlign.start,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * .5),
                    child: SelectableText(
                      widget.message?.body ?? '',
                      style: chatMessageBody,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: CustomText(
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
