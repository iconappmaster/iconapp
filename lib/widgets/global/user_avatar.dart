import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/stores/language/language_store.dart';
import 'package:iconapp/widgets/global/network_photo.dart';
import 'package:iconapp/widgets/global/plus_circle.dart';

class UserAvatar extends StatelessWidget {
  final String placeholder, url;
  final Function onTap;
  final bool showLoading;
  final bool showPlus;
  final double placeHolderPadding, placeHolderSize;

  const UserAvatar({
    Key key,
    this.placeholder = 'assets/images/user_icon.svg',
    @required this.url,
    @required this.onTap,
    this.showLoading = false,
    this.showPlus = true,
    this.placeHolderPadding,
    this.placeHolderSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: showPlus ? 90 : 75,
        height: showPlus ? 90 : 75,
        child: Stack(children: [
          if (showLoading)
            Positioned(
              right: language.isLTR ? 0 : null,
              left: language.isLTR ? null : 0,
              child: SizedBox(
                  height: 75,
                  width: 75,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation(cornflower),
                  )),
            ),
          Positioned(
            top: 1,
            right: 1,
            child: Container(
                height: 72,
                width: 72,
                decoration: BoxDecoration(shape: BoxShape.circle, color: white),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: NetworkPhoto(
                    placeHolderSize: placeHolderSize,
                    placeHolderPadding: placeHolderPadding,
                    placeHolder: placeholder,
                    imageUrl: url,
                    height: 37,
                    width: 37,
                  ),
                )),
          ),
          if (showPlus)
            Align(
              alignment: Alignment.bottomLeft,
              child: PlusCircle(),
            ),
        ]),
      ),
    );
  }
}
