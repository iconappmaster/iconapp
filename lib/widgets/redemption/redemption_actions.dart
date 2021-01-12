import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/redemption_action_model.dart';
import 'package:iconapp/stores/redemption/redemption_store.dart';
import 'package:iconapp/widgets/global/basic_tile.dart';
import 'package:iconapp/widgets/global/cupertino_loader.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class RedeemActions extends HookWidget {
  final store = sl<RedemptionStore>();
  @override
  Widget build(BuildContext context)  {
    useEffect(() {
      store.getRedemptionActions();
      return () {};
    }, const []);

    return Observer(
      builder: (_) => store.loading
          ? Center(child: CupertinoLoader())
          : Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                CustomText('points earned - ${store.totalPoints.toString()}', style: redemptionEmptystyle),
                store.creditActions.isEmpty
                    ? Center(child: CustomText(LocaleKeys.redemption_actionsEmpty.tr(), style: redemptionEmptystyle))
                    : Container(
                        child: Expanded(
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                                itemCount: store.creditActions?.length,
                                itemBuilder: (context, index) =>
                                    RedemptionActionTile(actions: store.creditActions[index])))),
              ],
            ),
    );
  }
}

class RedemptionActionTile extends StatelessWidget {
  final RedemptionActionModel actions;

  const RedemptionActionTile({Key key, this.actions}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BasicTile(
      left: Expanded(
        child: CustomText(
          actions.creditActionName,
          style: dialogContent.copyWith(fontSize: 12),
        ),
      ),
      right: Row(
        children: [
          CustomText(
            '${actions.pointsReceived}',
            style: dialogContent.copyWith(fontSize: 12),
          ),
          SizedBox(width: 4),
          Image.asset(
            'assets/images/money.png',
            height: 18,
            width: 18,
          ),
        ],
      ),
    );
  }
}
