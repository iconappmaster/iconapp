import 'package:chat_pickers/chat_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/theme.dart';
import '../../core/extensions/context_ext.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

class MessageComposer extends StatefulWidget {
  @override
  _MessageComposerState createState() => _MessageComposerState();
}

class _MessageComposerState extends State<MessageComposer> {
  bool showEmoji = false;
  bool keyboardVisible = false;
  int subscriberId = 0;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    subscriberId = KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          keyboardVisible = visible;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final store = sl<ChatStore>();
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Container(
          constraints: BoxConstraints(minHeight: 73.7),
          color: white,
          padding: EdgeInsets.only(
            top: 16,
            bottom: 16.3,
            left: 9.3,
            right: 9.3,
          ),
          child: Center(
            child: Container(
              constraints: BoxConstraints(minHeight: 41.3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.4),
                color: paleGrey,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ComposeActionButtons(),
                  Row(
                    children: <Widget>[
                      EmojiButton(onTap: () => _onEmojiButtonTap(context)),
                      ComposerInput(controller: _controller),
                      SendButton(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 750),
            curve: Curves.linearToEaseOut,
            height: showEmoji && !keyboardVisible
                ? context.heightPlusStatusbarPerc(.4)
                : 0,
            child: WillPopScope(
              onWillPop: _onWillPop,
              child: EmojiPicker(
                bgColor: Colors.white,
                bgBarColor: Colors.white,
                indicatorColor: cornflower,
                hintText: 'חפש אימוג׳ים',
                buttonMode: ButtonMode.MATERIAL,
                rows: 3,
                columns: 7,
                numRecommended: 10,
                onEmojiSelected: (text, category) {
                  _controller.text = _controller.text + text.emoji;
                  store.updateInputMessage(_controller.text);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _onEmojiButtonTap(BuildContext context) {
    return setState(() {
      context.unFocus();
      showEmoji = !showEmoji;
    });
  }

  Future<bool> _onWillPop() async {
    //FIXME
    setState(() {
      if (showEmoji) {
        showEmoji = !showEmoji;
      }
    });

    return showEmoji;
  }

  @override
  void dispose() {
    KeyboardVisibilityNotification().removeListener(subscriberId);
    super.dispose();
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
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 60.0),
        child: TextFormField(
          controller: controller,
          key: key,
          maxLines: null,
          decoration: InputDecoration(
              hintStyle: chatCompose,
              hintText: LocaleKeys.chat_messageInputHint.tr(),
              focusedBorder: transparentBorder,
              enabledBorder: transparentBorder,
              border: transparentBorder),
          onChanged: (input) {
            return store.updateInputMessage(input);
          },
          style: chatCompose,
        ),
      ),
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
        left: store.shouldHideActions ? margin : SendButton.size + margin,
        child: Row(
          children: <Widget>[
            _buildActionButton('assets/images/camera.svg',
                () => store.takeShot(ImageSource.camera)),
            _buildActionButton('assets/images/photo.svg',
                () => store.takeShot(ImageSource.gallery)),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(String asset, Function onTap) {
    final size = 25.7;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.7),
      child: InkResponse(
        enableFeedback: true,
        onTap: onTap,
        child: SvgPicture.asset(asset, height: size, width: size),
      ),
    );
  }
}

class SendButton extends StatelessWidget {
  static double size = 37.7;
  @override
  Widget build(BuildContext context) {
    final store = sl<ChatStore>();
    return Observer(
      builder: (_) => Padding(
        padding: const EdgeInsets.only(left: 2, right: 7.3),
        child: SizedBox(
          height: size,
          width: size,
          child: FloatingActionButton(
            elevation: 0,
            onPressed: () {},
            backgroundColor: cornflower,
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 250),
              transitionBuilder: (child, animation) => ScaleTransition(
                scale: animation,
                child: child,
              ),
              child: store.shouldHideActions
                  ? SvgPicture.asset(
                      'assets/images/send_icon.svg',
                      key: const Key('send'),
                      height: 15.3,
                      width: 15.3,
                    )
                  : SvgPicture.asset(
                      'assets/images/microphone.svg',
                      color: white,
                      key: const Key('mic'),
                      height: 15.3,
                      width: 15.3,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
