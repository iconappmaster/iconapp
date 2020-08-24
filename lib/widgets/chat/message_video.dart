import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/widgets/global/network_photo.dart';
import 'bubble.dart';

class VideoMessage extends StatelessWidget {
  final MessageModel message;
  final bool isMe;

  const VideoMessage({
    Key key,
    @required this.message,
    @required this.isMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = sl<ChatStore>();
    return Container(
      key: Key(message.id.toString()),
      child: IconBubble(
        onDoubleTap: () async => await store.likeMessage(message),
        isMe: isMe,
        message: message,
        onTap: () => ExtendedNavigator.of(context).pushNamed(
            Routes.fullVideoScreen,
            arguments: FullVideoScreenArguments(url: message?.body ?? '')),
        child: Stack(
          alignment: Alignment.center,
          children: [
            message.body.startsWith('http')
                ? NetworkPhoto(url: message?.extraData ?? '')
                : Image.file(File(message?.extraData ?? '')),
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
