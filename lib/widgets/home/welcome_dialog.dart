import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import '../global/hebrew_input_text.dart';
import '../global/base_dialog.dart';
import '../global/next_button.dart';
import '../../core/theme.dart';
import '../../core/extensions/context_ext.dart';

class WelcomeDialog extends StatelessWidget {
  final Function onTap;

  const WelcomeDialog({Key key, @required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      height: context.heightPlusStatusbarPerc(.47),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Positioned(
              top: 14.3,
              child: CustomText(LocaleKeys.welcome_title.tr(),
                  style: dialogTitle)),
          Positioned(
              top: 48,
              child: Container(
                height: context.heightPlusStatusbarPerc(.28),
                width: context.widthPx * .66,
                child: SingleChildScrollView(
                  child: CustomText(LocaleKeys.welcome_content.tr(),
                      style: dialogContent, textAlign: TextAlign.start),
                ),
              )),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: NextButton(
                    height: 44,
                    title: LocaleKeys.general_iGotIt.tr(),
                    onClick: onTap)),
          )
        ],
      ),
    );
  }
}
