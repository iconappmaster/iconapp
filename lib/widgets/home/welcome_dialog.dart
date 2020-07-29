import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/stores/home/home_store.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/global/next_button.dart';
import '../../core/extensions/context_ext.dart';
import 'package:easy_localization/easy_localization.dart';

class WelcomeDialog extends StatelessWidget {
  const WelcomeDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
      child: Opacity(
        opacity: .9,
        child: Dialog(
          elevation: 10,
          backgroundColor: Colors.transparent,
          child: Container(
            height: context.heightPlusStatusbarPerc(.47),
            width: context.widthPx * .88,
            decoration: BoxDecoration(
                gradient: dialogGradient,
                borderRadius: BorderRadius.circular(5.6)),
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
                      width: 274,
                      child: HebrewText(
                        LocaleKeys.welcome_content.tr(),
                        style: dialogContent,
                        textAlign: TextAlign.start,
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16.3,
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: NextButton(
                      title: LocaleKeys.general_iGotIt.tr(),
                      onClick: () {
                        sl<HomeStore>().hideWelcomeDialog();
                      },
                      height: context.heightPlusStatusbarPerc(.05),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
