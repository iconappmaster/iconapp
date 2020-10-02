import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/widgets/chat/compose/send_button.dart';
import 'compose_action_buttons.dart';
import 'compose_input.dart';
import 'reply_widgets.dart';
import 'recorder.dart';
import '../../../core/dependencies/locator.dart';
import '../../../stores/chat/chat_store.dart';
import '../../../core/theme.dart';

enum ComposerPanelMode { conversation, comments }

class PanelMessageCompose extends StatefulWidget {
  final ScrollController controller;
  final ComposerPanelMode composerMode;

  const PanelMessageCompose({
    Key key,
    @required this.controller,
    @required this.composerMode,
  }) : super(key: key);
  @override
  _PanelMessageComposeState createState() => _PanelMessageComposeState();
}

class _PanelMessageComposeState extends State<PanelMessageCompose> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final store = sl<ChatStore>();
    return Container(
      constraints: BoxConstraints(minHeight: 73.7),
      color: composerPanelBackground,
      padding: EdgeInsets.only(top: 0, bottom: 16.3, left: 9.3, right: 9.3),
      child: Column(
        children: [
          ReplyComposePanel(),
          Center(
            child: Container(
              constraints: BoxConstraints(minHeight: 41.3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26.4),
                  color: composerBackground),
              child: Observer(
                builder: (_) => Stack(
                  alignment: Alignment.center,
                  children: [
                    if (!store.isRecording &&
                        widget.composerMode == ComposerPanelMode.conversation)
                      ComposeActionButtons(),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: store.isRecording
                                ? Recorder(store: store)
                                : ComposerInput(
                                    controller: _controller,
                                    composerPanelMode: widget.composerMode,
                                  )),
                        SendButton(
                            composerMode: widget.composerMode,
                            textEditcontroller: _controller,
                            scrollController: widget.controller)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
