import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iconapp/screens/alerts_screen.dart';
import 'package:iconapp/stores/alerts/alert_store.dart';
import 'package:iconapp/stores/language/language_store.dart';
import 'package:iconapp/widgets/onboarding/onboarding_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:iconapp/routes/router.gr.dart';

import 'home_drawer.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({
    Key key,
    @required GlobalKey<ScaffoldState> scaffoldKey,
    @required this.alerts,
  })  : _scaffoldKey = scaffoldKey,
        super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey;
  final AlertStore alerts;

  @override
  Widget build(BuildContext context) {
    return IconAppbar(
      widget: Align(
        alignment: language.direction == LanguageDirection.ltr
            ? Alignment.centerLeft
            : Alignment.centerRight,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            DrawerIcon(scaffoldKey: _scaffoldKey),
            SizedBox(width: 8),
            BellAlert(onPressed: () {
              alerts.markAlertsAsSeen();
              ExtendedNavigator.of(context).pushAlertScreen();
            })
          ],
        ),
      ),
    );
  }
}
