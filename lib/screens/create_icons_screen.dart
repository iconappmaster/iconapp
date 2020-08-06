import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/stores/create/create_icon_store.dart';
import 'package:iconapp/widgets/create/create_app_bar.dart';
import 'package:iconapp/widgets/create/create_tile.dart';
import 'package:iconapp/widgets/create/create_next_button.dart';
import 'package:iconapp/widgets/onboarding/base_onboarding_widget.dart';
import 'package:easy_localization/easy_localization.dart';

/// [fromChat] is when the user is being create from chat settings
/// [fromGroup] is when the usre is being create from create flow

enum SelectIconMode { fromChat, fromGroup }

class SelectIconScreen extends StatelessWidget {
  final SelectIconMode mode;

  const SelectIconScreen({Key key, @required this.mode}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final isFromChat = this.mode == SelectIconMode.fromChat;
    final store = sl<CreateIconStore>();
    return Observer(
      builder: (_) => BaseGradientWidget(
        child: Container(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  CreateGroupAppbar(
                      title: isFromChat ? "הוספת מששתף" : LocaleKeys.create_newGroupTitle.tr(),
                      subtitle:isFromChat? "בחר/י משתתף לקבוצה": LocaleKeys.create_iconSubtitle.tr()),
                  Expanded(
                    child: ListView.builder(
                      itemCount: store.count,
                      itemBuilder: (context, index) {
                        final icon = store.getIcons[index];
                        print(icon.id);
                        return CreateConversationTile(
                          key: Key(icon.id.toString()),
                          onTap: () {
                            switch (mode) {
                              case SelectIconMode.fromChat:
                                ExtendedNavigator.of(context).pop(icon.id);
                                break;
                              case SelectIconMode.fromGroup:
                                store.updateSelected(icon);
                                break;
                            }
                          },
                          title: icon.fullName,
                          url: icon.photo.url,
                        );
                      },
                    ),
                  ),
                ],
              ),
              if (mode == SelectIconMode.fromGroup)
                CreateNextBotton(
                  asset: 'assets/images/go_arrow.svg',
                  isValid: store.isValid,
                  validationText: LocaleKeys.create_iconValidation.tr(),
                  onTap: () => ExtendedNavigator.of(context)
                      .pushNamed(Routes.createCategoryScreen),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
