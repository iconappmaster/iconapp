import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/redemption_product.dart';
import 'package:iconapp/stores/redemption_store.dart';
import 'package:iconapp/widgets/global/basic_tile.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:iconapp/widgets/global/next_button.dart';
import '../../core/extensions/context_ext.dart';

class RedemptionProductTile extends StatelessWidget {
  final RedemptionProductModel product;

  const RedemptionProductTile({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = sl<RedemptionStore>();

    return Observer(
        builder: (_) => BasicTile(
            onTap: () {
              if (store.isEnoughMoney(product.price)) {
                return showModalBottomSheet(
                    elevation: 3,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomText(product?.name, style: dialogContent.copyWith(color: cornflower)),
                            SizedBox(height: 10),
                            SizedBox(
                              width: context.widthPx * .5,
                              child: NextButton(
                                height: 40,
                                title: 'Redeem',
                                onClick: () async {
                                  final result = await store.redeemProduct(product.id);
                                  result.fold((error) {
                                    error.when(
                                      noActiveRedemption: () =>
                                          context.showToast('Out of redemption codes, try later.'),
                                      noMoney: () => context.showToast('Not enough credits'),
                                      serverError: () => context.showToast('Server error'),
                                    );
                                  }, (redemption) {});
                                },
                              ),
                            )
                          ],
                        ),
                      );
                    });
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
                    borderRadius: BorderRadius.circular(12)),
                child: CustomText(product?.price.toString(),
                    style: dialogContent.copyWith(
                        color: store.isEnoughMoney(product.price) ? white : white.withOpacity(.7))))));
  }
}
