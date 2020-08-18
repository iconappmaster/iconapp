import 'package:auto_route/auto_route.dart';
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
import 'package:iconapp/stores/create/create_icon_store.dart';
import 'package:iconapp/stores/user/user_store.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/global/network_photo.dart';

class ParticipentList extends StatelessWidget {
  const ParticipentList({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final store = sl<ChatSettingsStore>();

    return Observer(
      builder: (_) => Column(
        children: <Widget>[
          ParticipentsListTitle(),
          ...store.users.map((user) => ParticipantTile(currentUser: user)).toList(),
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
    return Observer(builder: (_) {
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
                      sl<CreateIconStore>().clear();
                      final id = await ExtendedNavigator.of(context).pushNamed(
                          Routes.selectIconScreen,
                          arguments: SelectIconScreenArguments(
                              mode: SelectIconMode.fromChat));

                      settings.addUser(id);
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
    });
  }
}

class ParticipantTile extends StatelessWidget {
  final UserModel currentUser;

  const ParticipantTile({Key key, @required this.currentUser})
      : super(key: key);

  bool notMe(int myId) => myId != currentUser.id;

  @override
  Widget build(BuildContext context) {
    final chatStore = sl<ChatStore>();
    final userStore = sl<UserStore>();
    final settingsStore = sl<ChatSettingsStore>();

    final conversation = chatStore.getState.conversation;

    return Observer(
      builder: (_) => Container(
        padding: EdgeInsets.only(left: 21, right: 21),
        height: settingsColumnHeight,
        child: Row(
          children: <Widget>[
            ParticipantAvatar(url: currentUser?.photo?.url ?? ''),
            SizedBox(width: 11.3),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                HebrewText(currentUser.fullName, style: nameDark),
                SizedBox(height: 12.3),
                if (conversation.userRole == UserRole.admin)
                  Row(
                    children: <Widget>[
                      // IF USER IS ADMIN AND NOT ME
                      if (currentUser.userRole != UserRole.admin && notMe(userStore.getUser.id))
                        Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: SettingsActionButton(
                                isAdminsLeft: settingsStore.isAdminLeft,
                                textStyle: settingsButton,
                                onTap: () =>  settingsStore.makeUserAdmin(currentUser.id),
                                text: 'הפוך למנהל/ת',
                                width: 103,
                                borderColor: cornflower,
                              ),
                            ),

                      // MARK AS ADMIN ANY ADMIN USER.
                      if (currentUser.userRole == UserRole.admin)
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            alignment: Alignment.center,
                            width: 60.7,
                            height: 23.7,
                            decoration: BoxDecoration(
                                color: cornflower,
                                borderRadius: BorderRadius.circular(2.7)),
                            child: HebrewText('מנהל/ת',
                                style: settingsButton.copyWith(color: white)),
                          ),
                        ),

                      // IF USER IS ADMIN AND NOT THE CURRENT USER SHOW REMOVE
                      if (conversation.userRole == UserRole.admin && notMe(userStore.getUser.id))
                        SettingsActionButton(
                          onTap: () => settingsStore.removeUser(currentUser.id),
                          text: 'הסרה',
                          width: 60.7,
                          borderColor: deepRed,
                          textStyle: settingsButton.copyWith(color: deepRed),
                        )
                    ],
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SettingsActionButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final double width;
  final TextStyle textStyle;
  final Color borderColor;
  final Color backgroundColor;
  final bool isAdminsLeft;

  const SettingsActionButton({
    Key key,
    @required this.text,
    @required this.onTap,
    @required this.width,
    @required this.borderColor,
    @required this.textStyle,
    this.backgroundColor,
    this.isAdminsLeft = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 23,
      width: width,
      child: OutlineButton(
        onPressed: isAdminsLeft ? onTap : null,
        color: backgroundColor ?? Colors.transparent,
        borderSide: BorderSide(color: borderColor, width: .7),
        child: HebrewText(text, style: textStyle),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.7)),
      ),
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
          child: NetworkPhoto(
              url: url, placeHolder: 'assets/images/group_placeholder.svg')),
    );
  }
}

class ParticipentsListTitle extends StatelessWidget {
  final adminsLeft = sl<ChatStore>()
          .getState
          .conversation
          ?.conversation
          ?.numberOfAdminsRemaining ?? 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 21, right: 21),
      alignment: Alignment.centerRight,
      height: settingsColumnHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HebrewText('עורכי הקבוצה', style: chatSettings),
          AdminsCounter(adminsLeft: adminsLeft)
        ],
      ),
    );
  }
}

class AdminsCounter extends StatelessWidget {
  final int adminsLeft;

  const AdminsCounter({Key key, @required this.adminsLeft}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.7, vertical: 7),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.7),
          border: Border.all(
              color: cornflower, style: BorderStyle.solid, width: .7)),
      child: HebrewText(
        'ניתן להוסיף עוד $adminsLeft עורכים',
        style: settingsButton,
      ),
    );
  }
}
