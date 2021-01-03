import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/stores/language/language_store.dart';
import 'package:iconapp/stores/redemption_store.dart';
import 'package:iconapp/stores/user/user_store.dart';
import 'package:iconapp/widgets/global/back_button.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:iconapp/widgets/global/language_switch_tile.dart';
import 'package:iconapp/widgets/home/disconnect_dialog.dart';
import 'package:iconapp/widgets/login/login_background.dart';
import 'package:package_info/package_info.dart';
import '../core/extensions/context_ext.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:social_share/social_share.dart';

final whatsappMessage =
    "Hi, Check out ICON!\nPlayStore: https://play.google.com/store/apps/details?id=com.icon.iconapp\nAppStore: https://apps.apple.com/app/id1528197266";

final developedBy = 'Developed by IconTech';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final redemption = sl<RedemptionStore>();
  final user = sl<UserStore>();
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
              child: SvgPicture.asset('assets/images/icon_logo.svg', height: 169, width: 142)),
          Positioned(
            right: language.isLTR ? 0 : null,
            left: language.isLTR ? null : 0,
            top: context.heightPlusStatusbarPerc(.025),
            child: MaterialButton(
              child: CustomText('LOGOUT', style: chatMessageBody),
              onPressed: () async {
                Navigator.pop(context);
                await showDialog(context: context, builder: (_) => DisconnectDialog(height: 250));
              },
            ),
          ),
          Positioned(
              top: context.heightPlusStatusbarPerc(.025),
              right: language.isLTR ? null : 16,
              left: language.isLTR ? 16 : null,
              child: IconBackButton()),
          Positioned(
              top: context.heightPlusStatusbarPerc(0.04),
              child: CustomText(LocaleKeys.settings_title.tr(), style: searchAppBarTitle)),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: context.heightPlusStatusbarPerc(.55),
              decoration: BoxDecoration(
                  color: darkIndigo,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(13.3), topRight: Radius.circular(13.3))),
              child: ListView(
                children: [
                  AppSettingsTile(
                      title: LocaleKeys.settings_friends.tr(),
                      onTap: () async {
                        final u = await redemption.setCreditActionPoints(CreditActionType.share);
                        user.updateUser(u);
                        return SocialShare.shareWhatsapp(whatsappMessage);
                      }),
                  _SettingsDivider(),
                  AppSettingsTile(
                      title: LocaleKeys.settings_about.tr(), onTap: () => showAboutDialog(context: context)),
                  _SettingsDivider(),
                  AppSettingsTile(title: 'Version $appVer', onTap: () => 'tap'),
                  _SettingsDivider(),
                  LanguageSwitchTile(),
                  _SettingsDivider(),
                ],
              ),
            ),
          ),
          Positioned(bottom: 8, child: CustomText(developedBy, style: chatMessageBody.copyWith(color: white))),
        ],
      ),
    );
  }
}

class AppSettingsTile extends StatelessWidget {
  final Function onTap;
  final String title;

  const AppSettingsTile({Key key, @required this.onTap, @required this.title}) : super(key: key);
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
                CustomText(title, style: appSettingsTile.copyWith(color: white, fontSize: 18)),
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
