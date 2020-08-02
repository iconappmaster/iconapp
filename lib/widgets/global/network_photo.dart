// Can handle both SVG or other type automatically
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NetworkPhoto extends StatelessWidget {
  final String url;
  final double height, width;
  final String placeHolder;
  final double placeHolderPadding;

  const NetworkPhoto({
    Key key,
    @required this.url,
    @required this.height,
    @required this.width,
    this.placeHolderPadding = 20,
    this.placeHolder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return url.endsWith('.svg')
        ? SvgPicture.network(
            url,
            height: height,
            width: width,
            fit: BoxFit.cover,
            placeholderBuilder: (_) => placeHolder != null
                ? Container(
                    padding: EdgeInsets.all(placeHolderPadding),
                    child: PhotoPlaceHolder(
                        height: height, width: width, placeHolder: placeHolder))
                : Container(),
          )
        : CachedNetworkImage(
            fadeOutDuration: Duration(milliseconds: 0),
            progressIndicatorBuilder: (context, url, progress) =>
                Center(child: CircularProgressIndicator()),
            height: height,
            width: width,
            fit: BoxFit.cover,
            imageUrl: url,
            placeholder: (_, url) {
              return placeHolder != null
                  ? PhotoPlaceHolder(
                      height: height, width: width, placeHolder: placeHolder)
                  : Container();
            },
          );
  }
}

class PhotoPlaceHolder extends StatelessWidget {
  final double width;
  final double height;
  final String placeHolder;

  const PhotoPlaceHolder({
    Key key,
    @required this.height,
    @required this.width,
    @required this.placeHolder,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        placeHolder,
        height: width,
        width: height,
        fit: BoxFit.cover,
      ),
    );
  }
}
