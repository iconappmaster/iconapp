import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../core/dependencies/locator.dart';
import '../../core/theme.dart';
import '../../stores/home/home_store.dart';
import '../../stores/language/language_store.dart';
import '../../stores/redemption_store.dart';
import '../global/custom_text.dart';
import '../onboarding/onboarding_appbar.dart';
import 'package:flutter/cupertino.dart';
import '../../routes/router.gr.dart';
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
        alignment: Alignment.centerRight,
        child: RedemptionScore(),
      ),
      widget: Align(
        alignment: language.direction == LanguageDirection.ltr ? Alignment.centerLeft : Alignment.centerRight,
        child: Observer(builder: (_) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              DrawerIcon(scaffoldKey: _scaffoldKey),
              SizedBox(width: 10),
              if (home.tabMode == TabMode.conversation) HomeFilter(),
            ],
          );
        }),
      ),
    );
  }
}

class RedemptionScore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final redemption = sl<RedemptionStore>();
    return GestureDetector(
      onTap: () => ExtendedNavigator.of(context).pushRedemptionScreen(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: cornflower),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Observer(builder: (_) => CustomText(redemption.userPointBalance?.toString(), style: lastWritten)),
            SizedBox(width: 5),
            Icon(Icons.money, color: white, size: 18),
          ],
        ),
      ),
    );
  }
}
