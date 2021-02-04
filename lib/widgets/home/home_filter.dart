import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/focused_menu.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/helpers/tutorial.dart';
import 'package:iconapp/stores/home/home_store.dart';
import 'package:iconapp/stores/language/language_store.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:showcaseview/showcase.dart';

class HomeFilter extends StatelessWidget {
  const HomeFilter({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final home = sl<HomeStore>();
    final textStyle = button.copyWith(color: Colors.black, fontSize: 15);
    return Showcase(
      description: 'Control the content with filters',
      key: showcaseFilterButtonKey,
      child: FocusedMenuHolder(
        openWithTap: true,
        menuWidth: MediaQuery.of(context).size.width * 0.4,
        blurSize: 5.0,
        menuItemExtent: 45,
        menuBoxDecoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(
            const Radius.circular(15.0),
          ),
        ),
        duration: const Duration(milliseconds: 100),
        animateMenuItems: true,
        blurBackgroundColor: Colors.black54,
        bottomOffsetHeight: 100,
        menuItems: <FocusedMenuItem>[
          FocusedMenuItem(
              title: CustomText(LocaleKeys.filter_foryou.tr(), style: textStyle),
              onPressed: () => home.setFilterType(HomeFilterType.forYou)),
          FocusedMenuItem(
              title: CustomText(LocaleKeys.filter_popular.tr(), style: textStyle),
              onPressed: () => home.setFilterType(HomeFilterType.popular)),
        ],
        onPressed: () {},
        child: ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: Material(
            color: warmPurple,
            child: InkWell(
              splashColor: cornflower,
              highlightColor: Colors.transparent,
              child: Observer(builder: (_) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(),
                  child: CustomText(
                    home.type.description,
                    style: chatMessageName.copyWith(fontSize: 12),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

enum HomeFilterType { forYou, popular }

extension HomeFilterExt on HomeFilterType {
  static const filterMapEng = {HomeFilterType.forYou: 'For You', HomeFilterType.popular: 'Must Popular'};

  static const filterMapHe = {HomeFilterType.forYou: 'For You', HomeFilterType.popular: 'Must Popular'};

  String get description => language.isLTR ? filterMapEng[this] : filterMapHe[this];
}
