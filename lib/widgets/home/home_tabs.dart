import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/helpers/tutorial.dart';
import 'package:iconapp/stores/home/home_store.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:flutter/rendering.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:showcaseview/showcase.dart';

class HomeTabSwitch extends StatelessWidget {
  const HomeTabSwitch({
    Key key,
    @required HomeStore home,
  })  : _home = home,
        super(key: key);

  final HomeStore _home;

  @override
  Widget build(BuildContext context) {
    return Showcase(
      description: 'Choose conversation or media content',
      key: showcaseConversationSwitchKey,
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 12, top: 8),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Observer(builder: (_) {
            return CupertinoSlidingSegmentedControl(
              thumbColor: cornflower,
              groupValue: _home?.getCurrentTabIndex,
              children: {
                0: CustomText(LocaleKeys.home_conversation.tr(), style: chatMessageName),
                1: CustomText(LocaleKeys.home_media.tr(), style: chatMessageName),
              },
              onValueChanged: (index) {
                HapticFeedback.lightImpact();
                _home.setTabMode(index == 0 ? TabMode.conversation : TabMode.media);

                if (_home.tabMode == TabMode.media) {
                  _home.getUserMedia();
                }
              },
            );
          }),
        ),
      ),
    );
  }
}
