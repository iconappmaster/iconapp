import 'package:flutter/material.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/widgets/global/base_dialog.dart';
import 'package:iconapp/widgets/global/input_box.dart';
import 'package:iconapp/widgets/global/next_button.dart';
import '../../core/extensions/context_ext.dart';
import 'custom_text.dart';

enum ReportMode { block, abuse }
var _explanationText = '';

class ReportUserDialog extends StatelessWidget {
  final ReportMode mode;

  const ReportUserDialog({
    Key key,
    @required this.mode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = sl<ChatStore>();

    return Directionality(
      textDirection: TextDirection.ltr,
      child: BaseDialog(
        height: context
            .heightPlusStatusbarPerc(mode == ReportMode.abuse ? .42 : .35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomText(
                mode == ReportMode.abuse
                    ? 'Please tell us about the abuse. We Review all reported abuse within 24 hours'
                    : 'To block this conversation and members within it, tap Block',
                style: drawerName,
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 18),
            if (mode == ReportMode.abuse)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: InputText(
                  maxLength: null,
                  onChange: (text) => _explanationText = text,
                  hint: '',
                  hintStyle: systemMessage,
                  title: 'What you want to report',
                ),
              ),
            SizedBox(height: 18),
            Spacer(),
            NextButton(
                title: mode == ReportMode.block ? 'Block' : 'Continue',
                height: 50,
                onClick: () async {
                  mode == ReportMode.abuse
                      ? store.report(_explanationText)
                      : store.block();
                  Navigator.pop(context);
                }),
            SizedBox(height: 18),
          ],
        ),
      ),
    );
  }
}
