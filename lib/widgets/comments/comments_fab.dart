import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/widgets/global/bouncing.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';

class CommentsFab extends StatelessWidget {
  final int count;
  final Function onTap;

  const CommentsFab({
    Key key,
    @required this.count,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BouncingGestureDetector(
      onPressed: onTap,
      child: Stack(children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: purpleGradient,
              border: Border.all(
                color: cornflower,
                width: 3,
              )),
          child: Center(
            child: SvgPicture.asset(
              'assets/images/gold_bubble.svg',
              height: 35,
              width: 34,
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: redPinkGradient,
            ),
            child: Center(
              child: CustomText(
                count < 999 ? count.toString() : "1k+",
                maxLines: 1,
                style: newMessageNumber,
              ),
            ),
          ),
        )
      ]),
    );
  }
}
