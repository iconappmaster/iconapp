import 'package:flutter/material.dart';

class WhiteCircle extends StatelessWidget {
  final Widget widget;

  const WhiteCircle({
    Key key,
    @required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Container(color: Colors.white, child: widget),
    );
  }
}
