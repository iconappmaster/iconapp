import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/firebase/crashlytics.dart';
import 'panel_compose.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vibration/vibration.dart';
import '../../../core/dependencies/locator.dart';
import '../../../core/theme.dart';
import '../../../stores/chat/chat_store.dart';
import '../../../stores/comments/comments_store.dart';
import '../../../core/extensions/context_ext.dart';

class SendButton extends StatelessWidget {
  final TextEditingController textEditcontroller;
  final ScrollController scrollController;
  static double size = 37.7;
  final ComposerPanelMode composerMode;

  const SendButton({
    Key key,
    @required this.textEditcontroller,
    @required this.scrollController,
    this.composerMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chat = sl<ChatStore>();
    final comments = sl<CommentsStore>();
    return Padding(
      padding: const EdgeInsets.only(left: 2, right: 7.3),
      child: SizedBox(
        height: size,
        width: size,
        child: GestureDetector(
          onLongPress: () async {
            final granted = await Permission.microphone.request().isGranted;
            if (granted) {
              await Vibration.vibrate(duration: 300);
              chat.startRecording();
            }
          },
          onLongPressEnd: (d) => chat.stopRecordingAndSend(),
          child: FloatingActionButton(
            heroTag: 'fab',
            elevation: 0,
            onPressed: () async {
              switch (composerMode) {
                case ComposerPanelMode.conversation:
                  if (isMessageMode()) {
                    textEditcontroller.clear();
                    scrollController.jumpTo(0);
                    chat.sendTextMessage();
                  }
                  break;

                case ComposerPanelMode.comments:
                  if (chat.conversation.areCommentsActivated) {
                    textEditcontroller.clear();

                    final result = await comments.sendComment();
                    result.fold(
                      (error) => error.maybeWhen(
                        messageEmpty: () => print('meesage empty'),
                        serverError: (e) => Crash.report(e),
                        orElse: () => print(''),
                        // exceededMaxCount: context.showFlushbar(
                        //     message: 'הקבוצה נסגרה לתגובות בשלב זה.'),
                      ),
                      (success) => print('comment sent!'),
                    );
                  } else {
                    context.showFlushbar(message: 'הערות לא פעילות כרגע');
                  }
                  break;
              }
            },
            backgroundColor: sendColor,
            child: Observer(
              builder: (_) => AnimatedSwitcher(
                duration: Duration(milliseconds: 250),
                transitionBuilder: (child, animation) => ScaleTransition(
                  scale: animation,
                  child: child,
                ),
                child: composerMode == ComposerPanelMode.conversation
                    ? chat.isInputEmpty ? _sendIcon() : _recordIcon()
                    : _sendIcon(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  SvgPicture _recordIcon() {
    return SvgPicture.asset('assets/images/microphone.svg',
        color: white, key: const Key('mic'), height: 15.3, width: 15.3);
  }

  SvgPicture _sendIcon() {
    return SvgPicture.asset('assets/images/send_icon.svg',
        key: const Key('send'), height: 15.3, width: 15.3);
  }

  bool isMessageMode() => textEditcontroller.text.isNotEmpty;
}
