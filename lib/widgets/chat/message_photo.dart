import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/data/models/photo_model.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/widgets/chat/reply_slider.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/global/like_menu/likes_menu.dart';
import 'package:iconapp/widgets/global/network_photo.dart';
import 'package:iconapp/widgets/global/slidable/slidable.dart';

import '../../core/extensions/int_ext.dart';
import 'icon_bubble.dart';

class PhotoMessage extends StatefulWidget {
  final MessageModel message;
  final bool isMe;

  const PhotoMessage({
    Key key,
    @required this.message,
    @required this.isMe,
  }) : super(key: key);

  @override
  _PhotoMessageState createState() => _PhotoMessageState();
}

class _PhotoMessageState extends State<PhotoMessage> {
  SlidableController _controller;
  BuildContext _sliderContext;
  bool _isOpen = false;

  @override
  void initState() {
    _initSlidable();
    super.initState();
  }

  void _initSlidable() {
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
        child: Container(
          // margin: EdgeInsets.only(
          //     right: widget.isMe ? 50 : 0, left: widget.isMe ? 0 : 50),
          child: Opacity(
            opacity: widget.message.status == MessageStatus.pending ? .8 : 1,
            child: IconBubble(
              isMe: widget.isMe,
              message: widget.message,
              onTap: () => ExtendedNavigator.of(context).pushNamed(
                  Routes.fullImageScreen,
                  arguments: FullImageScreenArguments(
                      photo: PhotoModel(url: widget.message?.body ?? ''))),
              child: Stack(children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.message.body.startsWith('http')
                        ? SizedBox(
                            height: 200,
                            width: 240,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(4.2),
                                child: NetworkPhoto(url: widget.message.body)))
                        : SizedBox(
                            height: 200,
                            width: 200,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4.2),
                              child: Image.file(
                                File(widget.message.body),
                                fit: BoxFit.cover,
                              ),
                            )),
                  ],
                ),
                Positioned(
                  left: 5,
                  bottom: 5,
                  child: HebrewText(
                    widget.message.status == MessageStatus.pending
                        ? ''
                        : widget.message?.timestamp?.humanReadableTime() ?? '',
                    style: chatMessageBody.copyWith(fontSize: 9),
                    textAlign: TextAlign.start,
                  ),
                ),
                Positioned(
                  right: 5,
                  bottom: 5,
                  child: HebrewText(widget.message.sender?.fullName ?? '',
                      style: chatMessageName, textAlign: TextAlign.start),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
