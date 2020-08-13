import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/screens/search_results_screen.dart';
import 'package:iconapp/stores/search/search_store.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/global/network_photo.dart';
import 'package:iconapp/widgets/global/search_empty.dart';

class IconsSearchWidget extends StatelessWidget {
  final ScrollController controller;
  const IconsSearchWidget({
    Key key,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = sl<SearchStore>();
    return Observer(
      builder: (_) => store.isEmpty
          ? SearchEmpty()
          : ListView.builder(
              itemCount: store.getIcons.length,
              controller: controller,
              itemBuilder: (context, index) =>
                  IconSearchItem(icon: store.getIcons[index]),
            ),
    );
  }
}

class IconSearchItem extends StatelessWidget {
  final UserModel icon;

  const IconSearchItem({
    Key key,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () => ExtendedNavigator.of(context).pushNamed(
            Routes.searchResultsScreen,
            arguments: SearchResultsScreenArguments(
                id: icon.id,
                mode: SearchResulsMode.icons,
                name: icon.fullName)),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 28.7),
          height: 70,
          color: Colors.white,
          child: Row(
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(5.3),
                  child: NetworkPhoto(
                    url: icon?.photo?.url ?? '',
                    height: 41.3,
                    width: 41.3,
                  )),
              SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  HebrewText(icon?.fullName ?? '', style: categoryName),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
