import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/widgets/global/focus_aware.dart';

class BaseGradientWidget extends StatelessWidget {
  final Widget child;

  const BaseGradientWidget({Key key, @required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FocusAwareWidget(
        child: Container(
          decoration: BoxDecoration(gradient: purpleGradient),
          child: child,
        ),
      ),
    );
  }
}
