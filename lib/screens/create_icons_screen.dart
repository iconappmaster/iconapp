import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/stores/create/create_icon_store.dart';
import 'package:iconapp/stores/language/language_store.dart';
import 'package:iconapp/stores/search/search_store.dart';
import 'package:iconapp/widgets/bottomsheet/bs_search_bar.dart';
import 'package:iconapp/widgets/create/create_app_bar.dart';
import 'package:iconapp/widgets/create/create_tile.dart';
import 'package:iconapp/widgets/create/create_next_button.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:iconapp/widgets/global/input_box.dart';
import 'package:iconapp/widgets/global/lottie_loader.dart';
import 'package:iconapp/widgets/onboarding/base_onboarding_widget.dart';
import 'package:easy_localization/easy_localization.dart';

/// [fromChat] is when the user is being create from chat settings
/// [fromGroup] is when the usre is being create from create flow

enum SelectIconMode { fromChat, fromGroup }

class SelectIconScreen extends StatefulWidget {
  final SelectIconMode mode;

  SelectIconScreen({Key key, @required this.mode}) : super(key: key);

  @override
  _SelectIconScreenState createState() => _SelectIconScreenState();
}

class _SelectIconScreenState extends State<SelectIconScreen> {
  @override
  void initState() {
    sl<CreateIconStore>().init;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isFromChat = this.widget.mode == SelectIconMode.fromChat;
    final store = sl<CreateIconStore>();
    return Observer(
      builder: (_) => BaseGradientBackground(
        gradient: grapeDarkIndigo,
        child: Container(
          child: Stack(
            children: <Widget>[
              Positioned(
                left: language.isLTR ? null : 16,
                right: language.isLTR ? 16 : null,
                top: 45,
                child: MaterialButton(
                  onPressed: () => store.search(''),
                  height: 30,
                  child: CustomText(
                    LocaleKeys.search_showAll.tr(),
                    style: dialogContent,
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  AppBarWithDivider(
                      isArrowDirectionDown: true,
                      title: isFromChat ? LocaleKeys.create_addUser.tr() : LocaleKeys.create_newGroupTitle.tr(),
                      subtitle:
                          isFromChat ? LocaleKeys.create_chooseUserToGroup.tr() : LocaleKeys.create_iconSubtitle.tr()),
                  SizedBox(height: 23),
                  SearchBar(),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.only(bottom: 50, top: 20),
                      physics: BouncingScrollPhysics(),
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
                            switch (widget.mode) {
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
              if (widget.mode == SelectIconMode.fromGroup)
                CreateNextBotton(
                    asset: 'assets/images/go_arrow.svg',
                    isValid: store.isValid,
                    validationText: LocaleKeys.create_iconValidation.tr(),
                    onTap: () => ExtendedNavigator.of(context).pushCreateCategoryScreen()),
              Observer(
                builder: (_) => Visibility(
                  visible: store.isLoading,
                  child: Center(
                    child: LottieLoader(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = sl<CreateIconStore>();

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
                  child: InputText(
                    onChange: (query) {
                      if (query.length > 2) {
                        store.search(query);
                      }
                    },
                    hint: store.getSearchMode == SearchMode.categories
                        ? LocaleKeys.search_categoryHint.tr()
                        : LocaleKeys.search_iconHint.tr(),
                    hintStyle: flushbar.copyWith(color: white.withOpacity(.2)),
                  ),
                ),
                SizedBox(width: 10),
                SvgPicture.asset(
                  'assets/images/search_icon_white.svg',
                  height: 27.7,
                  width: 27.7,
                  color: cornflower,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
