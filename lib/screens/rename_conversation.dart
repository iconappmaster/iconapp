import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/stores/chat_settings/chat_settings_store.dart';
import 'package:iconapp/widgets/create/create_app_bar.dart';
import 'package:iconapp/widgets/global/input_box.dart';
import 'package:iconapp/widgets/onboarding/base_onboarding_widget.dart';
import 'package:easy_localization/easy_localization.dart';

class EditConversation extends StatelessWidget {
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final store = sl<ChatStore>();
    return BaseGradientWidget(
      child: Stack(
        children: [
          Column(
            children: <Widget>[
              CreateGroupAppbar(
                  title: LocaleKeys.create_groupNameAppbarTitle.tr()),
              SizedBox(height: 33),
              Padding(
                  padding: EdgeInsets.only(left: 28.7, right: 28.7),
                  child: Form(
                      key: _key,
                      child: InputText(
                          validator: _groupNameValidation,
                          contentPadding: const EdgeInsets.only(bottom: 20),
                          initialValue:
                              store.conversation?.name ?? '',
                          onChange: (groupName) => sl<ChatSettingsStore>()
                              .changeConversationName(groupName),
                          hint: 'הקלד/י נושא חדש',
                          hintStyle: flushbar,
                          textStyle: flushbar))),
            ],
          ),
          Positioned(
            bottom: 24,
            left: 25,
            child: SizedBox(
              height: 53,
              width: 53,
              child: FloatingActionButton(
                heroTag: 'fab2',
                  child: SvgPicture.asset(
                    'assets/images/check.svg',
                    height: 27,
                    width: 27,
                  ),
                  backgroundColor: cornflower,
                  onPressed: () {
                    if (_key.currentState.validate()) {
                      ExtendedNavigator.of(context).pop();
                    }
                  }),
            ),
          )
        ],
      ),
    );
  }

  String _groupNameValidation(value) {
    if (value.isEmpty) {
      return 'שם הקבוצה לא יכול להיות ריק';
    }
    return null;
  }
}
