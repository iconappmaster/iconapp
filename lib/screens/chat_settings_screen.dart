import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/stores/comments/comments_store.dart';
import 'package:iconapp/widgets/chat/settings/comments_settings.dart';
import '../stores/chat_settings/chat_settings_store.dart';
import '../widgets/chat/settings/app_bar_sliver.dart';
import '../widgets/chat/settings/change_background.dart';
import '../widgets/chat/settings/notification_toggle.dart';
import '../widgets/chat/settings/participants_list.dart';

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
    final settings = sl<ChatSettingsStore>();
    final comments = sl<CommentsStore>();

    final iconSettings = [
      _SettingsDivider(),
      ParticipentList(),
    ];

    return Scaffold(
      backgroundColor: darkBlueGrey,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          Observer(
            builder: (_) => SliverPersistentHeader(
              delegate: ChatSettingsAppBar(
                  url: settings.getConversationPhoto,
                  subTitle: settings.getSubtitle),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              NotificationToggle(),
              _SettingsDivider(),
              if (settings.isUserAdmin) ...[
                ChangeBackground(),
                Observer(
                    builder: (_) =>
                        CommentsSettings(isActivated: comments.isActivated)),
              ],
              ...iconSettings
            ]),
          ),
        ],
      ),
    );
  }
}

class _SettingsDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: blueberry2,
      height: 0,
      thickness: 0.3,
    );
  }
}
