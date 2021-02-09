import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/cupertino.dart';
import 'package:iconapp/helpers/tutorial.dart';
import 'package:iconapp/screens/alerts_screen.dart';
import 'package:iconapp/stores/alerts/alert_store.dart';
import 'package:iconapp/widgets/redemption/redemption_score_indicator.dart';
import 'package:showcaseview/showcaseview.dart';
import '../../core/dependencies/locator.dart';
import '../../stores/home/home_store.dart';
import '../../stores/language/language_store.dart';
import '../onboarding/onboarding_appbar.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'home_drawer.dart';
import 'home_filter.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({
    Key key,
    @required GlobalKey<ScaffoldState> scaffoldKey,
  })  : _scaffoldKey = scaffoldKey,
        super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    final home = sl<HomeStore>();
    final alerts = sl<AlertStore>();

    return IconAppbar(
      logo: Align(
          alignment: language.isLTR ? Alignment.centerRight : Alignment.centerLeft,
          child: Showcase(
              description: 'Redeem cool products or purchase credits',
              key: showcaseRedemptionButtonKey,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RedemptionScoreIndicator(),
                  SizedBox(width: 12),
                  BellAlert(
                    onPressed: () {
                      alerts.markAlertsAsSeen();
                      ExtendedNavigator.of(context).pushAlertScreen();
                    },
                  ),
                ],
              ))),
      widget: Align(
        alignment: language.direction == LanguageDirection.ltr ? Alignment.centerLeft : Alignment.centerRight,
        child: Observer(builder: (_) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              DrawerIcon(scaffoldKey: _scaffoldKey),
              SizedBox(width: 5),
              if (home.isConversationTab) HomeFilter(),
            ],
          );
        }),
      ),
    );
  }
}
