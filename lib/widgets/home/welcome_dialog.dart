import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/stores/home/home_store.dart';
import 'package:iconapp/widgets/global/base_dialog.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/global/next_button.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../core/extensions/context_ext.dart';

class WelcomeDialog extends StatelessWidget {
  const WelcomeDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      height: context.heightPlusStatusbarPerc(.47),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Positioned(
              top: 14.3,
              child: HebrewText(LocaleKeys.welcome_title.tr(),
                  style: dialogTitle)),
          Positioned(
              top: 48,
              child: Container(
                height: context.heightPlusStatusbarPerc(.28),
                width: context.widthPx * .66,
                child: SingleChildScrollView(
                  child: HebrewText(LocaleKeys.welcome_content.tr(),
                      style: dialogContent, textAlign: TextAlign.start),
                ),
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: NextButton(
                height: 44,
                title: LocaleKeys.general_iGotIt.tr(),
                onClick: () => sl<HomeStore>().hideWelcomeDialog(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
