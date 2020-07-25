import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';

class BlueDivider extends StatelessWidget {
  final Color color;

  const BlueDivider({Key key, this.color = darkBlueGrey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color,
      endIndent: 0,
      indent: 0,
      thickness: 1,
      height: 0,
    );
  }
}
