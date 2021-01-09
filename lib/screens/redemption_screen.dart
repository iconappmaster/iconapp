import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/widgets/redemption/redemption_score_indicator.dart';
import '../core/dependencies/locator.dart';
import '../core/theme.dart';
import '../stores/redemption/redemption_store.dart';
import '../widgets/create/create_app_bar.dart';
import '../widgets/global/custom_text.dart';
import '../widgets/redemption/redemption_actions.dart';
import '../widgets/redemption/redemption_balance.dart';
import '../widgets/redemption/redemption_codes.dart';
import '../core/extensions/context_ext.dart';

class RedemptionScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final store = sl<RedemptionStore>();

    useEffect(() {
      store.getRedemptionProducts();
      return () {};
    }, const []);

    return Scaffold(
      body: Observer(
        builder: (_) => Container(
          decoration: BoxDecoration(gradient: purpleGradient),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Observer(
                  builder: (_) => AppBarWithDivider(
                      widget: RedemptionScoreIndicator(),
                      title: 'My Balance',
                      isArrowDirectionDown: true,
                      subtitle: store.subtitle)),
              Container(
                  height: context.heightPlusStatusbarPerc(.05),
                  child: Center(
                    child: CupertinoSlidingSegmentedControl(
                        thumbColor: cornflower,
                        groupValue: store.tabStateIndex,
                        children: _buildTabs(),
                        onValueChanged: (index) => store.setTabIndex(index)),
                  )),
              Expanded(
                child: Observer(
                  builder: (_) {
                    switch (store.tabState) {
                      case RedemptionTabState.balance:
                        return RedeemBalanceIndicator();
                      case RedemptionTabState.actions:
                        return RedeemActions();
                      case RedemptionTabState.reedemCodes:
                        return RedeemCodes(store: store);
                    }
                    return SizedBox();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Map<int, Widget> _buildTabs() => {
        0: CustomText('Products', style: chatMessageName),
        1: CustomText('Actions', style: chatMessageName),
        2: CustomText('My Vauchers', style: chatMessageName),
      };
}
