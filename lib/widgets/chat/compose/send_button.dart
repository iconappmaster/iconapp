import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:permission_handler/permission_handler.dart';

class SendButton extends StatelessWidget {
  final TextEditingController textEditcontroller;
  final ScrollController scrollController;
  static double size = 37.7;

  const SendButton({
    Key key,
    @required this.textEditcontroller,
    @required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = sl<ChatStore>();
    return Observer(
      builder: (_) => Padding(
        padding: const EdgeInsets.only(left: 2, right: 7.3),
        child: SizedBox(
          height: size,
          width: size,
          child: GestureDetector(
            onLongPress: () async {
              final granted = await Permission.microphone.request().isGranted;
              if (granted) {
                store.startRecording();
              }
            },
            onLongPressEnd: (d) => store.stopRecordingAndSend(),
            child: FloatingActionButton(
              heroTag: 'fab6',
              elevation: 0,
              onPressed: () async {
                if (isMessageMode()) {
                  textEditcontroller.clear();
                  scrollController.jumpTo(0);
                  store.sendTextMessage();
                }
              },
              backgroundColor: cornflower,
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 250),
                transitionBuilder: (child, animation) => ScaleTransition(
                  scale: animation,
                  child: child,
                ),
                child: store.isInputEmpty
                    ? SvgPicture.asset('assets/images/send_icon.svg',
                        key: const Key('send'), height: 15.3, width: 15.3)
                    : SvgPicture.asset('assets/images/microphone.svg',
                        color: white,
                        key: const Key('mic'),
                        height: 15.3,
                        width: 15.3),
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool isMessageMode() => textEditcontroller.text.isNotEmpty;
}
