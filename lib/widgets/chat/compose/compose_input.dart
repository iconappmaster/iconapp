import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import '../../../core/dependencies/locator.dart';
import '../../../core/theme.dart';
import '../../../stores/chat/chat_store.dart';

class ComposerInput extends StatelessWidget {
  final TextEditingController controller;

  const ComposerInput({
    Key key,
    @required this.controller,
  }) : super(key: key);
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
              filled: true,
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
