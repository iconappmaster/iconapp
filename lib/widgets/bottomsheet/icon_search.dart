import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/stores/search/search_store.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/global/network_photo.dart';

class IconsSearchWidget extends StatelessWidget {
  final ScrollController controller;
  final Function onIconTapped;
  const IconsSearchWidget({
    Key key,
    @required this.controller,
    @required this.onIconTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = sl<SearchStore>();
    return Observer(
      builder: (_) => ListView.builder(
        controller: controller,
        itemBuilder: (context, index) {
          final icon = store.getIcons[index];
          return IconSearchItem(icon: icon, onTap: onIconTapped);
        },
        itemCount: store.getIcons.length,
      ),
    );
  }
}

class IconSearchItem extends StatelessWidget {
  final UserModel icon;

  const IconSearchItem({
    Key key,
    @required this.onTap,
    this.icon,
  }) : super(key: key);

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
