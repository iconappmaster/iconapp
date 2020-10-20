// Can handle both SVG or other type automatically
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/theme.dart';

class NetworkPhoto extends StatelessWidget {
  final String imageUrl;
  final double height, width;
  final String placeHolder;
  final double placeHolderPadding, placeHolderSize;

  const NetworkPhoto({
    Key key,
    @required this.imageUrl,
    this.height,
    this.width,
    this.placeHolderPadding = 20,
    this.placeHolder,
    this.placeHolderSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return imageUrl.isNotEmpty && imageUrl.endsWith('.svg')
        ? SvgPicture.asset(
            imageUrl ?? '',
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
                        placeHolderSize: placeHolderSize))
                : Container(),
          )
        : CachedNetworkImage(
            fadeOutDuration: const Duration(milliseconds: 250),
            errorWidget: (c, u, e) {
              return Container();
            },
            placeholder: placeHolder != null
                ? (context, url) {
                    return PhotoPlaceHolder(
                      height: height,
                      width: width,
                      placeHolder: placeHolder,
                      placeHolderSize: placeHolderSize,
                    );
                  }
                : null,
            progressIndicatorBuilder: placeHolder != null
                ? null
                : (context, url, downloadProgress) => Center(
                    child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 1,
                          value: downloadProgress.progress,
                          valueColor: AlwaysStoppedAnimation(cornflower),
                        ))),
            height: height,
            width: width,
            fit: BoxFit.cover,
            imageUrl: imageUrl,
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
