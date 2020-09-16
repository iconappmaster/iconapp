import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/bus.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/data/repositories/media_repository.dart';
import 'package:iconapp/routes/router.gr.dart';
import '../../stores/chat/chat_store.dart';
import 'reply_slider.dart';
import '../global/hebrew_input_text.dart';
import '../global/network_photo.dart';
import '../global/slidable/slidable.dart';
import '../global/slidable_widget.dart';
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
  double _progress = 0.0;
  StreamSubscription<ProgressEvent> progressSubscription;

  @override
  void initState() {
    super.init();
    _initSlidable();
    super.initState();
  }

  void _initSlidable() {
    progressSubscription = sl<Bus>().on<ProgressEvent>().listen((event) {
      if (event.id != null && event.id == widget.message.id) {
        if (mounted) setState(() => _progress = event.progress);
      }
    });
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

    return Replyble(
      isEnabled: store.conversation.userRole != UserRole.viewer,
      isOpen: _isOpen,
      keyName: widget.message.id.toString(),
      controller: _controller,
      builder: (context, index, animation, step) {
        _sliderContext = context;
        return ReplyButton(message: widget.message);
      },
      child: Stack(children: [
        IconBubble(
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
                        child: NetworkPhoto(
                            url: widget.message?.extraData ?? ''),
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
                child: CustomText(
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
                child: CustomText(widget.message.sender?.fullName ?? '',
                    style: chatMessageName, textAlign: TextAlign.start),
              ),
            ],
          ),
        ),
        if (widget.message.status == MessageStatus.pending)
          Positioned(
            left: 100,
            top: 80,
            child: CircularProgressIndicator(
              value: _progress,
              strokeWidth: 2,
              backgroundColor: white,
            ),
          ),
      ]),
    );
  }
}
