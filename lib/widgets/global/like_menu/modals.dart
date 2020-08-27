import 'package:flutter/material.dart';

class FocusedMenuItem {
  final String key;
  final String asset;
  final Function onPressed;

  FocusedMenuItem({
    @required this.key,
    @required this.asset,
    @required this.onPressed,
  });
}
