import 'package:flutter/material.dart';

class LoginBackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Image.asset('assets/images/bg.jpg'),
      fit: BoxFit.cover,
    );
  }
}
