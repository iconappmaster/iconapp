import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/stores/comments/comments_store.dart';
import 'package:iconapp/widgets/global/bouncing.dart';
import 'package:iconapp/widgets/global/custom_text.dart';

class CommentsFab extends StatelessWidget {
  final Function onTap;

  const CommentsFab({
    Key key,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final comments = sl<CommentsStore>();
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
        Observer(
          builder: (_) => Visibility(
            visible: comments.commentsCount > 0,
            child: Positioned(
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
                        comments.commentsCount < 999
                            ? comments.commentsCount.toString()
                            : "1k+",
                        maxLines: 1,
                        style: newMessageNumber),
                  ),
                )),
          ),
        )
      ]),
    );
  }
}
