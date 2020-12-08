import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/stores/language/language_store.dart';
import 'package:iconapp/widgets/global/network_photo.dart';
import '../../core/extensions/context_ext.dart';

class ChatBackButton extends StatelessWidget {
  final String url;

  const ChatBackButton({
    Key key,
    @required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chat = sl<ChatStore>();
    return Observer(
      builder: (_) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (!chat.uploading) {
            Navigator.pop(context);
          } else {
            context.showToast('מעלה קובץ אנא המתן...');
          }
        },
        child: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Row(
              children: <Widget>[
                RotatedBox(
                  quarterTurns:
                      language.direction == LanguageDirection.ltr ? 2 : 0,
                  child: SvgPicture.asset('assets/images/back_arrow.svg',
                      height: 16.3, width: 16.3),
                ),
                SizedBox(width: 5.3),
                Stack(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: NetworkPhoto(
                      placeHolder: 'assets/images/group_placeholder.svg',
                      imageUrl: url,
                      height: 40,
                      width: 40,
                    ),
                  ),
                  Observer(
                    builder: (_) => Visibility(
                      visible: !chat.dataReady,
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: CircularProgressIndicator(
                          strokeWidth: 1,
                          valueColor: AlwaysStoppedAnimation(white),
                        ),
                      ),
                    ),
                  ),
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
