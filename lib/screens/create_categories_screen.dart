import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/stores/create/create_category_store.dart';
import 'package:iconapp/widgets/create/create_app_bar.dart';
import 'package:iconapp/widgets/create/create_tile.dart';
import 'package:iconapp/widgets/onboarding/base_onboarding_widget.dart';
import 'package:easy_localization/easy_localization.dart';

// Choose single category
class CreateCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = sl<CreateCategoryStore>();
    return Observer(
      builder: (_) {
        return BaseGradientBackground(
          child: Container(
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    AppBarWithDivider(
                        title: LocaleKeys.create_newGroupTitle.tr(),
                        subtitle: LocaleKeys.create_categoriesSubtitle.tr()),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.only(bottom: 50, top: 20),
                        physics: BouncingScrollPhysics(),
                        itemCount: store.count,
                        itemBuilder: (context, index) {
                          final category = store.getCategories[index];
                          return CreateConversationTile(
                            showSelectedCircle: false,
                            key: Key(category.name),
                            title: category.name,
                            url: category.photo.url,
                            onTap: () {
                              store.updateSelected(category);
                              ExtendedNavigator.of(context)
                                  .pushNamed(Routes.createDetailsScreen);
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
