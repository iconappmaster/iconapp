import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/theme.dart';

/// use this feature on a multi-select list when you want to mark
/// an item checked

const circleSize = 24.0;

class CheckCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: circleSize,
      width: circleSize,
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: white),
          shape: BoxShape.circle,
          gradient: redPinkGradient),
      child: Center(
        child: SvgPicture.asset(
          'assets/images/check.svg',
          height: 9.7,
          width: 7.7,
        ),
      ),
    );
  }
}
