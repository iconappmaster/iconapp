import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/screens/chat_settings_screen.dart';
import 'package:iconapp/stores/chat_settings/chat_settings_store.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';

class ConversationNotificationsSettings extends StatelessWidget {
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
            HebrewText('השתקת התראות', style: chatSettings),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Switch(
                activeTrackColor: cornflower.withOpacity(.5),
                activeColor: cornflower,
                inactiveTrackColor: blueyGrey.withOpacity(.5),
                inactiveThumbColor: blueyGrey,
                value: settings.isNotification,
                onChanged: (value) => settings.setNotification(value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
