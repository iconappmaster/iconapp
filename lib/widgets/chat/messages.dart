// MESSAGE TYPES
import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';

class SystemMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class AudioMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class PhotoMessage extends StatelessWidget {
  final MessageModel message;
  final Animation<double> animation;

  const PhotoMessage({
    Key key,
    @required this.message,
    @required this.animation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class VideoMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class TextMessage extends StatelessWidget {
  final MessageModel message;
  final Animation<double> animation;
  const TextMessage({Key key, @required this.message, this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      child: Bubble(
        elevation: 3,
        stick: true,
        padding: BubbleEdges.fromLTRB(20, 10, 10, 10),
        margin: BubbleEdges.only(right: 9, top: 5, bottom: 5, left: 9),
        alignment: Alignment.centerRight,
        color: cornflower,
        nip: BubbleNip.rightTop,
        child: Container(
          color: cornflower,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              HebrewText(
                message.sender?.fullName ?? 'נטלי דדון',
                style: chatMessageName,
                textAlign: TextAlign.start,
              ),
              HebrewText(
                message.body,
                style: chatMessageBody,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
