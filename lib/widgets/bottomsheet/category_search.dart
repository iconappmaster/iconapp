import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';

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
    return ListView.builder(
      controller: controller,
      itemBuilder: (context, index) {
        return CategorySearchItem(onTap: onCategoryTapped);
      },
      itemCount: 12,
    );
  }
}

class CategorySearchItem extends StatelessWidget {
  const CategorySearchItem({
    Key key,
    @required this.onTap,
    this.image,
    this.title,
  }) : super(key: key);

  final String image;
  final String title;
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
              Stack(children: [
                SvgPicture.asset(
                  'assets/images/entertainment.svg',
                  height: 41,
                  width: 61,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: white),
                        shape: BoxShape.circle,
                        gradient: redPinkGradient),
                    child: Center(
                      child: SvgPicture.asset('assets/images/check.svg'),
                    ),
                  ),
                )
              ]),
              SizedBox(width: 14),
              HebrewText('עולם הבידור', style: categoryName),
            ],
          ),
        ),
      ),
    );
  }
}
