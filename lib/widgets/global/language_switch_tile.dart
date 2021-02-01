import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../core/extensions/context_ext.dart';
import 'custom_text.dart';
import 'langauge_switch.dart';

class LanguageSwitchTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(21),
      height: context.heightPlusStatusbarPerc(.14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(LocaleKeys.settings_language.tr(),
              style: appSettingsTile.copyWith(color: white, fontSize: 18)),
          LanguageSwitch(),
        ],
      ),
    );
  }
}
