import 'package:flutter/material.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/stores/user/user_store.dart';
import 'package:iconapp/widgets/global/base_dialog.dart';
import 'package:iconapp/widgets/global/input_box.dart';
import 'package:iconapp/widgets/global/next_button.dart';
import '../../core/extensions/context_ext.dart';
import 'hebrew_input_text.dart';

var _explanationText = '';

class ReportUserDialog extends StatelessWidget {
  final UserModel user;

  const ReportUserDialog({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userStore = sl<UserStore>();

    return BaseDialog(
      height: context.heightPlusStatusbarPerc(.3),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: CustomText(
              'דווח על ${user.fullName}',
              style: dialogTitle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: InputText(
              maxLength: null,
              onChange: (text) => _explanationText = text,
              hint: 'כתוב כאן...',
              hintStyle: systemMessage,
              title: 'הערות',
            ),
          ),
          SizedBox(height: 18),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: NextButton(
                height: 50,
                onClick: () async {
                  userStore.reportUser(user, _explanationText);
                  Navigator.pop(context);
                }),
          )
        ],
      ),
    );
  }
}
