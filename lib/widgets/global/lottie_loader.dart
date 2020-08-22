import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieLoader extends StatelessWidget {
  final String asset;
  final double size;
  const LottieLoader({
    Key key,
    this.asset = 'assets/animations/loader.json',
    this.size = 250,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Lottie.asset(asset, height: size, width: size),
    );
  }
}
