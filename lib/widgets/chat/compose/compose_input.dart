import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/stores/comments/comments_store.dart';
import 'package:iconapp/stores/language/language_store.dart';
import 'package:iconapp/widgets/chat/compose/compose_panel.dart';
import 'package:iconapp/widgets/global/auto_direction.dart';
import '../../../core/dependencies/locator.dart';
import '../../../core/theme.dart';
import '../../../stores/chat/chat_store.dart';

class ComposerInput extends StatelessWidget {
  final TextEditingController controller;
  final ComposerPanelMode composerPanelMode;

  const ComposerInput({
    Key key,
    @required this.controller,
    @required this.composerPanelMode,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final chat = sl<ChatStore>();
    final comment = sl<CommentsStore>();

    final transparentBorder = UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    );
    return Observer(
      builder: (_) => AutoDirection(
        text: chat.getState.inputMessage,
        child: TextFormField(
          textAlign: language.textAlign,
          autofocus: false,
          controller: controller,
          key: key,
          maxLines: null,
          decoration: InputDecoration(
              filled: true,
              hintStyle: chatCompose,
              hintText: LocaleKeys.chat_messageInputHint.tr(),
              focusedBorder: transparentBorder,
              enabledBorder: transparentBorder,
              border: transparentBorder),
          onChanged: (input) {
            switch (composerPanelMode) {
              case ComposerPanelMode.conversation:
                chat.updateMessageInput(input);
                break;
              case ComposerPanelMode.comments:
                comment.updateCommentInput(input);
                break;
            }
          },
          style: chatCompose,
        ),
      ),
    );
  }
}
