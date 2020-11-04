import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/stores/comments/comments_store.dart';
import 'package:iconapp/widgets/global/bouncing.dart';

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
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: purpleGradient,
              border: Border.all(
                color: comments.isActivated ? apple : cornflower,
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
            visible: comments.showNewCommentBadge,
            child: NewCommentsRedDot(),
          ),
        ),
      ]),
    );
  }
}

class NewCommentsRedDot extends StatelessWidget {
  const NewCommentsRedDot({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration:
          BoxDecoration(shape: BoxShape.circle, gradient: redPinkGradient),
    );
  }
}
