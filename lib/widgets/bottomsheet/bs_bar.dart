import 'package:flutter/rendering.dart';
import 'package:iconapp/core/theme.dart';
import 'package:flutter/material.dart';

import 'bs_action_button.dart';

class BottomSheetBar extends StatelessWidget {
  final Function onTap;
  final bool showIconsSelected, showCategoriesSelected;
  const BottomSheetBar({
    Key key,
    this.onTap,
    this.showIconsSelected,
    this.showCategoriesSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 98.2,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(13.3),
                    topRight: Radius.circular(13.3)),
                color: plusBorder,
              ),
              child: BottomSheetActionButtons(
                onTap: onTap,
                isCategoriesSearchOn: showCategoriesSelected,
                isIconSearchOn: showIconsSelected,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
