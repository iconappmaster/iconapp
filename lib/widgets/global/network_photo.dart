// Can handle both SVG or other type automatically
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/extensions/string_ext.dart';

class NetworkPhoto extends StatelessWidget {
  final String url;
  final double height, width;
  final BorderRadiusGeometry radius;

  const NetworkPhoto({
    Key key,
    @required this.url,
    this.height = 70,
    this.width = 70,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return url.endsWith('.svg')
        ? SvgPicture.network(
            url,
            height: height,
            width: width,
          )
        : Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: radius,
              image: DecorationImage(image: url.showImage()),
            ),
          );
  }
}