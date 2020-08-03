import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';

class BaseDialog extends StatelessWidget {
  final Widget child;
  final double height, width;

  const BaseDialog({Key key, @required this.child, this.height, this.width})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Opacity(
          opacity: .9,
          child: Dialog(
            elevation: 10,
            backgroundColor: Colors.transparent,
            child: Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(16),
              height: height,
              decoration: BoxDecoration(
                gradient: dialogGradient,
                borderRadius: BorderRadius.circular(5.6),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
