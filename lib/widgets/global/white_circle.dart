import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';

class WhiteCircle extends StatelessWidget {
  final Widget widget;
  final double size;
  const WhiteCircle({
    Key key,
    @required this.widget,
    this.size = 56,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Container(
        height: size,
        width: size,
        color: white,
        child: widget,
      ),
    );
  }
}
