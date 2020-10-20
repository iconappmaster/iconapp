import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/widgets/global/back_button.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:iconapp/widgets/login/login_background.dart';
import '../core/extensions/context_ext.dart';
import 'package:easy_localization/easy_localization.dart';

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
              child: CustomText(LocaleKeys.settings_title.tr(),
                  style: searchAppBarTitle)),
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
                  AppSettingsTile(
                      title: LocaleKeys.settings_friends.tr(),
                      onTap: () => 'tap'),
                  _SettingsDivider(),
                  AppSettingsTile(
                      title: LocaleKeys.settings_about.tr(),
                      onTap: () async =>
                          await showAboutDialog(context: context)),
                  _SettingsDivider(),
                  AppSettingsTile(title: 'מספר גירסה 1.0', onTap: () => 'tap'),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 25,
              child: CustomText('Developed by IconTech',
                  style: chatMessageBody.copyWith(color: Colors.black))),
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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.centerRight,
        height: context.heightPlusStatusbarPerc(.113),
        child: Padding(
          padding: const EdgeInsets.all(21.0),
          child: CustomText(title, style: appSettingsTile),
        ),
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
