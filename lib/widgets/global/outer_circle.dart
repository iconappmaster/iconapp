import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';

class OuterCircle extends StatelessWidget {
  final Widget child;
  final Gradient gradient;

  const OuterCircle({
    Key key,
    @required this.child,
    @required this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // this container is the colored circle
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: gradient,
      ),
      // transparent child
      child: Center(
        child: Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: darkIndigo
          ),
          child: Center(child: child),
        ),
      ),
    );
  }
}
