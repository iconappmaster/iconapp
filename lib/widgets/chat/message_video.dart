import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/widgets/chat/reply_slider.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/global/like_menu/likes_menu.dart';
import 'package:iconapp/widgets/global/network_photo.dart';
import 'package:iconapp/widgets/global/slidable/slidable.dart';
import 'package:iconapp/widgets/global/slidable_widget.dart';
import 'icon_bubble.dart';
import '../../core/extensions/int_ext.dart';

class VideoMessage extends StatefulWidget {
  final MessageModel message;
  final bool isMe;

  const VideoMessage({
    Key key,
    @required this.message,
    @required this.isMe,
  }) : super(key: key);

  @override
  _VideoMessageState createState() => _VideoMessageState();
}

class _VideoMessageState extends SlidableStateWidget<VideoMessage> {
  SlidableController _controller;
  BuildContext _sliderContext;
  bool _isOpen = false;

  @override
  void initState() {
    super.init();
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
        child: IconBubble(
          isMe: widget.isMe,
          message: widget.message,
          onTap: () => ExtendedNavigator.of(context).pushNamed(
              Routes.videoScreen,
              arguments:
                  VideoScreenArguments(url: widget.message?.body ?? '')),
          child: Stack(
            alignment: Alignment.center,
            children: [
              widget.message.body.startsWith('http')
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(4.2),
                      child: SizedBox(
                        height: 200,
                        width: 240,
                        child:
                            NetworkPhoto(url: widget.message?.extraData ?? ''),
                      ))
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(4.2),
                      child: SizedBox(
                        height: 200,
                        width: 240,
                        child: Image.file(
                          File(widget.message?.extraData ?? ''),
                        ),
                      ),
                    ),
              SvgPicture.asset(
                'assets/images/play_button.svg',
                height: 56,
                width: 56,
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
            ],
          ),
        ),
      ),
    );
  }
}
