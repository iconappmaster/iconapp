import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/cupertino.dart';
import 'package:iconapp/helpers/tutorial.dart';
import 'package:iconapp/widgets/redemption/redemption_score_indicator.dart';
import 'package:showcaseview/showcase.dart';
import '../../core/dependencies/locator.dart';
import '../../stores/home/home_store.dart';
import '../../stores/language/language_store.dart';
import '../onboarding/onboarding_appbar.dart';
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

    return IconAppbar(
      logo: Align(
        alignment: language.isLTR ? Alignment.centerRight : Alignment.centerLeft,
        child: Showcase(
          description: 'store bla bla',
          
          key: tutorialStoreKey,
          child: RedemptionScoreIndicator()),
      ),
      widget: Align(
        alignment: language.direction == LanguageDirection.ltr ? Alignment.centerLeft : Alignment.centerRight,
        child: Observer(builder: (_) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              DrawerIcon(scaffoldKey: _scaffoldKey),
              SizedBox(width: 5),
              if (home.tabMode == TabMode.conversation) HomeFilter(),
            ],
          );
        }),
      ),
    );
  }
}
