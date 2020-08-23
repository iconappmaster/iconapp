import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/dependencies/locator.dart';
import '../../core/theme.dart';
import '../../routes/router.gr.dart';
import '../../screens/create_icons_screen.dart';
import '../../stores/create/create_category_store.dart';
import '../../stores/create/create_icon_store.dart';
import '../../stores/home/home_store.dart';
import '../../core/extensions/context_ext.dart';

class BottomSheetFab extends StatelessWidget {
  const BottomSheetFab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconStore = sl<CreateIconStore>();
    final categoryStore = sl<CreateCategoryStore>();
    final home = sl<HomeStore>();
    return Observer(
      builder: (_) => Positioned(
        left: context.widthPx * .069,
        child: SizedBox(
          height: 53,
          width: 53,
          child: FloatingActionButton(
            elevation: 3,
            child: home.isLoading
                ? CircularProgressIndicator(
                    backgroundColor: white, strokeWidth: 1)
                : SvgPicture.asset('assets/images/plus.svg',
                    height: 20.3, width: 20.3),
            backgroundColor: cornflower,
            onPressed: () async {
              if (!home.isLoading) {
                iconStore.clear();
                categoryStore.clear();
                return ExtendedNavigator.of(context)
                    .pushNamed(Routes.selectIconScreen,
                        arguments: SelectIconScreenArguments(
                          mode: SelectIconMode.fromGroup,
                        ));
              }
            },
          ),
        ),
      ),
    );
  }
}
