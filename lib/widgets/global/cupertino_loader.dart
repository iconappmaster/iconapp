import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoLoader extends StatelessWidget {
  final double radius;

  const CupertinoLoader({
    Key key,
    this.radius = 15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
          cupertinoOverrideTheme: CupertinoThemeData(
            brightness: Brightness.dark,
          ),
        ),
        child: CupertinoActivityIndicator(
          
          radius: radius,
        ));
  }
}
