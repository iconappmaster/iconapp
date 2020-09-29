import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:vibration/vibration.dart';
import '../../core/bus.dart';
import '../../core/dependencies/locator.dart';
import '../../core/theme.dart';
import '../../data/models/message_model.dart';
import '../../data/models/user_model.dart';
import '../../data/repositories/media_repository.dart';
import '../../stores/chat/chat_store.dart';
import '../global/hebrew_input_text.dart';
import '../global/network_photo.dart';
import '../global/slidable/slidable.dart';
import '../global/slidable_widget.dart';
import '../../core/extensions/int_ext.dart';
import 'reply_slider.dart';
import 'chat_list.dart';
import 'icon_bubble.dart';

class VideoMessage extends StatefulWidget {
  final MessageModel message;
  final bool isMe;
  final int index;
  final AutoScrollController controller;

  const VideoMessage({
    Key key,
    @required this.message,
    @required this.isMe,
    @required this.index,
    @required this.controller,
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
        if (mounted)
          setState(
            () => _progress = event.progress,
          );
      }
    });
    _controller = SlidableController(
      onSlideAnimationChanged: (s) => print(s), // do not remove
      onSlideIsOpenChanged: (isOpen) {
        if (mounted) {
          setState(() async {
            await Vibration.vibrate(duration: 150);
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

    return ScrollableTile(
      index: widget.index,
      controller: widget.controller,
      child: Replyble(
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
            onTap: () => ExtendedNavigator.of(context)
                .pushVideoScreen(url: widget.message?.body ?? ''),
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
                              fit: BoxFit.cover,
                            ))),
                SvgPicture.asset(
                  'assets/images/play_button.svg',
                  height: 76,
                  width: 76,
                ),
                Positioned(
                  left: 5,
                  bottom: 5,
                  child: CustomText(
                    widget.message.status == MessageStatus.pending
                        ? ''
                        : widget.message?.timestamp?.humanReadableTime() ?? '',
                    style: chatMessageBody.copyWith(fontSize: 12),
                    textAlign: TextAlign.start,
                  ),
                ),
                Positioned(
                  right: 5,
                  bottom: 5,
                  child: CustomText(widget.message.sender?.fullName ?? '',
                      style: chatMessageBody.copyWith(
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.start),
                ),
              ],
            ),
          ),
          Visibility(
            visible: widget.message.status == MessageStatus.pending,
            child: Positioned(
              left: 113,
              top: 83,
              child: SizedBox(
                height: 55,
                width: 55,
                child: CircularProgressIndicator(
                  value: _progress,
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(cornflower),
                  backgroundColor: white,
                ),
              ),
            ),
          ),
          Visibility(
            visible: widget.message.status == MessageStatus.compressing,
            child: Positioned(
              left: 113,
              top: 83,
              child: SizedBox(
                height: 55,
                width: 55,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(cornflower),
                  backgroundColor: white,
                ),
              ),
            ),
          ),
          Visibility(
            visible: widget.message.status == MessageStatus.compressing,
            child: Positioned(
              left: 80,
              top: 155,
              child: CustomText(
                'מקבץ סרטון...',
                style: flushbar,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
