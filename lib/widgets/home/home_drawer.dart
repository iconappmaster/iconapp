import 'package:flutter/material.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/stores/user/user_store.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/global/user_avatar.dart';

class DrawerIcon extends StatelessWidget {
  const DrawerIcon({
    Key key,
    @required GlobalKey<ScaffoldState> scaffoldKey,
  })  : _scaffoldKey = scaffoldKey,
        super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.menu, color: Colors.white),
      onPressed: () => _scaffoldKey.currentState.openDrawer(),
    );
  }
}

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = sl<UserStore>();
    return Drawer(
      child: Container(
        decoration: BoxDecoration(gradient: dialogGradient),
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(height: 39.3),
            DrawerHeader(
                child: Container(
                    height: 280,
                    child: Column(children: <Widget>[
                      UserAvatar(
                        showPlus: false,
                        url: store.getUser?.photo?.url ?? '',
                        onTap: () => print('tap'),
                      ),
                      SizedBox(height: 12.3),
                      HebrewText(store.getUser?.fullName ?? 'Name',
                          style: drawerName)
                    ]))),
            _drawerDivider,
            DrawerItem(text: 'הפרופיל שלי', onTap: () {}),
            DrawerItem(text: 'נתוני פעילות הקבוצה', onTap: () {}),
            DrawerItem(text: 'הגדרות', onTap: () {}),
          ],
        ),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            margin: EdgeInsets.symmetric(horizontal: 31.7),
            alignment: Alignment.centerRight,
            height: 70,
            child: HebrewText(text, style: flushbar)),
        _drawerDivider,
      ],
    );
  }
}

final _drawerDivider = Divider(color: white.withOpacity(.3));
