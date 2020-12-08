import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/stores/language/language_store.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../core/extensions/context_ext.dart';
import 'custom_text.dart';

class LanguageSwitchTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(21),
      height: context.heightPlusStatusbarPerc(.11),
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

class LanguageSwitch extends StatelessWidget {
  const LanguageSwitch({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return CupertinoSlidingSegmentedControl(
        thumbColor: cornflower,
        groupValue: language?.switchIndex,
        onValueChanged: (index) => language.setLangaugeFromSwitchIndex(index),
        children: {
          0: CustomText('English', style: chatMessageName),
          1: CustomText('עברית', style: chatMessageName)
        },
      );
    });
  }
}
