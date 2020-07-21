import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/screens/create_group.dart';
import 'package:iconapp/widgets/create/create_app_bar.dart';
import 'package:iconapp/widgets/global/check_circle.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';

enum GroupPickMode { icons, categories }

/// This Widget is used to select [Icons, Categories] from a list
class CreateGroupSelectWidget extends StatelessWidget {
  final GroupPickMode mode;
  final String appbarTitle;
  final Function onNextTap;
  final String nextButtonAsset;

  const CreateGroupSelectWidget({
    Key key,
    @required this.mode,
    @required this.appbarTitle,
    @required this.onNextTap,
    this.nextButtonAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            CreateGroupAppbar(title: appbarTitle),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return CreateConversationItem(
                    title: mode == GroupPickMode.icons ? 'גיא פינס' : 'בישול',
                    url: mode == GroupPickMode.icons
                        ? urlIconMock
                        : urlCategoryMock,
                  );
                },
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 25,
          left: 25,
          child: FloatingActionButton(
            child: SvgPicture.asset(nextButtonAsset, height: 16.3, width: 16.3),
            backgroundColor: cornflower,
            onPressed: onNextTap,
          ),
        ),
      ],
    );
  }
}

// THIS ITEM CONTAINS AN IMAGE AND A TITLE FOR CREATE GROUP ITEM
class CreateConversationItem extends StatelessWidget {
  final String title;
  final String url;
  final bool isSelected;

  const CreateConversationItem({
    Key key,
    @required this.title,
    @required this.url,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 17.3, vertical: 15.3),
      margin: EdgeInsets.symmetric(horizontal: 21.7, vertical: 4.85),
      height: 72,
      color: darkIndigo2,
      child: Row(
        children: <Widget>[
          Container(
            height: 48,
            width: 48,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.3),
                  child: Image.network(
                    url,
                    fit: BoxFit.cover,
                    width: 41.3,
                    height: 41,
                  ),
                ),
                if (isSelected)
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: CheckCircle(),
                  ),
              ],
            ),
          ),
          SizedBox(width: 19.7),
          HebrewText(
            title,
            style: createCategoryTitle,
          ),
        ],
      ),
    );
  }
}
