import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/global/slidable/slidable.dart';
import 'package:iconapp/widgets/global/slidable/slidable_action_pane.dart';
import '../../core/extensions/int_ext.dart';
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
        : isMe ? darkIndigo2 : blueberry2;

    return Slidable(
      actionPane: SlidableBehindActionPane(),
      movementDuration: Duration(milliseconds: 350),
      actionExtentRatio: .25,
      child: Stack(
        children: [
          IconBubble(
            padding: BubbleEdges.symmetric(horizontal: 12, vertical: 8),
            message: message,
            isMe: isMe,
            onDoubleTap: () async => await sl<ChatStore>().likeMessage(message),
            child: Stack(children: [
              Container(
                color: color,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    HebrewText(message.sender?.fullName ?? '',
                        style: chatMessageName, textAlign: TextAlign.start),
                    HebrewText(message?.body ?? '',
                        style: chatMessageBody, textAlign: TextAlign.start),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                bottom: 0,
                child: HebrewText(message?.timestamp?.humanReadableTime() ?? '',
                    style: chatMessageBody, textAlign: TextAlign.start),
              )
            ]),
          ),
          // if (message.likeCount > 0)
        ],
      ),
      actions: [
        Container(
          color: cornflower,
          child: IconButton(
              icon: Icon(
                Icons.reply,
                color: white,
              ),
              onPressed: () {}),
        )
      ],
      direction: Axis.horizontal,
    );
  }
}
