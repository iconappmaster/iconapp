import 'package:flutter/material.dart';
import '../../core/extensions/context_ext.dart';
import 'bs_icon_button.dart';

class BottomSheetActionButtons extends StatelessWidget {
  const BottomSheetActionButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.heightPlusStatusbarPerc(.109),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          BottomSheetIcon(
              rightPoistion: 35,
              asset: 'assets/images/icon_search.svg',
              onTap: () => {}),
          BottomSheetIcon(
              rightPoistion: 109,
              asset: 'assets/images/category_filter.svg',
              onTap: () => {})
        ],
      ),
    );
  }
}
