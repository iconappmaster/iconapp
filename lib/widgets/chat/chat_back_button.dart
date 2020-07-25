
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/theme.dart';

class ChatBackButton extends StatelessWidget {
  const ChatBackButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Row(
        children: <Widget>[
          SvgPicture.asset('assets/images/back_arrow.svg',
              height: 16.3, width: 16.3),
          SizedBox(width: 5.3),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: white,
            ),
            height: 48,
            width: 48,
          )
        ],
      ),
    );
  }
}
