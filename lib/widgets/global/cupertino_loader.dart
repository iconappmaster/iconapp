import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoLoader extends StatelessWidget {
  const CupertinoLoader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
          cupertinoOverrideTheme: CupertinoThemeData(
            brightness: Brightness.dark,
          ),
        ),
        child: CupertinoActivityIndicator(radius: 25));
  }
}
