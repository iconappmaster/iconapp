// Can handle both SVG or other type automatically
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NetworkPhoto extends StatelessWidget {
  final String url;
  final double height, width;
  final BorderRadiusGeometry radius;

  const NetworkPhoto({
    Key key,
    @required this.url,
    this.height = 70.0,
    this.width = 70.0,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return url.endsWith('.svg')
        ? ClipRRect(
            borderRadius: radius ?? BorderRadius.circular(5),
            child: SvgPicture.network(
              url,
              placeholderBuilder: (_) => PhotoPlaceHolder(),
              fit: BoxFit.cover,
              height: height,
              width: width,
            ))
        : ClipRRect(
            borderRadius: radius ?? BorderRadius.circular(5),
            child: CachedNetworkImage(
              height: height,
              width: width,
              fit: BoxFit.cover,
              imageUrl: url,
              placeholder: (_, url) => PhotoPlaceHolder(),
            ));
  }
}

class PhotoPlaceHolder extends StatelessWidget {
  final double size;
  final String placeHolder;

  const PhotoPlaceHolder({
    Key key,
    this.size = 70,
    this.placeHolder = 'assets/images/placeholder.svg',
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      placeHolder,
      height: size,
      width: size,
    );
  }
}
