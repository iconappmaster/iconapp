import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/screens/chat_settings_screen.dart';
import 'package:iconapp/screens/create_icons_screen.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/stores/chat_settings/chat_settings_store.dart';
import 'package:iconapp/stores/user/user_store.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';

class ParticipentList extends StatelessWidget {
  const ParticipentList({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final store = sl<ChatSettingsStore>();

    return Observer(
      builder: (_) => Column(
        children: <Widget>[
          ParticipentsListTitle(),
          ...store.users.map((u) => ParticipantTile(user: u)).toList(),
          ParticipentAddButton(),
        ],
      ),
    );
  }
}

class ParticipentAddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = sl<ChatSettingsStore>();
    return Container(
      padding: EdgeInsets.only(left: 21, right: 21),
      height: settingsColumnHeight,
      child: Row(
        children: <Widget>[
          SizedBox(
            height: 37,
            width: 37,
            child: Stack(children: [
              if (settings.isLoadig) CircularProgressIndicator(),
              FloatingActionButton(
                  elevation: 2,
                  backgroundColor: cornflower,
                  onPressed: () async {
                    final id = await ExtendedNavigator.of(context).pushNamed(
                        Routes.selectIconScreen,
                        arguments: SelectIconScreenArguments(
                            mode: SelectIconMode.fromChat));

                    sl<ChatSettingsStore>().addUser(id);
                  },
                  child: SvgPicture.asset('assets/images/plus.svg',
                      height: 15, width: 15)),
            ]),
          ),
          SizedBox(width: 16),
          HebrewText('הוספת עורכ/ת לקבוצה', style: addParticipent)
        ],
      ),
    );
  }
}

class ParticipantTile extends StatelessWidget {
  final UserModel user;

  const ParticipantTile({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chatStore = sl<ChatStore>();
    final settingsStore = sl<ChatSettingsStore>();
    final userStore = sl<UserStore>();

    final userRole = chatStore.getState.conversation.userRole;

    return Container(
      padding: EdgeInsets.only(left: 21, right: 21),
      height: settingsColumnHeight,
      child: Row(
        children: <Widget>[
          ParticipantAvatar(url: user.photo.url),
          SizedBox(width: 11.3),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              HebrewText(user.fullName, style: nameDark),
              SizedBox(height: 12.3),
              if (userRole == UserRole.admin)
                Row(
                  children: <Widget>[
                    // sow make an admin only on contributers
                    if (user.userRole == UserRole.contributor)
                      SettingsActionButton(
                          textStyle: settingsButton,
                          onTap: () => settingsStore.makeUserAdmin(user.id),
                          text: 'הפוך למנהל/ת',
                          width: 103,
                          color: cornflower),
                    SizedBox(width: 12),
                    // dont show delete on my user
                    if (userStore.getUser.id != user.id)
                      SettingsActionButton(
                        onTap: () => settingsStore.removeUser(user.id),
                        text: 'הסרה',
                        width: 60.7,
                        color: deepRed,
                        textStyle: settingsButton.copyWith(color: deepRed),
                      )
                  ],
                )
            ],
          )
        ],
      ),
    );
  }
}

class SettingsActionButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final double width;
  final TextStyle textStyle;
  final Color color;

  const SettingsActionButton({
    Key key,
    @required this.text,
    @required this.onTap,
    @required this.width,
    @required this.color,
    @required this.textStyle,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 23,
      width: width,
      child: OutlineButton(
          borderSide: BorderSide(color: color, width: .7),
          child: HebrewText(
            text,
            style: textStyle,
          ),
          onPressed: onTap,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.7))),
    );
  }
}

class ParticipantAvatar extends StatelessWidget {
  final String url;

  const ParticipantAvatar({
    Key key,
    @required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 53.7,
      width: 53.7,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.3),
        child: CachedNetworkImage(imageUrl: url, fit: BoxFit.cover),
      ),
    );
  }
}

class ParticipentsListTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 21, right: 21),
      alignment: Alignment.centerRight,
      height: settingsColumnHeight,
      child: HebrewText(
        'עורכי הקבוצה',
        style: chatSettings,
      ),
    );
  }
}
