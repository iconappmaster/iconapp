import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../core/dependencies/locator.dart';
import '../../core/theme.dart';
import '../../data/models/user_model.dart';
import '../../generated/locale_keys.g.dart';
import '../../stores/auth/auth_store.dart';
import '../../stores/user/user_store.dart';
import '../global/base_dialog.dart';
import '../global/custom_text.dart';
import '../global/next_button.dart';

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
          SizedBox(height: 16),
          CustomText(LocaleKeys.dialogs_exit.tr(), style: dialogTitle),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomText(
              LocaleKeys.disconnect_content.tr(args: [himHer, isSure, thatYou]),
              style: dialogContent,
              textAlign: TextAlign.start,
            ),
          ),
          Spacer(),
          NextButton(
            onClick: () async {
              await ExtendedNavigator.of(context).pop();
              return sl<AuthStore>().logout(true);
            },
            height: 45,
            title: LocaleKeys.dialogs_disconnect.tr(),
          ),
          TextButton(
            onPressed: () => ExtendedNavigator.of(context).pop(),
            child: CustomText(
              LocaleKeys.dialogs_dontDisconnect.tr(),
              style: fieldLabel,
            ),
          )
        ],
      ),
    );
  }
}
