import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/product_model.dart';
import 'package:iconapp/data/models/redemption_redeem_model.dart';
import 'package:iconapp/domain/redemption/redemption_failure.dart';
import 'package:iconapp/stores/redemption/redemption_store.dart';
import 'package:iconapp/widgets/global/basic_tile.dart';
import 'package:iconapp/widgets/global/cupertino_loader.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import '../../core/extensions/context_ext.dart';
import 'package:cool_alert/cool_alert.dart';

class RedemptionProductTile extends StatelessWidget {
  final ProductModel product;

  const RedemptionProductTile({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = sl<RedemptionStore>();
    final textColor = store.isEnoughMoney(product.price) ? white : white.withOpacity(.7);
    return Observer(
      builder: (_) => BasicTile(
        onTap: () {
          if (store.isEnoughMoney(product.price)) {
            return showModalBottomSheet(
              elevation: 3,
              backgroundColor: iris,
              context: context,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomText(product?.name, style: dialogContent.copyWith(fontSize: 25, color: white)),
                      SizedBox(height: 20),
                      SizedBox(
                        width: context.widthPx * .5,
                        child: Observer(builder: (_) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: MaterialButton(
                              elevation: 0,
                              color: pinkish,
                              height: 40,
                              onPressed: () => store.redeemProduct(product.id).then((r) => r.fold(
                                  (error) => _handleError(error, context),
                                  (model) => _showRedeemSuccessDialog(context, model))),
                              child: store.redeemLoading
                                  ? CupertinoLoader(radius: 10)
                                  : CustomText('Redeem', style: dialogContent),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            context.showToast('Not enought credits to redeem. try to do more actions in the app to gain credit',
                duration: const Duration(seconds: 5));
          }
        },
        left: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(product.name, style: dialogContent.copyWith(color: textColor)),
            SizedBox(height: 3),
            SizedBox(
              width: MediaQuery.of(context).size.width * .7,
              child: Expanded(
                child: CustomText(
                  product.description,
                  style: dialogContent.copyWith(color: textColor.withOpacity(.5), fontSize: 12),
                  maxLines: 3,
                ),
              ),
            ),
          ],
        ),
        right: ProductPrice(
          store: store,
          product: product,
          textColor: textColor,
        ),
      ),
    );
  }

  Future _handleError(RedemptionFailure error, BuildContext context) async {
    Navigator.pop(context);
    error.when(
        noActiveRedemption: () => context.showToast('Out of redemption codes, try again later.'),
        noMoney: () => context.showToast('Not enough credits'),
        serverError: () => context.showToast('Server error'));
  }

  Future _showRedeemSuccessDialog(BuildContext context, RedemptionRedeemModel model) async {
    await Navigator.pop(context);
    CoolAlert.show(
      context: context,
      backgroundColor: cornflower,
      lottieAsset: 'assets/animations/vaucher.json',
      type: CoolAlertType.success,
      animType: CoolAlertAnimType.scale,
      cancelBtnText: 'Copy Code',
      confirmBtnColor: cornflower,
      title: 'Redeem Succesfull!',
      text: '${model.redemptionProduct.name}\nCode: ${model.redemptionProduct.redemptionCode}',
    );
  }
}

class ProductPrice extends StatelessWidget {
  const ProductPrice({
    Key key,
    @required this.store,
    @required this.product,
    @required this.textColor,
  }) : super(key: key);

  final RedemptionStore store;
  final ProductModel product;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
          color: cornflower,
          border: Border.all(color: store.isEnoughMoney(product.price) ? apple : Colors.transparent),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          CustomText(product?.price.toString(), style: dialogContent.copyWith(color: textColor)),
          SizedBox(width: 5),
          Image.asset(
            'assets/images/money.png',
            height: 15,
            width: 15,
          ),
        ],
      ),
    );
  }
}
