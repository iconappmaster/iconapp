import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/screens/search_results_screen.dart';
import 'package:iconapp/stores/search/search_store.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/global/network_photo.dart';
import 'package:iconapp/widgets/global/search_empty.dart';
import 'package:easy_localization/easy_localization.dart';
class CategorySearchWidget extends StatelessWidget {
  final ScrollController controller;

  const CategorySearchWidget({
    Key key,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = sl<SearchStore>();
    return Observer(
      builder: (_) => store.isEmpty
          ? SearchEmpty(text: LocaleKeys.search_empty_state.tr())
          : ListView.builder(
              itemCount: store.getCategories.length,
              controller: controller,
              itemBuilder: (context, index) =>
                  CategorySearchTile(category: store.getCategories[index])),
    );
  }
}

class CategorySearchTile extends StatelessWidget {
  const CategorySearchTile({Key key, @required this.category})
      : super(key: key);

  final Conversation category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => ExtendedNavigator.of(context).pushNamed(
        Routes.searchResultsScreen,
        arguments: SearchResultsScreenArguments(
            id: category.id,
            mode: SearchResulsMode.categories,
            name: category.name),
      ),
      child: Material(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 28.7),
          height: 70,
          color: Colors.white,
          child: Row(
            children: <Widget>[
              NetworkPhoto(
                url: category.photo.url,
                height: 41.3,
                width: 41.3,
                placeHolder: 'assets/images/group_placeholder.svg',
              ),
              SizedBox(width: 14),
              HebrewText(
                category.name,
                style: categoryName,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
