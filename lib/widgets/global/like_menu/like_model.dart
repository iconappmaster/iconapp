import 'package:flutter/material.dart';

class MenuModel {
  final String key;
  final String asset;
  final Function onPressed;
  final bool isSelected;

  const MenuModel({
    @required this.key,
    @required this.asset,
    @required this.onPressed,
    this.isSelected = false,
  });
}
