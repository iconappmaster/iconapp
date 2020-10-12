import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/screens/chat_settings_screen.dart';
import 'package:iconapp/stores/chat_settings/chat_settings_store.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;

class NotificationToggle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = sl<ChatSettingsStore>();

    return Observer(
      builder: (_) => Container(
        height: settingsColumnHeight,
        padding: EdgeInsets.only(left: 21, right: 21),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CustomText(LocaleKeys.chat_notification.tr(), style: chatSettings),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Switch(
                activeTrackColor: cornflower.withOpacity(.5),
                activeColor: cornflower,
                inactiveTrackColor: blueyGrey.withOpacity(.5),
                inactiveThumbColor: blueyGrey,
                value: settings?.isNotificationDisabled ?? false,
                onChanged: (value) => settings.setNotification(value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
