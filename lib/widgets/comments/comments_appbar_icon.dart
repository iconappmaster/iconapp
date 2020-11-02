import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/stores/comments/comments_store.dart';

class CommentsAppBarIcon extends StatelessWidget {
  final Function onTap;
  // final int count;

  const CommentsAppBarIcon({
    Key key,
    @required this.onTap,
    // @required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final comments = sl<CommentsStore>();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 30,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset('assets/images/white_bubble.svg',
                height: 26, width: 26),
            Observer(
              builder: (_) => Visibility(
                visible: comments.showNewCommentBadge,
                child: Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    height: 13,
                    width: 13,
                    decoration: BoxDecoration(
                      gradient: redPinkGradient,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
