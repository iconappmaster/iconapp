import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/comment_opotion_model.dart';
import 'package:iconapp/widgets/global/base_dialog.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/global/next_button.dart';

class CommentSingleSelectDialog extends StatefulWidget {
  final Function(CommentListOption) onTap;

  const CommentSingleSelectDialog({Key key, @required this.onTap})
      : super(key: key);
  @override
  _CommentSingleSelectDialogState createState() =>
      _CommentSingleSelectDialogState();
}

class _CommentSingleSelectDialogState extends State<CommentSingleSelectDialog> {
  CommentListOption selected;

  @override
  void initState() {
    selected = commentsOption.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      height: MediaQuery.of(context).size.height * .65,
      child: Column(
        children: [
          SizedBox(height: 20),
          CustomText('הגבלת משתמשים לתגובות', style: dialogTitle),
          SizedBox(height: 30),
          ListView.builder(
            shrinkWrap: true,
            itemCount: commentsOption.length,
            itemBuilder: (context, index) {
              final option = commentsOption[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    selected = commentsOption[index];
                    setState(() {});
                  },
                  child: Row(
                    children: [
                      Theme(
                        data: Theme.of(context)
                            .copyWith(unselectedWidgetColor: Colors.white),
                        child: Radio(
                          activeColor: white,
                          visualDensity: VisualDensity.compact,
                          value: commentsOption[index],
                          groupValue: selected,
                          onChanged: (s) {
                            selected = s;
                            setState(() {});
                          },
                        ),
                      ),
                      SizedBox(width: 8),
                      CustomText(option.title, style: chatSettings),
                    ],
                  ),
                ),
              );
            },
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: NextButton(
              title: 'פתיחת קבוצה לתגובות',
              height: 55,
              onClick: () {
                ExtendedNavigator.of(context).pop();
                return widget.onTap(selected);
              },
            ),
          )
        ],
      ),
    );
  }
}
