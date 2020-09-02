import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/stop_watch.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/theme.dart';

class PanelMessageCompose extends StatefulWidget {
  final ScrollController controller;

  const PanelMessageCompose({Key key, @required this.controller})
      : super(key: key);
  @override
  _PanelMessageComposeState createState() => _PanelMessageComposeState();
}

class _PanelMessageComposeState extends State<PanelMessageCompose> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final store = sl<ChatStore>();
    return ListView(
      padding: EdgeInsets.all(0),
      shrinkWrap: true,
      children: <Widget>[
        Container(
          constraints: BoxConstraints(minHeight: 73.7),
          color: white,
          padding:
              EdgeInsets.only(top: 16, bottom: 16.3, left: 9.3, right: 9.3),
          child: Center(
            child: Container(
              constraints: BoxConstraints(minHeight: 41.3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26.4),
                color: paleGrey,
              ),
              child: Observer(
                builder: (_) => Stack(
                  alignment: Alignment.center,
                  children: [
                    if (!store.isRecording) ComposeActionButtons(),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: store.isRecording
                              ? Recorer(store: store)
                              : ComposerInput(controller: _controller),
                        ),
                        
                        SendButton(
                          textEditcontroller: _controller,
                          scrollController: widget.controller,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Recorer extends StatelessWidget {
  const Recorer({
    Key key,
    @required this.store,
  }) : super(key: key);

  final ChatStore store;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 15.3),
        SvgPicture.asset(
          'assets/images/microphone.svg',
          height: 18,
          width: 18,
        ),
        SizedBox(width: 8.7),
        RecordingTime(store: store),
      ],
    );
  }
}

class RecordingTime extends StatelessWidget {
  final ChatStore store;

  const RecordingTime({
    Key key,
    @required this.store,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: store.recordTimer?.rawTime,
      initialData: 0,
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          final timer = snapshot.data;
          final displayTime = StopWatchTimer.getDisplayTime(timer);
          print(displayTime);
          return HebrewText(
            displayTime,
            style: chatCompose,
          );
        }

        return Container();
      },
    );
  }
}

class ComposerInput extends StatelessWidget {
  final TextEditingController controller;

  const ComposerInput({Key key, @required this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final store = sl<ChatStore>();

    final transparentBorder =
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent));
    return Padding(
      padding: const EdgeInsets.only(left: 60.0, right: 10),
      child: TextFormField(
          autofocus: false,
          controller: controller,
          key: key,
          maxLines: null,
          decoration: InputDecoration(
              hintStyle: chatCompose,
              hintText: LocaleKeys.chat_messageInputHint.tr(),
              focusedBorder: transparentBorder,
              enabledBorder: transparentBorder,
              border: transparentBorder),
          onChanged: (input) => store.updateInputText(input),
          style: chatCompose),
    );
  }
}

class EmojiButton extends StatelessWidget {
  final Function onTap;

  const EmojiButton({Key key, @required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconButton(
      enableFeedback: true,
      onPressed: onTap,
      icon: SvgPicture.asset(
        'assets/images/emoji.svg',
        height: 25.7,
        width: 25.7,
      ),
    );
  }
}

class ComposeActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final margin = 10.0;
    final store = sl<ChatStore>();
    return Observer(
      builder: (_) => AnimatedPositioned(
        curve: Curves.linear,
        duration: Duration(milliseconds: 250),
        left: store.isInputEmpty ? margin : SendButton.size + margin,
        child: Row(
          children: <Widget>[
            _buildActionButton(
              'assets/images/camera.svg',
              onTap: () => store.sendPhotoMessage(ImageSource.camera),
              onLongTap: () => store.sendVideoMessage(ImageSource.camera),
            ),
            _buildActionButton(
              'assets/images/photo.svg',
              onTap: () => store.sendPhotoMessage(ImageSource.gallery),
              onLongTap: () => store.sendVideoMessage(ImageSource.gallery),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(String asset,
      {Function onTap, Function onLongTap}) {
    final size = 25.7;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.7),
      child: InkResponse(
        enableFeedback: true,
        onLongPress: onLongTap,
        onTap: onTap,
        child: SvgPicture.asset(asset, height: size, width: size),
      ),
    );
  }
}

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
            onLongPress: () => store.startRecording(),
            onLongPressEnd: (d) => store.stopRecordingAndSend(),
            child: FloatingActionButton(
              heroTag: 'send_button',
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
