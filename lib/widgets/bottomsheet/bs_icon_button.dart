import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
    this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: rightPoistion,
      child: Material(
        color: Colors.transparent,
        child: IconButton(
          icon: SvgPicture.asset(
            asset,
            height: 35,
            width: 19.3,
          ),
          onPressed: onTap,
        ),
      ),
    );
  }
}
