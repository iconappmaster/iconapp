import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';

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
    return ListView.builder(
      controller: controller,
      itemBuilder: (context, index) {
        return IconSearchItem(onTap: onTap);
      },
      itemCount: 12,
    );
  }
}

class IconSearchItem extends StatelessWidget {
  final UserModel user;

  const IconSearchItem({
    Key key,
    @required this.onTap,
    this.user,
  }) : super(key: key);

  final Function onTap;

  // TODO connect the [UserModel] here instead of the Mock Data
  
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
                child: Image.network(
                  'https://www.stripesandpearls.com/wp-content/uploads/2012/10/596252-41.jpg',
                  height: 41,
                  width: 41,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  HebrewText('גיא פינס', style: categoryName),
                  HebrewText('פעיל לפני 3 דקות', style: status),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
