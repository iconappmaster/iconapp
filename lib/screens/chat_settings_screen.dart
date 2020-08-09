import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/stores/chat_settings/chat_settings_store.dart';
import 'package:iconapp/stores/user/user_store.dart';
import 'package:iconapp/widgets/chat/settings/app_bar_sliver.dart';
import 'package:iconapp/widgets/chat/settings/change_background.dart';
import 'package:iconapp/widgets/chat/settings/notification_settings.dart';
import 'package:iconapp/widgets/chat/settings/participants_list.dart';

const settingsColumnHeight = 80.0;

class ChatSettingsScreen extends StatefulWidget {
  const ChatSettingsScreen({
    Key key,
  }) : super(key: key);

  @override
  _ChatSettingsScreenState createState() => _ChatSettingsScreenState();
}

class _ChatSettingsScreenState extends State<ChatSettingsScreen> {
  @override
  void initState() {
    sl<ChatSettingsStore>()..init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final chatStore = sl<ChatStore>();
    final settingsStore = sl<ChatSettingsStore>();
    final conversation = chatStore.conversation;

    final iconSettings = [
      ChangeBackground(),
      _SettingsDivider(),
      ParticipentList(),
    ];

    return Observer(
      builder: (_) => Scaffold(
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverPersistentHeader(
              delegate: ChatSettingsAppBar(
                  url: conversation?.photo?.url ?? '',
                  title: conversation?.name ?? '',
                  subTitle: settingsStore.getSubtitle),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  NotificationsSettings(),
                  _SettingsDivider(),
                  if (sl<UserStore>().getUser.isIcon) ...iconSettings
                ],
              ),
            ),
          ],
        ),
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
