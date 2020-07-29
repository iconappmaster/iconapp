import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/theme.dart';
import '../../core/extensions/string_ext.dart';
import 'package:iconapp/widgets/global/plus_circle.dart';

class UserAvatar extends StatelessWidget {
  final String placeholder, url;
  final Function onTap;
  final bool showLoading;

  const UserAvatar({
    Key key,
    this.placeholder = 'assets/images/user_icon.svg',
    @required this.url,
    @required this.onTap,
    this.showLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(children: [
        Container(
          width: 90,
          height: 90,
          child: Stack(children: [
            if (showLoading)
              SizedBox(
                  height: 75, width: 77, child: CircularProgressIndicator()),
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: white,
              ),
              child: url != null && url.isNotEmpty
                  ? CircleAvatar(
                    backgroundColor: white,
                    backgroundImage: url.showImage())
                  : Center(
                      child:
                          SvgPicture.asset(placeholder, height: 37, width: 37)),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: PlusCircle(),
            ),
          ]),
        ),
      ]),
    );
  }
}
