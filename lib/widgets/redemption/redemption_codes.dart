import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/clipboard.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/redemption_product.dart';
import 'package:iconapp/stores/redemption_store.dart';
import 'package:iconapp/widgets/global/basic_tile.dart';
import 'package:iconapp/widgets/global/cupertino_loader.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:iconapp/widgets/global/next_button.dart';
import 'package:iconapp/widgets/redemption/redemption_balance.dart';
import '../../core/extensions/context_ext.dart';

class RedeemCodes extends HookWidget {
  const RedeemCodes({
    Key key,
    @required this.store,
  }) : super(key: key);

  final RedemptionStore store;

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      store.getRedemptionProducts();
      return () {};
    }, const []);

    return Observer(
      builder: (_) {
        if (store.loading) {
          return Center(child: CupertinoLoader());
        }
        return Container(
            child: store.codes.isEmpty
                ? Center(
                    child: CustomText('No code, try to redeem a product first',
                        textAlign: TextAlign.center, style: dialogTitle.copyWith(fontSize: 16)))
                : ListView.builder(
                    itemCount: store.codes?.length,
                    itemBuilder: (context, index) => RedemptionProductTile(product: store.codes[index])));
      },
    );
  }
}

class RedemptionCodeTile extends StatelessWidget {
  final RedemptionProductModel product;

  const RedemptionCodeTile({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BasicTile(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(product.name, style: dialogContent),
                SizedBox(height: 8),
                CustomText(product.redemptionCode..toString(), style: dialogContent),
                SizedBox(height: 16),
                NextButton(
                  title: 'Copy Code',
                  onClick: () async {
                    await FlutterClipboard.copy(product.redemptionCode);
                    context.showToast('Code was copied to your clipboard!');
                  },
                ),
              ],
            );
          },
        );
      },
      left: CustomText(product.name, style: dialogContent),
      right: CustomText(product.redemptionCode.substring(0, 4).toString(), style: dialogContent),
    );
  }
}