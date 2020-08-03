import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/stores/auth/auth_store.dart';
import 'package:iconapp/stores/user/user_store.dart';
import 'package:iconapp/widgets/global/base_dialog.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/global/next_button.dart';
import 'package:easy_localization/easy_localization.dart';

class DisconnectDialog extends StatelessWidget {
  final double height;

  const DisconnectDialog({Key key, this.height}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final store = sl<UserStore>();

    final isMale = store.getUser.gender == UserGender.male;
    final himHer = isMale ? 'אתה' : 'את';
    final thatYou = isMale ? 'שאתה' : 'שאת';
    final isSure = isMale ? 'בטוח' : 'בטוחה';

    return BaseDialog(
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          HebrewText('יציאה מהמערכת', style: dialogTitle),
          SizedBox(height: 16),
          HebrewText(
            LocaleKeys.disconnect_content.tr(args: [himHer, isSure, thatYou]),
            style: dialogContent,
            textAlign: TextAlign.start,
          ),
          Spacer(),
          NextButton(
            onClick: () async {
              await ExtendedNavigator.of(context).pop();
              return sl<AuthStore>().logout();
            },
            height: 50,
            title: 'אני רוצה להתנתק',
          ),
          FlatButton(
            onPressed: () => ExtendedNavigator.of(context).pop(),
            child: HebrewText(
              'התחרטתי אל תנתקו אותי',
              style: fieldLabel,
            ),
          )
        ],
      ),
    );
  }
}
