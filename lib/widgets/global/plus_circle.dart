
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/theme.dart';

/// Global Circle with plus mark in the middle and a border
class PlusCircle extends StatelessWidget {
  const PlusCircle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      width: 38,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: cornflower,
          border: Border.all(width: 4, color: plusBorder)),
      child: Center(
        child: SvgPicture.asset(
          'assets/images/plus.svg',
          color: white,
          height: 14.7,
          width: 14.7,
        ),
      ),
    );
  }
}
