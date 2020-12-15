import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/bus.dart';
import 'package:iconapp/data/sources/local/shared_preferences.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/screens/alerts_screen.dart';
import 'package:iconapp/screens/create_icons_screen.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/stores/alerts/alert_store.dart';
import 'package:iconapp/stores/create/create_category_store.dart';
import 'package:iconapp/stores/create/create_icon_store.dart';
import 'package:iconapp/stores/home/home_store.dart';
import 'package:iconapp/stores/user/user_store.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:iconapp/widgets/global/super_fab.dart';
import '../../routes/router.gr.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../core/extensions/string_ext.dart';

class IconFab extends StatelessWidget {
  const IconFab({
    Key key,
    @required UserStore user,
  })  : _user = user,
        super(key: key);

  final UserStore _user;

  @override
  Widget build(BuildContext context) {
    return SuperFab(
      ringWidth: 60,
      animationDuration: Duration(seconds: 1),
      alignment: Alignment.bottomLeft,
      fabElevation: 1,
      fabCloseColor: warmPurple,
      fabOpenColor: warmPurple,
      fabColor: warmPurple,
      animationCurve: Curves.linearToEaseOut,
      fabCloseIcon: Icon(Icons.close, color: lightMustard, size: 20),
      fabSize: 50,
      ringDiameter: 350,
      fabOpenIcon: SvgPicture.asset('assets/images/icon_star.svg',
          height: 20, width: 20),
      ringColor: warmPurple,
      children:
          _user.getUser.isIcon ? _showIconMenu(context) : _showViewer(context),
    );
  }

  List<Widget> _showViewer(BuildContext context) {
    final home = sl<HomeStore>();
    final sp = sl<SharedPreferencesService>();
    return [
      Observer(builder: (_) {
        return FabTile(
            text: home.viewMode == ViewHomeMode.staggered
                ? LocaleKeys.fab_list.tr()
                : LocaleKeys.fab_staggered.tr(),
            onTap: () {
              _close();
              _saveViewMode(home, sp);
              home.switchViewMode();
              home.setTabMode(TabMode.conversation);
            },
            iconData: home.viewMode == ViewHomeMode.staggered
                ? Icons.line_style
                : Icons.list);
      }),
      BellAlert(onPressed: () {
        final alerts = sl<AlertStore>();
        alerts.markAlertsAsSeen();
        ExtendedNavigator.of(context).pushAlertScreen();
      }),
    ];
  }

  void _saveViewMode(HomeStore home, SharedPreferencesService sp) {
    final mode = home.viewMode == ViewHomeMode.staggered
        ? ViewHomeMode.list
        : ViewHomeMode.staggered;

    // save mode
    sp.setString(StorageKey.homeViewMode, mode.toString().parseEnum());
  }

  List<Widget> _showIconMenu(BuildContext context) {
    final home = sl<HomeStore>();
    final sp = sl<SharedPreferencesService>();
    return [
      Observer(builder: (_) {
        return FabTile(
            text: home.viewMode == ViewHomeMode.staggered
                ? LocaleKeys.fab_list.tr()
                : LocaleKeys.fab_staggered.tr(),
            onTap: () {
              _close();
              _saveViewMode(home, sp);
              home.setTabMode(TabMode.conversation);
              home.switchViewMode();
            },
            iconData: home.viewMode == ViewHomeMode.staggered
                ? Icons.list
                : Icons.line_style);
      }),
      FabTile(
        iconData: Icons.add,
        text: LocaleKeys.fab_create.tr(),
        onTap: () {
          _close();
          final iconStore = sl<CreateIconStore>();
          final categoryStore = sl<CreateCategoryStore>();
          iconStore.clear();
          categoryStore.clear();
          return ExtendedNavigator.of(context)
              .pushSelectIconScreen(mode: SelectIconMode.fromGroup);
        },
      ),
      BellAlert(onPressed: () {
        final alerts = sl<AlertStore>();
        alerts.markAlertsAsSeen();
        ExtendedNavigator.of(context).pushAlertScreen();
      }),
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

  const FabTile(
      {Key key,
      @required this.text,
      @required this.onTap,
      @required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onTap(),
      child: SizedBox(
        height: 50,
        child: Observer(
          builder: (_) => Column(
            children: [
              Icon(iconData, color: lightMustard, size: 30),
              SizedBox(height: 2),
              CustomText(text,
                  style:
                      replayTitle.copyWith(color: lightMustard, fontSize: 10))
            ],
          ),
        ),
      ),
    );
  }
}
