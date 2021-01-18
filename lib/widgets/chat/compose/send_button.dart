import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/firebase/crashlytics.dart';
import 'package:iconapp/stores/language/language_store.dart';
import 'compose_panel.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../core/dependencies/locator.dart';
import '../../../core/theme.dart';
import '../../../stores/chat/chat_store.dart';
import '../../../stores/comments/comments_store.dart';
import '../../../core/extensions/context_ext.dart';

class SendButton extends StatefulWidget {
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
  _SendButtonState createState() => _SendButtonState();
}

class _SendButtonState extends State<SendButton> {
  @override
  Widget build(BuildContext context) {
    final chat = sl<ChatStore>();
    final comments = sl<CommentsStore>();
    return Padding(
      padding: const EdgeInsets.only(left: 2, right: 7.3),
      child: SizedBox(
        height: SendButton.size,
        width: SendButton.size,
        child: GestureDetector(
          onLongPress: () async {
            final granted = await Permission.microphone.request().isGranted;
            if (granted) {
              HapticFeedback.lightImpact();
              chat.startRecording();
            }
          },
          onLongPressEnd: (d) async {
            await chat.stopRecordingAndSend();
            setState(() {});
          },
          child: Observer(
            builder: (_) => FloatingActionButton(
              heroTag: 'fab',
              elevation: 0,
              onPressed: () async {
                switch (widget.composerMode) {
                  case ComposerPanelMode.conversation:
                    if (isMessageMode()) {
                      widget.textEditcontroller.clear();
                      widget.scrollController.jumpTo(0);
                      chat.sendTextMessage();
                    }
                    break;

                  case ComposerPanelMode.comments:
                    if (chat.conversation.areCommentsActivated) {
                      widget.textEditcontroller.clear();

                      final result = await comments.sendComment();
                      result.fold(
                        (error) => error.maybeWhen(
                          messageEmpty: () => print('meesage empty'),
                          serverError: (e) => Crash.report(e),
                          orElse: () => print(''),
                        ),
                        (success) => print('comment sent!'),
                      );
                    } else {
                      context.showFlushbar(message: 'הערות לא פעילות כרגע');
                    }
                    break;
                }
              },
              backgroundColor: chat.dataReady ? sendColor : Colors.grey[400],
              child: Observer(
                builder: (_) => AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  transitionBuilder: (child, animation) => ScaleTransition(
                    scale: animation,
                    child: child,
                  ),
                  child: widget.composerMode == ComposerPanelMode.conversation
                      ? chat.isInputEmpty
                          ? _sendIcon()
                          : _recordIcon()
                      : _sendIcon(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _recordIcon() {
    return SvgPicture.asset('assets/images/microphone.svg',
        color: white, key: const Key('mic'), height: 15.3, width: 15.3);
  }

  Widget _sendIcon() {
    return RotatedBox(
      quarterTurns: language.isLTR ? 2 : 0,
      child: SvgPicture.asset('assets/images/send_icon.svg',
          key: const Key('send'), height: 15.3, width: 15.3),
    );
  }

  bool isMessageMode() => widget.textEditcontroller.text.isNotEmpty;
}
