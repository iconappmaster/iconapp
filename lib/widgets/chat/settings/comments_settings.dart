import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/screens/chat_settings_screen.dart';
import 'package:iconapp/stores/comments/comments_store.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'comment_single_select.dart';
import 'package:easy_localization/easy_localization.dart';

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
          CustomText(
            LocaleKeys.comments_groupOpened.tr(),
            style: chatSettings,
          ),
          Observer(builder: (_) {
            return SettingsButton(
              title: isActivated
                  ? LocaleKeys.comments_close.tr()
                  : LocaleKeys.comments_open.tr(),
              onPressed: () async {
                if (isActivated) {
                  comments.setCommentActived(0);
                } else {
                  showDialog(
                    context: context,
                    builder: (_) => CommentSingleSelectDialog(
                      onTap: (selectedComment) {
                        comments.setCommentActived(
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
            );
          }),
        ],
      ),
    );
  }
}

class SettingsButton extends StatelessWidget {
  final bool isActivated, isLoading;
  final Function onPressed;
  final String title;
  const SettingsButton({
    Key key,
    @required this.isActivated,
    @required this.isLoading,
    @required this.onPressed,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final comments = sl<CommentsStore>();
    return SizedBox(
      height: 25,
      width: 80,
      child: Observer(
          builder: (_) => RawMaterialButton(
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
                  : CustomText(title, maxLines: 1, style: settingsButton))),
    );
  }
}
