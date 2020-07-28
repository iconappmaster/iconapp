import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/widgets/chat/settings/app_bar_sliver.dart';
import 'package:iconapp/widgets/chat/settings/change_background.dart';
import 'package:iconapp/widgets/chat/settings/notification_settings.dart';
import 'package:iconapp/widgets/chat/settings/participants_list.dart';

const settingsColumnHeight = 80.0;

class ChatSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: ChatSettingsAppBar(
              url: 'https://medias.atmag.co.il/www/uploads/2018/05/H-1-10-600x600.jpg',
              title: 'האח הגדול',
              subTitle: 'האח הגדול',
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            NotificationsSettings(),
            _SettingsDivider(),
            ChangeBackground(),
            _SettingsDivider(),
            ParticipentList(),
          ])),
        ],
      ),
    );
  }
}

class _SettingsDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: darkIndigo2,
      height: 0,
      thickness: 0.3,
    );
  }
}
