import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/widgets/global/focus_aware.dart';

class BaseGradientBackground extends StatelessWidget {
  final Widget child;
  final Gradient gradient;

  const BaseGradientBackground({Key key, @required this.child, this.gradient})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FocusAwareWidget(
        child: Container(
          decoration: BoxDecoration(
            gradient: gradient ?? purpleGradient,
          ),
          child: child,
        ),
      ),
    );
  }
}
