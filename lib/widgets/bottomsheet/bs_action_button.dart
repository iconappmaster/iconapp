import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/stores/search/search_store.dart';
import '../../core/extensions/context_ext.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/theme.dart';

class BottomSheetActionButtons extends StatelessWidget {
  final Function onTap;
  final bool isIconSearchOn, isCategoriesSearchOn;
  const BottomSheetActionButtons({
    Key key,
    @required this.onTap,
    this.isIconSearchOn,
    this.isCategoriesSearchOn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = sl<SearchStore>();

    return Container(
      height: context.heightPlusStatusbarPerc(.109),
      child: Observer(
        builder: (_) {
          print(store.getSearchMode == SearchMode.categories);
          return Stack(
            alignment: Alignment.center,
            children: <Widget>[
              BottomSheetIcon(
                  isSelected: isIconSearchOn != null
                      ? isIconSearchOn
                      : store.getSearchMode == SearchMode.icons,
                  rightPoistion: 13.3,
                  asset: 'assets/images/icon_search.svg',
                  onTap: () {
                    store.setSearchMode(SearchMode.icons);
                    if(onTap != null) onTap();
                  }),
              BottomSheetIcon(
                isSelected: isCategoriesSearchOn != null
                    ? isCategoriesSearchOn
                    : store.getSearchMode == SearchMode.categories,
                rightPoistion: 87.3,
                asset: 'assets/images/category_filter.svg',
                onTap: () {
                  store.setSearchMode(SearchMode.categories);
                  if(onTap != null) onTap();
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

// Represents an icon on the bottom sheet
class BottomSheetIcon extends StatelessWidget {
  final String asset;
  final Function onTap;
  final bool isSelected;
  final double rightPoistion;

  const BottomSheetIcon({
    Key key,
    @required this.asset,
    @required this.rightPoistion,
    this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: rightPoistion,
      child: Container(
        height: 74,
        width: 74,
        child: Material(
          color: Colors.transparent,
          child: Stack(
            children: <Widget>[
              Center(
                  child: IconButton(
                      icon: SvgPicture.asset(
                        asset,
                        height: 35,
                        width: 19.3,
                        color: isSelected ? pinkRed : avatarRing,
                      ),
                      onPressed: onTap)),
              if (isSelected)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 8,
                    width: 74,
                    decoration: BoxDecoration(
                      gradient: redPinkGradient,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
