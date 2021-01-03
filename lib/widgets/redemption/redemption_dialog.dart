import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/redemption_product.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/stores/language/language_store.dart';
import 'package:iconapp/widgets/global/base_dialog.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:iconapp/widgets/global/next_button.dart';
import '../../core/extensions/context_ext.dart';
import 'package:easy_localization/easy_localization.dart';

class RedemptionDialog extends StatelessWidget {
  final RedemptionProductModel redemption;

  const RedemptionDialog({
    Key key,
    @required this.redemption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      height: context.heightPlusStatusbarPerc(.5),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Positioned(
              top: 14.3,
              child: CustomText('Redemption Success',
                  textDirection: language.textDirection, textAlign: language.textAlign, style: dialogTitle)),
          Positioned(
              top: 48,
              child: Container(
                  height: context.heightPlusStatusbarPerc(.28),
                  width: context.widthPx * .66,
                  child: SingleChildScrollView(
                      child: CustomText(LocaleKeys.chat_welcomeContent.tr(),
                          style: dialogContent,
                          textAlign: language.textAlign,
                          textDirection: language.textDirection)))),
          Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: NextButton(
                      height: 44,
                      title: LocaleKeys.action_close.tr(),
                      onClick: () => ExtendedNavigator.of(context).pop()))),
        ],
      ),
    );
  }
}
