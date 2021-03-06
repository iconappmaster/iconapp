import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/bus.dart';
import 'package:iconapp/data/models/product_model.dart';
import 'package:iconapp/widgets/global/basic_tile.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
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
            title: 'Thank you!',
            text: 'You purchased the ${getPackageText(details.productID)}',
            onConfirmBtnTap: () {
              store.setConffettiAnimation(false);
              ExtendedNavigator.of(context).pop();
            });
      });

      store.getProductsFromStore();

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
            : Stack(
                children: [
                  ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: store.purchaseProducts?.length,
                    itemBuilder: (context, index) {
                      return PurchaseTile(
                        product: store.purchaseProducts[index],
                      );
                    },
                  ),
                  if (store.showConffetiAnimation)
                    Center(
                      child: LottieBuilder.asset('assets/animations/confetti.json'),
                    ),
                  ContactUs(),
                ],
              );
      },
    );
  }

  String getPackageText(String productId) {
    if (productId.contains('small')) {
      return 'small package';
    } else if (productId.contains('medium')) {
      return 'medium package';
    } else if (productId.contains('big')) {
      return 'big package';
    }

    return '';
  }
}

class ContactUs extends StatelessWidget {
  const ContactUs({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 12,
      bottom: 12,
      child: CupertinoButton(
        child: Row(
          children: [
            Icon(Icons.help, color: cornflower),
            SizedBox(width: 3),
            CustomText('Contact Us'),
          ],
        ),
        onPressed: () {
          final Uri _emailLaunchUri = Uri(
            scheme: 'mailto',
            path: 'office@icon-app.net',
            queryParameters: {
              'subject': 'IconApp',
            },
          );

          launch(_emailLaunchUri.toString());
        },
      ),
    );
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
              SizedBox(
                width: MediaQuery.of(context).size.width * .6,
                child: CustomText(
                  product?.name ?? '',
                  style: dialogContent.copyWith(color: white),
                ),
              ),
              SizedBox(height: 3),
              CustomText(
                product?.description ?? '',
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
            'Buy ${product?.priceFormatted}',
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
      return 60;
    }
    return 40;
  }
}
