// Can handle both SVG or other type automatically
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/theme.dart';

class NetworkPhoto extends StatelessWidget {
  final String url;
  final double height, width;
  final String placeHolder;
  final double placeHolderPadding, placeHolderSize;

  const NetworkPhoto({
    Key key,
    @required this.url,
    this.height,
    this.width,
    this.placeHolderPadding = 20,
    this.placeHolder,
    this.placeHolderSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return url?.endsWith('.svg') ?? false
        ? SvgPicture.network(
            url,
            height: height,
            width: width,
            fit: BoxFit.cover,
            placeholderBuilder: (_) => placeHolder != null
                ? Container(
                    padding: EdgeInsets.all(placeHolderPadding),
                    child: PhotoPlaceHolder(
                      height: height,
                      width: width,
                      placeHolder: placeHolder,
                      placeHolderSize: placeHolderSize,
                    ),
                  )
                : Container(),
          )
        : CachedNetworkImage(
            fadeOutDuration: Duration(milliseconds: 250),
            progressIndicatorBuilder: (context, url, progress) => Center(
                child: SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 2))),
            height: height,
            width: width,
            fit: BoxFit.cover,
            imageUrl: url,
            placeholder: (_, url) {
              return PhotoPlaceHolder(
                height: placeHolderSize ?? height,
                width: placeHolderSize ?? width,
                placeHolder:
                    placeHolder ?? 'assets/imagees/group_placeholder.svg',
              );
            },
          );
  }
}

class PhotoPlaceHolder extends StatelessWidget {
  final double width;
  final double height;
  final String placeHolder;
  final double placeHolderSize;

  const PhotoPlaceHolder({
    Key key,
    @required this.height,
    @required this.width,
    @required this.placeHolder,
    this.placeHolderSize,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: width,
      width: height,
      decoration: BoxDecoration(color: white, shape: BoxShape.circle),
      child: Center(
        child: SvgPicture.asset(
          placeHolder,
          height: placeHolderSize ?? 22,
          width: placeHolderSize ?? 22,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
