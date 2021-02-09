import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/bus.dart';
import 'package:iconapp/data/sources/local/shared_preferences.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/screens/create_icons_screen.dart';
import 'package:flutter/rendering.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/stores/alerts/alert_store.dart';
import 'package:iconapp/stores/create/create_category_store.dart';
import 'package:iconapp/stores/create/create_icon_store.dart';
import 'package:iconapp/stores/home/home_store.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:iconapp/widgets/global/super_fab.dart';
import '../../routes/router.gr.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../core/extensions/string_ext.dart';

class IconFab extends StatelessWidget {
  final alerts = sl<AlertStore>();
  @override
  Widget build(BuildContext context) {
    return SuperFab(
      ringWidth: 60,
      animationDuration: Duration(seconds: 1),
      alignment: Alignment.bottomLeft,
      fabElevation: 1,
      fabCloseColor: warmPurple,
      fabOpenColor: warmPurple,
      onDisplayChange: (isOpen) {
        final home = sl<HomeStore>();

        home.setFabOpen(isOpen);
      },
      fabColor: warmPurple,
      animationCurve: Curves.linearToEaseOut,
      fabCloseIcon: Icon(Icons.close, color: lightMustard, size: 20),
      fabSize: 50,
      ringDiameter: 350,
      fabOpenIcon: SvgPicture.asset('assets/images/plus.svg', height: 20, width: 20),
      ringColor: warmPurple,
      children: _showIconMenu(context),
    );
  }

  List<Widget> _showIconMenu(BuildContext context) {
    return [
      Spacer(),
      FabTile(
        iconData: Icons.add,
        text: LocaleKeys.fab_create.tr(),
        onTap: () {
          _close();
          final iconStore = sl<CreateIconStore>();
          final categoryStore = sl<CreateCategoryStore>();
          iconStore.clear();
          categoryStore.clear();
          return ExtendedNavigator.of(context).pushSelectIconScreen(mode: SelectIconMode.fromGroup);
        },
      ),
      Spacer(),
    ];
  }

  void _close() {
    sl<Bus>().fire(FabCloseEvent());
  }
}

class FabTile extends StatelessWidget {
  final String text;
  final IconData iconData;
  final Function onTap;

  const FabTile({
    Key key,
    @required this.text,
    @required this.onTap,
    @required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onTap(),
      child: SizedBox(
        height: 50,
        child: Column(
          children: [
            Icon(iconData, color: lightMustard, size: 30),
            SizedBox(height: 2),
            CustomText(
              text,
              style: replayTitle.copyWith(color: lightMustard, fontSize: 10),
            )
          ],
        ),
      ),
    );
  }
}

void persistViewMode(HomeStore home) {
  final preferences = sl<SharedPreferencesService>();
  final mode = home.viewMode == ViewHomeMode.staggered ? ViewHomeMode.list : ViewHomeMode.staggered;

  // save mode
  preferences.setString(StorageKey.homeViewMode, mode.toString().parseEnum());
}
