import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/screens/search_results_screen.dart';
import 'package:iconapp/stores/search/search_store.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:iconapp/widgets/global/network_photo.dart';
import 'package:iconapp/widgets/global/search_empty.dart';
import 'package:easy_localization/easy_localization.dart';

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
          ? SearchEmpty(text: LocaleKeys.search_empty_state.tr())
          : ListView.builder(
              itemCount: store.getIcons.length,
              controller: controller,
              itemBuilder: (context, index) =>
                  IconSearchItem(icon: store.getIcons[index])),
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
        onTap: () => ExtendedNavigator.of(context).pushSearchResultsScreen(
          id: icon.id,
          mode: SearchResulsMode.icons,
          name: icon.fullName,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 28.7),
          height: 70,
          color: Colors.white,
          child: Row(
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(5.3),
                  child: NetworkPhoto(
                    placeHolder: 'assets/images/group_placeholder.svg',
                    imageUrl: icon?.photo?.url ?? '',
                    height: 41.3,
                    width: 41.3,
                  )),
              SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomText(icon?.fullName ?? '', style: categoryName),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
