import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/category_model.dart';
import 'package:iconapp/stores/search/search_store.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/global/network_photo.dart';

class CategorySearchWidget extends StatelessWidget {
  final ScrollController controller;
  final Function onCategoryTapped;

  const CategorySearchWidget({
    Key key,
    @required this.controller,
    @required this.onCategoryTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = sl<SearchStore>();
    return Observer(
      builder: (_) => ListView.builder(
        controller: controller,
        itemBuilder: (context, index) {
          final category = store.getCategories[index];
          return CategorySearchItem(
            category: category,
            onTap: onCategoryTapped,
          );
        },
        itemCount: store.getCategories.length,
      ),
    );
  }
}

class CategorySearchItem extends StatelessWidget {
  const CategorySearchItem(
      {Key key, @required this.onTap, @required this.category})
      : super(key: key);

  final CategoryModel category;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
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
              ),
              SizedBox(width: 14),
              HebrewText(category.name, style: categoryName),
            ],
          ),
        ),
      ),
    );
  }
}
