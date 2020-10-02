import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/data/models/message_model.dart';
import '../../core/theme.dart';
import '../global/hebrew_input_text.dart';

class HomeTileConversationMessage extends StatelessWidget {
  final MessageModel model;

  const HomeTileConversationMessage({Key key, @required this.model})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * .55),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (model?.sender?.fullName != null)
            CustomText(
              '${model?.sender?.fullName ?? ''}:',
              overflow: TextOverflow.fade,
              textAlign: TextAlign.start,
              style: lastWritten,
            ),

          SizedBox(width: 3),

          // if we have text
          if (model?.messageType == MessageType.text)
            Flexible(
              child: CustomText(model?.body ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  style: lastWritten),
            ),

          if (model?.messageType != MessageType.text &&
              model?.messageType != MessageType.system)
            SvgPicture.asset(getImageType() ?? '', height: 20, width: 20),

          SizedBox(width: 5),

          CustomText(getTextType() ?? '',
              overflow: TextOverflow.fade,
              textAlign: TextAlign.start,
              style: lastWritten),
        ],
      ),
    );
  }

  String getImageType() {
    switch (model?.messageType) {
      case MessageType.photo:
        return 'assets/images/camera.svg';
      case MessageType.video:
        return 'assets/images/play_thumb.svg';
      case MessageType.voice:
        return 'assets/images/microphone.svg';
      case MessageType.system:
        return null;
      case MessageType.text:
        return null;
    }

    return null;
  }

  String getTextType() {
    switch (model?.messageType) {
      case MessageType.photo:
        return 'תמונה';
      case MessageType.video:
        return 'וידאו';
      case MessageType.voice:
        return 'הקלטה';
      case MessageType.system:
        return '';
      case MessageType.text:
        return '';
    }

    return null;
  }

  String formatLastMessage(MessageModel msg) {
    String result = '';
    if (msg?.sender == null)
      result = 'קבוצה חדשה';
    else
      result = model.body?.startsWith('http') ?? false
          ? 'מדיה'
          : '${model.sender?.fullName}: ${model.body ?? ''}';

    return result;
  }
}
