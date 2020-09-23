import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/routes/router.gr.dart';
import '../../core/dependencies/locator.dart';
import '../../core/theme.dart';
import '../../screens/onboarding_profile.dart';
import '../../stores/user/user_store.dart';
import '../global/buttons.dart';
import '../global/hebrew_input_text.dart';
import '../global/user_avatar.dart';
import 'disconnect_dialog.dart';

class DrawerIcon extends StatelessWidget {
  const DrawerIcon({
    Key key,
    @required GlobalKey<ScaffoldState> scaffoldKey,
  })  : _scaffoldKey = scaffoldKey,
        super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: IconButton(
        icon: SvgPicture.asset(
          'assets/images/menu_icon.svg',
          height: 36,
          width: 36,
          fit: BoxFit.cover,
        ),
        onPressed: () => _scaffoldKey.currentState.openDrawer(),
      ),
    );
  }
}

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = sl<UserStore>();
    return Drawer(
      child: Container(
        decoration: BoxDecoration(gradient: dialogGradient),
        child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.topCenter,
            children: [
              ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: <Widget>[
                  SizedBox(height: 39.3),
                  DrawerHeader(
                    child: Container(
                      height: 280,
                      child: Column(
                        children: <Widget>[
                          UserAvatar(
                              showPlus: false,
                              url: store.getUser?.photo?.url ?? '',
                              onTap: () => ExtendedNavigator.of(context)
                                  .pushOnboardingProfile(
                                      mode: OnboardingMode.drawer)),
                          SizedBox(height: 12.3),
                          CustomText(store.getUser?.fullName ?? 'Name',
                              style: drawerName)
                        ],
                      ),
                    ),
                  ),
                  _drawerDivider,
                  DrawerItem(
                      text: 'הפרופיל שלי',
                      onTap: () {
                        ExtendedNavigator.of(context)
                            .pushOnboardingProfile(mode: OnboardingMode.drawer);
                      }),
                  if (store.getUser.isIcon)
                    DrawerItem(text: 'נתוני פעילות הקבוצה', onTap: () {}),
                  DrawerItem(
                      text: 'הגדרות',
                      onTap: () => ExtendedNavigator.of(context)
                          .pushAppSettingsScreen()),
                ],
              ),
              Positioned(
                bottom: 22.7,
                child: TransparentButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    await showDialog(
                      context: context,
                      child: DisconnectDialog(
                        height: 250,
                      ),
                    );
                  },
                  text: 'להתנתק',
                ),
              ),
            ]),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String text;
  final Function onTap;

  const DrawerItem({
    Key key,
    @required this.text,
    @required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              margin: EdgeInsets.symmetric(horizontal: 31.7),
              alignment: Alignment.centerRight,
              height: 70,
              child: CustomText(text, style: flushbar)),
          _drawerDivider,
        ],
      ),
    );
  }
}

final _drawerDivider = Divider(color: white.withOpacity(.3));
