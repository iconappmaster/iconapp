import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/screens/chat_settings_screen.dart';
import 'package:iconapp/stores/chat_settings/chat_settings_store.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';

class ParticipentList extends StatelessWidget {
  final List<UserModel> users;

  const ParticipentList({Key key, @required this.users}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ParticipentsListTitle(),
        ...users.map((u) => ParticipantItem(user: u)).toList(),
        ParticipentAddButton(),
      ],
    );
  }
}

class ParticipentAddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 21, right: 21),
      height: settingsColumnHeight,
      child: Row(
        children: <Widget>[
          SizedBox(
            height: 37,
            width: 37,
            child: FloatingActionButton(
              elevation: 2,
              backgroundColor: cornflower,
              onPressed: () => print('add'),
              child: SvgPicture.asset(
                'assets/images/plus.svg',
                height: 10,
                width: 10,
              ),
            ),
          ),
          SizedBox(width: 16),
          HebrewText('הוספת עורכ/ת לקבוצה', style: addParticipent)
        ],
      ),
    );
  }
}

class ParticipantItem extends StatelessWidget {
  final UserModel user;

  const ParticipantItem({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = sl<ChatSettingsStore>();
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
              if (user.role == UserRole.admin)
                Row(
                  children: <Widget>[
                    SettingsActionButton(
                        textStyle: settingsButton,
                        onTap: () =>  store.makeUserAdmin(user),
                        text: 'הפוך למנהל/ת',
                        width: 103,
                        color: cornflower),
                    SizedBox(width: 12),
                    SettingsActionButton(
                      onTap: () => store.removeUser(user),
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
