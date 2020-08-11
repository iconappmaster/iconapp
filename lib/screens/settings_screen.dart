import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/theme.dart';
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
              child: HebrewText('הגדרות', style: searchAppBarTitle)),
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
                  AppNotificationTile(
                      onTap: () => print('a'), title: 'השתקת התראות'),
                  _SettingsDivider(),
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
  final Function onTap;
  final String title;
  final bool isOn;

  const AppNotificationTile({
    Key key,
    @required this.onTap,
    @required this.title,
    this.isOn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 21.0),
          alignment: Alignment.centerRight,
          height: context.heightPlusStatusbarPerc(.113),
          child: HebrewText(title, style: appSettingsTile),
        ),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Switch(
            activeColor: cornflower,
            activeTrackColor: cornflower.withOpacity(.5),
            inactiveTrackColor: blueyGrey.withOpacity(.5),
            inactiveThumbColor: blueyGrey,
            value: true,
            onChanged: (value) => print(value),
          ),
        ),
      ],
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
        child: HebrewText(title, style: appSettingsTile),
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
