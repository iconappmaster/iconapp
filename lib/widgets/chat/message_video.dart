import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/widgets/chat/reply_slider.dart';
import 'package:iconapp/widgets/global/network_photo.dart';
import 'package:iconapp/widgets/global/slidable_widget.dart';
import 'bubble.dart';

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
 
  @override
  void initState() {
    super.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final store = sl<ChatStore>();
    return ReplySlider(
      keyName: widget.message.id.toString(),
      isOpen: isOpen,
      controller: controller,
      builder: (context, index, animation, step) {
        sliderContext = context;
        return ReplyButton();
      },
      child: IconBubble(
        onDoubleTap: () async => await store.likeMessage(widget.message),
        isMe: widget.isMe,
        message: widget.message,
        onTap: () => ExtendedNavigator.of(context).pushNamed(
            Routes.fullVideoScreen,
            arguments:
                FullVideoScreenArguments(url: widget.message?.body ?? '')),
        child: Stack(
          alignment: Alignment.center,
          children: [
            widget.message.body.startsWith('http')
                ? NetworkPhoto(url: widget.message?.extraData ?? '')
                : Image.file(File(widget.message?.extraData ?? '')),
            SvgPicture.asset(
              'assets/images/play_button.svg',
              height: 56,
              width: 56,
            ),
          ],
        ),
      ),
    );
  }
}
