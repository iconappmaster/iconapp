import 'package:flutter/material.dart';

extension StringExtention on String {
  showImage() => this != null && this.isNotEmpty && this.startsWith('http')
      ? NetworkImage(this)
      : AssetImage(this);
}
