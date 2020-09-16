import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/stores/user/user_store.dart';
import 'package:iconapp/widgets/global/back_button.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/login/login_background.dart';
import '../core/extensions/context_ext.dart';

class AppSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: <Widget>[
          LoginBackgroundImage(),
          Positioned(
              top: context.heightPlusStatusbarPerc(.188),
              child: SvgPicture.asset('assets/images/icon_logo.svg',
                  height: 169, width: 142)),
          Positioned(
            top: context.heightPlusStatusbarPerc(0.02),
            right: 16,
            child: IconBackButton(),
          ),
          Positioned(
              top: context.heightPlusStatusbarPerc(0.04),
              child: CustomText('הגדרות', style: searchAppBarTitle)),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: context.heightPlusStatusbarPerc(.45),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(13.3),
                    topRight: Radius.circular(13.3)),
              ),
              child: ListView(
                children: [
                  AppSettingsTile(title: 'הזמנת חברים', onTap: () => 'tap'),
                  _SettingsDivider(),
                  AppSettingsTile(title: 'אודות אייקון', onTap: () => 'tap'),
                  _SettingsDivider(),
                  AppSettingsTile(title: 'מספר גירסה', onTap: () => 'tap'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AppNotificationTile extends StatelessWidget {
  final String title;
  final bool isOn;

  const AppNotificationTile({
    Key key,
    @required this.title,
    this.isOn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userStore = sl<UserStore>();
    return Observer(
      builder: (_) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 21.0),
            alignment: Alignment.centerRight,
            height: context.heightPlusStatusbarPerc(.113),
            child: CustomText(title, style: appSettingsTile),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Switch(
                activeColor: cornflower,
                activeTrackColor: cornflower.withOpacity(.5),
                inactiveTrackColor: blueyGrey.withOpacity(.5),
                inactiveThumbColor: blueyGrey,
                value: userStore.isNotification,
                onChanged: (value) async =>
                    await userStore.setNotification(value),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppSettingsTile extends StatelessWidget {
  final Function onTap;
  final String title;

  const AppSettingsTile({Key key, @required this.onTap, @required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      height: context.heightPlusStatusbarPerc(.113),
      child: Padding(
        padding: const EdgeInsets.all(21.0),
        child: CustomText(title, style: appSettingsTile),
      ),
    );
  }
}

class _SettingsDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      endIndent: 0,
      height: 0,
      indent: 0,
      thickness: .3,
      color: darkIndigo2,
    );
  }
}
