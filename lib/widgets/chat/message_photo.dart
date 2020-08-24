import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/data/models/photo_model.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/global/network_photo.dart';

import '../../core/extensions/int_ext.dart';
import 'bubble.dart';

class PhotoMessage extends StatelessWidget {
  final MessageModel message;
  final bool isMe;

  const PhotoMessage({
    Key key,
    @required this.message,
    @required this.isMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = sl<ChatStore>();
    return Container(
      margin: EdgeInsets.only(right: isMe ? 50 : 0, left: isMe ? 0 : 50),
      child: Opacity(
        opacity: message.status == MessageStatus.pending ? .8 : 1,
        child: IconBubble(
          onDoubleTap: () async => await store.likeMessage(message),
          isMe: isMe,
          message: message,
          onTap: () => ExtendedNavigator.of(context).pushNamed(
              Routes.fullImageScreen,
              arguments: FullImageScreenArguments(
                  photo: PhotoModel(url: message?.body ?? ''))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              message.body.startsWith('http')
                  ? AspectRatio(
                      aspectRatio: 1, child: NetworkPhoto(url: message.body))
                  : AspectRatio(
                      aspectRatio: 1,
                      child: Image.file(
                        File(message.body),
                        fit: BoxFit.cover,
                      ),
                    ),
              SizedBox(height: 5),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                HebrewText(message.sender?.fullName ?? '',
                    style: newMessageNumber, textAlign: TextAlign.start),
                HebrewText(message.timestamp.humanReadableTime(),
                    style: newMessageNumber, textAlign: TextAlign.start),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
