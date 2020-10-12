import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/screens/chat_settings_screen.dart';
import 'package:iconapp/screens/create_icons_screen.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/stores/chat_settings/chat_settings_store.dart';
import 'package:iconapp/stores/create/create_icon_store.dart';
import 'package:iconapp/stores/user/user_store.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:iconapp/widgets/global/network_photo.dart';
import '../../../core/extensions/context_ext.dart';
import 'package:easy_localization/easy_localization.dart';

class ParticipentList extends StatelessWidget {
  const ParticipentList({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final settings = sl<ChatSettingsStore>();

    return Observer(
      builder: (_) => Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          children: <Widget>[
            ParticipentsListTitle(),
            ...settings.users
                .map((user) => ParticipantTile(currentUser: user))
                .toList(),
            if (settings.isUserAdmin) ParticipentAddButton(),
            if (settings.showUnsubscribeButton) UnsubscribeButton(),
          ],
        ),
      ),
    );
  }
}

class UnsubscribeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chat = sl<ChatStore>();
    final settings = sl<ChatSettingsStore>();
    return Observer(
      builder: (_) => Container(
        height: 50,
        margin: EdgeInsets.symmetric(horizontal: 21.3),
        width: double.infinity,
        child: OutlineButton(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 90),
          color: deepRed,
          borderSide: BorderSide(
            width: .8,
            color: cornflower,
          ),
          onPressed: () async {
            await chat.unsubscribe();
            settings.setUnsubscribeButton(false);
            context.showFlushbar(
              message: LocaleKeys.chat_exited.tr(),
              color: uiTintColorFill,
            );
          },
          child: chat.getState.loading
              ? SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(strokeWidth: 1))
              : CustomText(
                  LocaleKeys.chat_exit.tr(),
                  style: flushbar.copyWith(color: white),
                ),
        ),
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
              height: 45,
              width: 45,
              child: Stack(children: [
                if (settings.isLoadig)
                  SizedBox(
                      height: 45,
                      width: 45,
                      child: CircularProgressIndicator(backgroundColor: white)),
                FloatingActionButton(
                    heroTag: 'fab7',
                    elevation: 2,
                    backgroundColor: cornflower,
                    onPressed: () async {
                      sl<CreateIconStore>().clear();
                      final id = await ExtendedNavigator.of(context)
                          .pushSelectIconScreen(mode: SelectIconMode.fromChat);
                      settings.addUser(id);
                    },
                    child: SvgPicture.asset('assets/images/plus.svg',
                        height: 18, width: 18)),
              ]),
            ),
            SizedBox(width: 16),
            CustomText(
              LocaleKeys.chat_editGroup.tr(),
              style: addParticipent,
            )
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

    final conversation = chatStore.conversation;

    return Container(
      padding: EdgeInsets.only(left: 21, right: 21),
      height: settingsColumnHeight,
      child: Row(
        children: <Widget>[
          ParticipantAvatar(url: currentUser?.photo?.url),
          SizedBox(width: 11.3),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomText(currentUser?.fullName ?? '', style: nameLight),
              SizedBox(height: 12.3),
              if (conversation.userRole == UserRole.admin)
                Row(
                  children: <Widget>[
                    if (currentUser?.userRole != UserRole.admin &&
                        notMe(userStore.getUser?.id))
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: SettingsActionButton(
                          isAdminsLeft: settingsStore?.isAdminRemaining,
                          textStyle: settingsButton,
                          onTap: () =>
                              settingsStore.makeUserAdmin(currentUser.id),
                          text: LocaleKeys.chat_becomeManager.tr(),
                          width: 103,
                          borderColor: cornflower,
                        ),
                      ),
                    if (currentUser.userRole == UserRole.admin)
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          alignment: Alignment.center,
                          width: 60.7,
                          height: 30.7,
                          decoration: BoxDecoration(
                              color: cornflower,
                              borderRadius: BorderRadius.circular(2.7)),
                          child: CustomText(LocaleKeys.chat_manager.tr(),
                              style: settingsButton.copyWith(color: white)),
                        ),
                      ),
                    if (conversation.userRole == UserRole.admin &&
                        notMe(userStore.getUser?.id))
                      SettingsActionButton(
                        onTap: () => settingsStore.removeUser(currentUser?.id),
                        text: 'הסרה',
                        width: 60.7,
                        borderColor: blueberry2,
                        textStyle: settingsButton,
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
      height: 30,
      width: width,
      child: OutlineButton(
        padding: EdgeInsets.only(top: 5, bottom: 5),
        onPressed: isAdminsLeft ? onTap : null,
        color: backgroundColor ?? Colors.transparent,
        borderSide: BorderSide(color: borderColor, width: .7),
        child: CustomText(text, style: textStyle),
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
            url: url ?? '',
            placeHolder: 'assets/images/group_placeholder.svg',
          )),
    );
  }
}

class ParticipentsListTitle extends StatelessWidget {
  final conversation = sl<ChatStore>().conversation;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 21, right: 21),
      alignment: Alignment.centerRight,
      height: settingsColumnHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(LocaleKeys.chat_groupEditors.tr(), style: chatSettings),
          if (conversation.userRole != UserRole.viewer)
            AdminsCounter(
                adminsLeft: conversation?.numberOfAdminsRemaining ?? 0)
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
      padding: EdgeInsets.symmetric(horizontal: 18.7, vertical: 9),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.7),
          border: Border.all(color: cornflower, width: .7)),
      child: CustomText(
        LocaleKeys.chat_addManagers.tr(args: [adminsLeft.toString()]),
        style: settingsButton,
      ),
    );
  }
}
