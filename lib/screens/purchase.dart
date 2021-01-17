import 'dart:async';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/bus.dart';
import 'package:iconapp/data/models/product_model.dart';
import 'package:iconapp/widgets/global/basic_tile.dart';
import 'package:lottie/lottie.dart';
import '../core/dependencies/locator.dart';
import '../core/theme.dart';
import '../generated/locale_keys.g.dart';
import '../stores/purchase/purchase_store.dart';
import '../widgets/global/cupertino_loader.dart';
import '../widgets/global/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';

class Purchase extends HookWidget {
  final store = sl<PurchaseStore>();
  final bus = sl<Bus>();

  @override
  Widget build(BuildContext context) {
    StreamSubscription _subscription;

    useEffect(() {
      _subscription = bus.on<PurchaseSuccess>().listen((event) {
        final details = event.purchaseDetails;
        CoolAlert.show(
          context: context,
          backgroundColor: dustyOrange,
          lottieAsset: 'assets/animations/purchase.json',
          type: CoolAlertType.success,
          animType: CoolAlertAnimType.scale,
          confirmBtnColor: cornflower,
          title: 'Thank you',
          text: 'You bought ${getPackageText(details.productID)} credits',
        );
      });

      store
        ..listenPurchaseEvents()
        ..getProductsFromStore();

      return () {
        _subscription?.cancel();
      };
    }, const []);

    return Observer(
      builder: (_) {
        if (store.loading) {
          return Center(child: CupertinoLoader());
        }

        return store.purchaseProducts.isEmpty
            ? Center(
                child: CustomText(LocaleKeys.redemption_storeEmpty.tr(),
                    textAlign: TextAlign.center, style: redemptionEmptystyle))
            : ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: store.purchaseProducts?.length,
                itemBuilder: (context, index) {
                  return PurchaseTile(
                    product: store.purchaseProducts[index],
                  );
                },
              );
      },
    );
  }

  String getPackageText(String productId) {
    if (productId.contains('small')) {
      return 'small pacakge';
    } else if (productId.contains('medium')) {
      return 'medium pacakge';
    } else if (productId.contains('big')) {
      return 'big pacakge';
    }

    return '';
  }
}

class PurchaseTile extends HookWidget {
  final ProductModel product;

  const PurchaseTile({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = sl<PurchaseStore>();

    return BasicTile(
      left: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LottieBuilder.asset('assets/animations/gold.json', height: animationSize(), width: animationSize()),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(product.name, style: dialogContent.copyWith(color: white)),
              SizedBox(height: 3),
              CustomText(
                product?.description,
                style: dialogContent.copyWith(color: white.withOpacity(.5), fontSize: 12),
                maxLines: 1,
              ),
            ],
          ),
        ],
      ),
      right: GestureDetector(
        onTap: () async {
          await store.consumeProduct(product.productId);
        },
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: cornflower,
            borderRadius: BorderRadiusDirectional.circular(2),
          ),
          child: CustomText(
            product.priceFormatted,
            style: dialogContent.copyWith(fontSize: 13),
          ),
        ),
      ),
    );
  }

  double animationSize() {
    if (product.productId.contains('small')) {
      return 40;
    } else if (product.productId.contains('medium')) {
      return 50;
    } else if (product.productId.contains('big')) {
      return 70;
    }
    return 40;
  }
}
