import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/stores/create/create_category_store.dart';
import 'package:iconapp/widgets/create/create_app_bar.dart';
import 'package:iconapp/widgets/create/create_item.dart';
import 'package:iconapp/widgets/create/create_next_button.dart';
import 'package:iconapp/widgets/onboarding/base_onboarding_widget.dart';
import 'package:easy_localization/easy_localization.dart';

// Choose single category
class CreateCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = sl<CreateCategoryStore>();
    return Observer(
      builder: (_) => BaseGradientWidget(
        child: Container(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  CreateGroupAppbar(
                      title: LocaleKeys.create_newGroupTitle.tr(),
                      subtitle: LocaleKeys.create_categoriesSubtitle.tr()),
                  ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final category = store.getCategories[index];
                      return CreateConversationItem(
                        key: Key(category.id.toString()),
                        onTap: () => store.updateSelected(category),
                        title: category.name,
                        url: category.photo.url,
                      );
                    },
                    itemCount: store.count,
                  ),
                ],
              ),
              CreateNextBotton(
                asset: 'assets/images/go_arrow.svg',
                isValid: store.isValid,
                validationText: LocaleKeys.create_categoryValidation.tr(),
                onTap: () => ExtendedNavigator.of(context).pushNamed(Routes.createDetailsScreen),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
