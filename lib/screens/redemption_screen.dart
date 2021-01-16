import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:iconapp/screens/purchase.dart';
import '../widgets/redemption/redemption_score_indicator.dart';
import '../core/dependencies/locator.dart';
import '../core/theme.dart';
import '../stores/redemption/redemption_store.dart';
import '../widgets/create/create_app_bar.dart';
import '../widgets/global/custom_text.dart';
import '../widgets/redemption/redemption_actions.dart';
import '../widgets/redemption/redemption_product.dart';
import '../widgets/redemption/redemption_codes.dart';
import '../core/extensions/context_ext.dart';
import 'package:iconapp/generated/locale_keys.g.dart';

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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Observer(
                        builder: (_) => AppBarWithDivider(
                            widget: RedemptionScoreIndicator(openRedemptionScreen: false),
                            title: store.title,
                            isArrowDirectionDown: true,
                            subtitle: store.subtitle)),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        height: context.heightPlusStatusbarPerc(.05),
                        child: CupertinoSlidingSegmentedControl(
                            thumbColor: cornflower,
                            groupValue: store.tabStateIndex,
                            children: _tabNamesMap(),
                            onValueChanged: (index) => store.setTabIndex(index))),
                    Expanded(
                      child: Observer(
                        builder: (_) {
                          switch (store.tabState) {
                            case RedemptionTabState.product:
                              return RedeemProduct();
                            case RedemptionTabState.actions:
                              return RedeemActions();
                            case RedemptionTabState.reedemCodes:
                              return RedeemCodes(store: store);
                            case RedemptionTabState.store:
                              return Purchase();
                          }
                          return SizedBox();
                        },
                      ),
                    )
                  ],
                ))));
  }

  Map<int, Widget> _tabNamesMap() => {
        0: CustomText(LocaleKeys.redemption_tabProducts.tr(), style: chatMessageName),
        1: CustomText(LocaleKeys.redemption_tabPAction.tr(), style: chatMessageName),
        2: CustomText(LocaleKeys.redemption_tabVauchers.tr(), style: chatMessageName),
        3: CustomText(LocaleKeys.redemption_tabStore.tr(), style: chatMessageName),
      };
}
