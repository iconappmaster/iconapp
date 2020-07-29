import 'package:flutter/material.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/stores/search/search_store.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/global/network_photo.dart';

class IconsSearchWidget extends StatelessWidget {
  final ScrollController controller;
  final Function onTap;
  const IconsSearchWidget({
    Key key,
    @required this.controller,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = sl<SearchStore>();
    return ListView.builder(
      controller: controller,
      itemBuilder: (context, index) {
        final icon = store.getIcons[index];
        return IconSearchItem(icon: icon, onTap: onTap);
      },
      itemCount: store.getIcons.length,
    );
  }
}

class IconSearchItem extends StatelessWidget {
  final UserModel user;

  const IconSearchItem({
    Key key,
    @required UserModel icon,
    @required this.onTap,
    this.user,
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
              NetworkPhoto(
                url: user.photo.url ?? '',
                radius: BorderRadius.circular(5.3),
                height: 41,
                width: 41,
              ),
              SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  HebrewText(user.fullName, style: categoryName),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
