import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/redemption_action_model.dart';
import 'package:iconapp/stores/redemption_store.dart';
import 'package:iconapp/widgets/global/basic_tile.dart';
import 'package:iconapp/widgets/global/cupertino_loader.dart';
import 'package:iconapp/widgets/global/custom_text.dart';

class RedeemActions extends HookWidget {
  final store = sl<RedemptionStore>();
  @override
  Widget build(BuildContext context) {
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
                CustomText('Points earned: ${store.totalPoints.toString()}', style: redemptionEmptystyle),
                store.creditActions.isEmpty
                    ? Center(child: CustomText('No redeem action has been taken', style: redemptionEmptystyle))
                    : Container(
                        child: Expanded(
                          child: ListView.builder(
                            itemCount: store.creditActions?.length,
                            itemBuilder: (context, index) => RedemptionActionTile(actions: store.creditActions[index]),
                          ),
                        ),
                      ),
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
      left: CustomText(
        actions.creditActionName,
        style: dialogContent,
      ),
      right: CustomText(
        '${actions.pointsReceived}  points received',
        style: dialogContent,
      ),
    );
  }
}
