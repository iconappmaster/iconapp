import 'package:flutter/material.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/screens/chat_settings_screen.dart';
import 'package:iconapp/stores/comments/comments_store.dart';
import 'package:iconapp/widgets/global/base_dialog.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/global/next_button.dart';

class CommentsCommand extends StatelessWidget {
  final bool isActivated;

  const CommentsCommand({
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
            onPressed: () {
              CommentDialogSingleSelect();
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

class CommentDialogSingleSelect extends StatefulWidget {
  @override
  _CommentDialogSingleSelectState createState() =>
      _CommentDialogSingleSelectState();
}

class _CommentDialogSingleSelectState extends State<CommentDialogSingleSelect> {
  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .6,
      child: Column(
        children: [
          CustomText('הגבלת משתמשים לתגובות', style: dialogTitle),
          SizedBox(height: 30),
          ListView(
            shrinkWrap: true,
            children: commentsOption
                .map((c) => Row(
                    children: [CustomText(c.toString(), style: chatSettings)]))
                .toList(),
          ),
          Expanded(
            child: NextButton(onClick: () {}),
          )
        ],
      ),
    );
  }
}

final commentsOption = [
  CommentListOption(maxUserAmmount: 20, title: 'עד 20'),
  CommentListOption(maxUserAmmount: 50, title: 'עד 50'),
  CommentListOption(maxUserAmmount: 75, title: 'עד 70'),
  CommentListOption(maxUserAmmount: 100, title: 'עד 100'),
  CommentListOption(maxUserAmmount: 200, title: 'עד 200'),
  CommentListOption(maxUserAmmount: 0, title: 'ללא הגבלה'),
];

class CommentListOption {
  final String title;
  final int maxUserAmmount;

  CommentListOption({
    @required this.title,
    @required this.maxUserAmmount,
  });
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
    return RawMaterialButton(
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
    );
  }
}
