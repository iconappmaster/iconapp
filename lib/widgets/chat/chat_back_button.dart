import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/widgets/global/network_photo.dart';

class ChatBackButton extends StatelessWidget {
  final String url;

  const ChatBackButton({
    Key key,
    @required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.pop(context),
      child: Row(
        children: <Widget>[
          SvgPicture.asset('assets/images/back_arrow.svg',
              height: 16.3, width: 16.3),
          SizedBox(width: 5.3),
          ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: NetworkPhoto(
                placeHolder: 'assets/images/group_placeholder.svg',
                url: url,
                height: 42,
                width: 42,
              ))
        ],
      ),
    );
  }
}
