import 'package:auto_route/auto_route.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/routes/router.gr.dart';

import '../../core/extensions/context_ext.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

class BottomSheetContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        margin: EdgeInsets.only(top: 25),
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 0.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.3)),
          child: Column(
            children: <Widget>[
              Container(
                height: context.heightPlusStatusbarPerc(.109),
                child: Stack(
                  children: <Widget>[
                    BottomSheetIcon(
                        rightPoistion: 35,
                        asset: 'assets/images/icon_search.svg',
                        onTap: () => {}),
                    BottomSheetIcon(
                        rightPoistion: 109,
                        asset: 'assets/images/category_filter.svg',
                        onTap: () => {})
                  ],
                ),
              ),
              Container(
                  height: context.heightPlusStatusbarPerc(.58),
                  color: Colors.orange,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: 30,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 50,
                        color: index % 2 == 0 ? Colors.red : Colors.blue,
                      );
                    },
                  ))
            ],
          ),
        ),
      ),
      BottomSheetFab()
    ]);
  }
}

class BottomSheetFab extends StatelessWidget {
  const BottomSheetFab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: context.widthPx * .069,
      child: SizedBox(
        height: 53,
        width: 53,
        child: FloatingActionButton(
          elevation: 3,
          child: SvgPicture.asset(
            'assets/images/plus.svg',
            height: 20.3,
            width: 20.3,
          ),
          backgroundColor: cornflower,
          onPressed: () =>
              ExtendedNavigator.of(context).pushNamed(Routes.createGroupScreen),
        ),
      ),
    );
  }
}

class BottomSheetIcon extends StatelessWidget {
  final String asset;
  final Function onTap;
  final bool isSelected;
  final double rightPoistion;

  const BottomSheetIcon({
    Key key,
    @required this.asset,
    @required this.rightPoistion,
    this.onTap,
    this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 16,
      right: rightPoistion,
      child: IconButton(
        icon: SvgPicture.asset(
          asset,
          height: 35,
          width: 19.3,
        ),
        onPressed: onTap,
      ),
    );
  }
}
