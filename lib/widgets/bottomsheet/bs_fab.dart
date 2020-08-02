import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/stores/create/create_category_store.dart';
import 'package:iconapp/stores/create/create_icon_store.dart';
import '../../core/extensions/context_ext.dart';

class BottomSheetFab extends StatelessWidget {
  const BottomSheetFab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconStore = sl<CreateIconStore>();
    final categoryStore = sl<CreateCategoryStore>();
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
          onPressed: () async {
            iconStore.clear();
            categoryStore.clear();
            return ExtendedNavigator.of(context)
                .pushNamed(Routes.createIconScreen);
          },
        ),
      ),
    );
  }
}
