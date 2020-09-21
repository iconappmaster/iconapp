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
    return Container(
      constraints: BoxConstraints(minHeight: 73.7),
      color: white,
      padding: EdgeInsets.only(top: 0, bottom: 16.3, left: 9.3, right: 9.3),
      child: Observer(
        builder: (_) => Column(
          children: [
            ReplyComposePanel(),
            Center(
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
                                  ? Recorder(store: store)
                                  : ComposerInput(controller: _controller)),
                          SendButton(
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
      ),
    );
  }
}
