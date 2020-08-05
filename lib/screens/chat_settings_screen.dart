import 'package:flutter/material.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/stores/user/user_store.dart';
import 'package:iconapp/widgets/chat/settings/app_bar_sliver.dart';
import 'package:iconapp/widgets/chat/settings/change_background.dart';
import 'package:iconapp/widgets/chat/settings/notification_settings.dart';
import 'package:iconapp/widgets/chat/settings/participants_list.dart';

const settingsColumnHeight = 80.0;

class ChatSettings extends StatelessWidget {
  final Conversation conversation;

  const ChatSettings({Key key, this.conversation}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final store = sl<UserStore>();

    final iconSettings = [
      ChangeBackground(),
      _SettingsDivider(),
      ParticipentList(users: conversation.users)
    ];

    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: ChatSettingsAppBar(
              url: conversation.photo.url,
              title: conversation.name,
              subTitle: conversation.name,
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            NotificationsSettings(),
            _SettingsDivider(),
            if (store.getUser.isIcon) ...iconSettings
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
