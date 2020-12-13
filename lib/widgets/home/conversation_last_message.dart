import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/stores/language/language_store.dart';
import '../../core/theme.dart';
import '../global/custom_text.dart';

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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          if (model?.sender?.fullName != null)
            Flexible(
              child: CustomText(
                language.direction == LanguageDirection.ltr
                    ? ltrTextFormat()
                    : rtlTextFormat(),
                textAlign: getTextAlign(),
                maxLines: 2,
                style: lastWritten,
              ),
            ),
          SizedBox(width: 3),
          SvgPicture.asset(getImageType() ?? '', height: 18, width: 18)
        ],
      ),
    );
  }

  String rtlTextFormat() =>
      '${model?.sender?.fullName ?? ''}: ${model?.messageType == MessageType.text ? model.body : getTextType()}';

  String ltrTextFormat() =>
      '${model?.messageType == MessageType.text ? model.body : getTextType()} :${model?.sender?.fullName ?? ''}';

  TextAlign getTextAlign() {
    return language.direction == LanguageDirection.ltr
        ? TextAlign.left
        : TextAlign.right;
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
      case MessageType.loading:
        return null;
        break;
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
      case MessageType.loading:
        return null;
        break;
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
