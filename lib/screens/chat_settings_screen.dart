import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/widgets/chat/settings/change_background.dart';
import 'package:iconapp/widgets/chat/settings/notification_settings.dart';
import 'package:iconapp/widgets/chat/settings/participants_list.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';

const settingsColumnHeight = 80.0;

class ChatSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: false,
            expandedHeight: 195,
            title: HebrewText('sdfsdfs'),
            centerTitle: true,
            pinned: true,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            NotificationsSettings(),
            SettingsDivider(),
            ChangeBackground(),
            SettingsDivider(),
            ParticipentList(),
          ])),
        ],
      ),
    );
  }
}

class SettingsDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: darkIndigo2,
      height: 0,
      thickness: 0.3,
    );
  }
}
