import 'package:flutter/material.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/screens/chat_settings_screen.dart';
import 'package:iconapp/stores/comments/comments_store.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';

import 'comment_single_select.dart';

class CommentsSettings extends StatelessWidget {
  final bool isActivated;

  const CommentsSettings({
    Key key,
    this.isActivated,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final comments = sl<CommentsStore>();

    return Container(
      height: settingsColumnHeight,
      padding: EdgeInsets.only(left: 21, right: 21),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CustomText('קבוצה פתוחה לתגובות', style: chatSettings),
          _CommentButtonToggle(
            onPressed: () async {
              if (isActivated) {
                comments.updateCommentSettings(0);
              } else {
                showDialog(
                  context: context,
                  child: CommentSingleSelectDialog(
                    onTap: (selectedComment) {
                      comments.updateCommentSettings(
                        selectedComment.commentsMaxUserCount,
                      );
                    },
                  ),
                );
              }
              // comments.updateCommentSettings(isOpen, maxUserCount)
            },
            isLoading: comments.activatingComments,
            isActivated: isActivated,
          ),
        ],
      ),
    );
  }
}

class _CommentButtonToggle extends StatelessWidget {
  final bool isActivated, isLoading;
  final Function onPressed;
  const _CommentButtonToggle({
    Key key,
    @required this.isActivated,
    @required this.isLoading,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final comments = sl<CommentsStore>();
    return SizedBox(
      height: 25,
      width: 80,
      child: RawMaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.7),
            side: BorderSide(color: cornflower)),
        onPressed: onPressed,
        highlightColor: isActivated ? Colors.transparent : cornflower,
        fillColor: isActivated ? Colors.transparent : cornflower,
        textStyle: settingsButton,
        child: comments.activatingComments
            ? SizedBox(
                height: 15,
                width: 15,
                child: CircularProgressIndicator(
                  strokeWidth: 1,
                  valueColor: AlwaysStoppedAnimation(
                    white,
                  ),
                ),
              )
            : CustomText(isActivated ? 'סגירה' : 'פתיחה',
                maxLines: 1, style: settingsButton),
      ),
    );
  }
}
