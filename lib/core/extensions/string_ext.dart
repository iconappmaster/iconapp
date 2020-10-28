import 'package:flutter/material.dart';

extension StringExtention on String {
  ImageProvider showImage() {
    return this != null && this.isNotEmpty && this.startsWith('http')
        ? NetworkImage(this)
        : AssetImage(this);
  }

  String parseEnum() {
    if (this == null) return null;
    final _tmp = this.toString().split('.')[1];
    return _tmp;
  }

  bool isValidAddress() => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(this);
}
