import 'package:flutter/rendering.dart';
import 'package:iconapp/core/theme.dart';
import 'package:flutter/material.dart';

import 'bs_action_button.dart';
import 'bs_fab.dart';
import 'bs_search_bar.dart';

class BottomSheetBar extends StatelessWidget {
  const BottomSheetBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 98.2,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(13.3),
                  topRight: Radius.circular(13.3),
                ),
                color: white,
              ),
              child: BottomSheetActionButtons(),
            ),
          ),
          BottomSheetFab(),
        ],
      ),
    );
  }
}

class IconsSearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class CategorySearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
