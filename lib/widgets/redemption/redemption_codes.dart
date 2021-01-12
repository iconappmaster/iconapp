import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/clipboard.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/product_model.dart';
import 'package:iconapp/stores/redemption/redemption_store.dart';
import 'package:iconapp/widgets/global/basic_tile.dart';
import 'package:iconapp/widgets/global/cupertino_loader.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import '../../core/extensions/context_ext.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class RedeemCodes extends HookWidget {
  const RedeemCodes({
    Key key,
    @required this.store,
  }) : super(key: key);

  final RedemptionStore store;

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      store.getRedeemedProducts();
      return () {};
    }, const []);

    return Observer(
      builder: (_) {
        if (store.loading) return Center(child: CupertinoLoader());
        return Container(
          child: store.redeemedProducts.isEmpty
              ? Center(
                  child: CustomText(LocaleKeys.redemption_vaucherEmpty.tr(),
                      textAlign: TextAlign.center, style: redemptionEmptystyle))
              : ListView.builder(
                physics: BouncingScrollPhysics(),
                  itemCount: store.redeemedProducts?.length,
                  itemBuilder: (context, index) => RedeemedTile(
                    product: store.redeemedProducts[index],
                  ),
                ),
        );
      },
    );
  }
}

class RedeemedTile extends StatelessWidget {
  final ProductModel product;

  const RedeemedTile({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BasicTile(
      onTap: () {
        CoolAlert.show(
          context: context,
          backgroundColor: cornflower,
          lottieAsset: 'assets/animations/vaucher.json',
          type: CoolAlertType.success,
          animType: CoolAlertAnimType.scale,
          cancelBtnText: 'Copy Code',
          confirmBtnColor: cornflower,
          showCancelBtn: true,
          onCancelBtnTap: () async {
            Navigator.pop(context);
            FlutterClipboard.copy(product.redemptionCode);
            context.showFlushbar(message: 'Code copied to clipboard!', color: Colors.black);
          },
          title: 'Your vaucher code',
          text: product.redemptionCode,
        );
      },
      left: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(product.name, style: dialogContent.copyWith(color: white)),
          SizedBox(height: 3),
          CustomText(product.description, style: dialogContent.copyWith(color: white.withOpacity(.5), fontSize: 12)),
        ],
      ),
      right: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: cornflower,
          borderRadius: BorderRadiusDirectional.circular(2),
        ),
        child: CustomText(
          'Show Code',
          style: dialogContent.copyWith(fontSize: 13),
        ),
      ),
    );
  }
}
