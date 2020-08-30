import 'package:flutter/material.dart';

class LikeModel {
  final String key;
  final String asset;
  final Function onPressed;
  final bool isSelected;

  const LikeModel({
    @required this.key,
    @required this.asset,
    @required this.onPressed,
    this.isSelected = false,
  });
}
