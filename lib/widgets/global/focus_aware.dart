import 'package:flutter/material.dart';

// Will release focus when clicked on the child
class FocusAwareWidget extends StatelessWidget {
  final Widget child;

  const FocusAwareWidget({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: child,
        onTap: () => FocusScope.of(context).requestFocus(new FocusNode()));
  }
}
