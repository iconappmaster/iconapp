import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/widgets/global/back_button.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:iconapp/widgets/login/login_background.dart';
import 'package:package_info/package_info.dart';
import '../core/extensions/context_ext.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:social_share/social_share.dart';

final whatsappMessage =
    "Hi, Check out ICON!\nPlayStore: https://play.google.com/store/apps/details?id=com.icon.iconapp\nAppStore: https://apps.apple.com/app/id1528197266";
final developedBy = 'Developed by IconTech';

class AppSettingsScreen extends StatefulWidget {
  @override
  _AppSettingsScreenState createState() => _AppSettingsScreenState();
}

class _AppSettingsScreenState extends State<AppSettingsScreen> {
  String appVer = '';
  @override
  void initState() {
    super.initState();
    getVersion();
  }

  Future getVersion() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      appVer = info.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: <Widget>[
          LoginBackgroundImage(),
          Positioned(
              top: context.heightPlusStatusbarPerc(.118),
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
              height: context.heightPlusStatusbarPerc(.55),
              decoration: BoxDecoration(
                color: darkIndigo,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(13.3),
                    topRight: Radius.circular(13.3)),
              ),
              child: ListView(
                children: [
                  AppSettingsTile(
                    title: LocaleKeys.settings_friends.tr(),
                    onTap: () => SocialShare.shareWhatsapp(
                      whatsappMessage,
                    ),
                  ),
                  _SettingsDivider(),
                  AppSettingsTile(
                    title: LocaleKeys.settings_about.tr(),
                    onTap: () => showAboutDialog(context: context),
                  ),
                  _SettingsDivider(),
                  AppSettingsTile(title: 'Version $appVer', onTap: () => 'tap'),
                  _SettingsDivider(),
                  LanguageSwitch(),
                  _SettingsDivider(),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 8,
              child: CustomText(developedBy,
                  style: chatMessageBody.copyWith(color: white))),
        ],
      ),
    );
  }
}

class LanguageSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(21),
      height: context.heightPlusStatusbarPerc(.11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            LocaleKeys.settings_language.tr(),
            style: appSettingsTile.copyWith(color: white, fontSize: 18),
          ),
          CupertinoSlidingSegmentedControl(
            thumbColor: cornflower,
            groupValue: 0,
            children: {
              0: CustomText('English', style: chatMessageName),
              1: CustomText('עברית', style: chatMessageName)
            },
            onValueChanged: (v) {},
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
    return GestureDetector(
        onTap: onTap,
        child: Container(
            padding: EdgeInsets.all(21),
            height: context.heightPlusStatusbarPerc(.11),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(title,
                    style:
                        appSettingsTile.copyWith(color: white, fontSize: 18)),
              ],
            )));
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
      color: whiteOpacity50,
    );
  }
}
