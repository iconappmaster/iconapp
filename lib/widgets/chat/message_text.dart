import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'bubble.dart';

class TextMessage extends StatelessWidget {
  final MessageModel message;
  final bool isMe;
  const TextMessage({
    Key key,
    @required this.message,
    @required this.isMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = message.status == MessageStatus.pending
        ? blueBerry
        : isMe ? darkBlueGrey : darkIndigo2;
    return Stack(
      children: [
        IconBubble(
          padding: BubbleEdges.all(8),
          message: message,
          isMe: isMe,
          onDoubleTap: () async => await sl<ChatStore>().likeMessage(message),
          child: Container(
            color: color,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                HebrewText(message.sender?.fullName ?? '',
                    style: chatMessageName, textAlign: TextAlign.start),
                HebrewText(message.body,
                    style: chatMessageBody, textAlign: TextAlign.start),
              ],
            ),
          ),
        ),
        // if (message.likeCount > 0)
      ],
      // ),
    );
  }
}
