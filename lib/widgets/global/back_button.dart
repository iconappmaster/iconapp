import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/theme.dart';

class IconBackButton extends StatelessWidget {
  final Function onBackTap;
  final bool isArrowDirectionDown;
  const IconBackButton({
    Key key,
    this.onBackTap,
    this.isArrowDirectionDown = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: EdgeInsets.all(0),
        icon: isArrowDirectionDown ? Icon(Icons.keyboard_arrow_down, color: white, size: 34,) : SvgPicture.asset('assets/images/back_arrow.svg',
      height: 16.3, width: 16.3),
        onPressed: () {
    Navigator.pop(context);
    if (onBackTap != null) onBackTap();
        },
      );
  }
}