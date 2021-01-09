import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/stores/redemption/redemption_store.dart';
import 'package:iconapp/widgets/global/cupertino_loader.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:iconapp/widgets/redemption/redemption_product_tile.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class RedeemProduct extends StatelessWidget {
  final store = sl<RedemptionStore>();
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (store.loading) {
          return Center(child: CupertinoLoader());
        }

        return Container(
          child: store.redemptionProducts.isEmpty
              ? Center(child: CustomText(LocaleKeys.redemption_productEmpty.tr(), style: redemptionEmptystyle))
              : ListView.builder(
                  itemCount: store.redemptionProducts?.length,
                  itemBuilder: (context, index) {
                    return RedemptionProductTile(product: store.redemptionProducts[index]);
                  }),
        );
      },
    );
  }
}
