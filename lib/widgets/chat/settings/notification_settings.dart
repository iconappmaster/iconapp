import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/screens/chat_settings_screen.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';

class NotificationsSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
              activeColor: cornflower,
              activeTrackColor: cornflower.withOpacity(.5),
              inactiveTrackColor: blueyGrey.withOpacity(.5),
              inactiveThumbColor: blueyGrey,
              // value: store.notificationState,
              value: true,
              // onChanged: (value) => store.updateNotificationState(value),
              onChanged: (value) => print(value),
            ),
          ),
        ],
      ),
    );
  }
}
