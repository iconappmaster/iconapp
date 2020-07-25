import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';
import '../../core/extensions/string_ext.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/widgets/global/plus_circle.dart';

class UserAvatar extends StatelessWidget {
  final String placeholder, url;
  final Function onTap;

  const UserAvatar({
    Key key,
    this.placeholder = 'assets/images/user_icon.svg',
    @required this.url,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 80,
        child: Stack(children: [
          Container(
            height: 75,
            width: 75,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: white,
            ),
            child: url != null && url.isNotEmpty
                ? CircleAvatar(backgroundImage: url.showImage())
                : Center(
                    child: SvgPicture.asset(
                      placeholder,
                      height: 37,
                      width: 37,
                    ),
                  ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: PlusCircle(),
          ),
        ]),
      ),
    );
  }
}
