import 'package:flutter/material.dart';

extension StringExtention on String {
  ImageProvider showImage() {
    return this != null && this.isNotEmpty && this.startsWith('http')
        ? NetworkImage(this)
        : AssetImage(this);
  }
}
