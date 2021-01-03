import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/redemption_product.dart';
import 'package:iconapp/stores/redemption_store.dart';
import 'package:iconapp/widgets/global/basic_tile.dart';
import 'package:iconapp/widgets/global/cupertino_loader.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:iconapp/widgets/redemption/redemption_dialog.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../core/extensions/context_ext.dart';

class RedeemBalance extends StatelessWidget {
  final store = sl<RedemptionStore>();
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Container(
        child: store.loading
            ? Center(child: CupertinoLoader())
            : store.redemptionProducts.isEmpty
                ? Center(child: CustomText('No product currently available', style: redemptionEmptystyle))
                : ListView.builder(
                    itemCount: store.redemptionProducts?.length,
                    itemBuilder: (context, index) => RedemptionProductTile(product: store.redemptionProducts[index])),
      ),
    );
  }
}

class RedemptionProductTile extends StatelessWidget {
  const RedemptionProductTile({
    Key key,
    @required this.product,
  }) : super(key: key);

  final RedemptionProductModel product;

  @override
  Widget build(BuildContext context) {
    final store = sl<RedemptionStore>();

    return BasicTile(
        onTap: () {
          if (store.isEnoughMoney(product.price)) {
            return showMaterialModalBottomSheet(
                bounce: true,
                elevation: 3,
                context: context,
                builder: (context, controller) => BasicTile(
                    left: CustomText(product?.name),
                    right: MaterialButton(
                        child: CustomText('Reedem'),
                        onPressed: () =>
                            showDialog(context: context, builder: (_) => RedemptionDialog(redemption: product)))));
          } else {
            context.showToast('Not enought credits to redeem. try to do more actions in the app to gain credit',
                duration: const Duration(seconds: 5));
          }
        },
        left: CustomText(product.name, style: dialogContent),
        right: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(
            color: cornflower,
            border: Border.all(color: store.isEnoughMoney(product.price) ? apple : Colors.transparent),
            borderRadius: BorderRadius.circular(12),
          ),
          child: CustomText(product?.price.toString(),
              style: dialogContent.copyWith(color: store.isEnoughMoney(product.price) ? white : white.withOpacity(.7))),
        ));
  }
}
