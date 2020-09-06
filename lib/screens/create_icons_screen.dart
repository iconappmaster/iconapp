import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/stores/create/create_icon_store.dart';
import 'package:iconapp/stores/search/search_store.dart';
import 'package:iconapp/widgets/bottomsheet/bs_search_bar.dart';
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

  SelectIconScreen({Key key, @required this.mode}) : super(key: key) {
    sl<CreateIconStore>().init;
  }

  @override
  Widget build(BuildContext context) {
    final isFromChat = this.mode == SelectIconMode.fromChat;
    final store = sl<CreateIconStore>();
    return Observer(
      builder: (_) => BaseGradientBackground(
        gradient: grapeDarkIndigo,
        child: Container(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  CreateGroupAppbar(
                      title: isFromChat
                          ? LocaleKeys.create_addUser.tr()
                          : LocaleKeys.create_newGroupTitle.tr(),
                      subtitle: isFromChat
                          ? LocaleKeys.create_chooseUserToGroup.tr()
                          : LocaleKeys.create_iconSubtitle.tr()),
                  SizedBox(height: 23),
                  CreateSearchBar(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: store.count,
                      itemBuilder: (context, index) {
                        final icon = store.getIcons[index];
                        final isSelected = store.isSelected(icon);
                        return CreateConversationTile(
                          selected: isSelected,
                          key: Key(icon.id.toString()),
                          title: icon.fullName,
                          url: icon.photo.url,
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

class CreateSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = sl<CreateIconStore>();
    final transparentBorder = UnderlineInputBorder(
        borderSide: BorderSide(
      color: Colors.transparent,
    ));
    return Observer(
      builder: (_) => Container(
        child: Column(children: [
          SearchDivider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 28.7),
            child: Row(
              children: <Widget>[
                SizedBox(width: 15),
                Expanded(
                  child: TextField(
                    style: flushbar,
                    onChanged: (query) => store.search(query),
                    decoration: InputDecoration(
                      enabledBorder: transparentBorder,
                      border: transparentBorder,
                      focusedBorder: transparentBorder,
                      hintText: store.getSearchMode == SearchMode.categories
                          ? 'חפש/י קטגוריה'
                          : 'חפש/י אייקון',
                      hintStyle: flushbar,
                    ),
                  ),
                ),
                SvgPicture.asset('assets/images/search_icon_white.svg',
                    height: 37.7, width: 37.7),
              ],
            ),
          ),
          SizedBox(height: 17),
          Divider(
            color: cornflower,
            height: 0,
            thickness: .7,
            indent: 28.7,
            endIndent: 28.7,
          ),
        ]),
      ),
    );
  }
}
