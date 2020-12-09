import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/stores/language/language_store.dart';

import 'custom_text.dart';

class LanguageSwitch extends StatelessWidget {
  const LanguageSwitch({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: CupertinoSlidingSegmentedControl(
        thumbColor: cornflower,
        groupValue: language?.switchIndex,
        onValueChanged: (index) => language.setLangaugeFromSwitchIndex(index),
        children: {
          0: CustomText('English', style: chatMessageName),
          1: CustomText('עברית', style: chatMessageName)
        },
      ),
    );
  }
}
