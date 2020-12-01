import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iconapp/data/sources/local/shared_preferences.dart';
import 'package:iconapp/screens/create_icons_screen.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/stores/create/create_category_store.dart';
import 'package:iconapp/stores/create/create_icon_store.dart';
import 'package:iconapp/stores/home/home_store.dart';
import 'package:iconapp/stores/user/user_store.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:iconapp/widgets/global/super_fab.dart';
import '../../routes/router.gr.dart';
import '../../core/extensions/string_ext.dart';

class IconFab extends StatelessWidget {
  const IconFab({
    Key key,
    @required UserStore user,
    @required HomeStore home,
  })  : _user = user,
        _home = home,
        super(key: key);

  final UserStore _user;
  final HomeStore _home;

  @override
  Widget build(BuildContext context) {
    return SuperFab(
      ringWidth: 90,
      alignment: Alignment.bottomLeft,
      fabElevation: 5,
      fabCloseColor: cornflower,
      fabOpenColor: cornflower,
      fabColor: cornflower,
      animationCurve: Curves.ease,
      fabCloseIcon: Icon(Icons.close, color: white),
      fabSize: 50,
      ringDiameter: 350,
      fabOpenIcon: Icon(Icons.star, color: white),
      ringColor: cornflower,
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
                ? 'תצוגה רשימה'
                : 'תצוגת ריבועים',
            onTap: () {
              // get view mode
              _saveViewMode(home, sp);
              home.switchViewMode();
            },
            iconData: home.viewMode == ViewHomeMode.staggered
                ? Icons.line_style
                : Icons.list);
      }),
      FabTile(
        iconData: Icons.play_arrow,
        text: 'IconTube',
        onTap: () {
          if (!_home.isLoading)
            ExtendedNavigator.of(context)
                .pushFeedPlayer(index: 0, urls: _home.userMedia);
        },
      ),
    ];
  }

  void _saveViewMode(HomeStore home, SharedPreferencesService sp) {
    final mode = home.viewMode == ViewHomeMode.staggered
        ? ViewHomeMode.staggered
        : ViewHomeMode.list;

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
              ? 'רשימה'
              : 'תצוגת קוביות',
          onTap: () {
            _saveViewMode(home, sp);
            home.switchViewMode();
          },
          iconData: home.viewMode == ViewHomeMode.staggered
              ? Icons.list
              : Icons.line_style,
        );
      }),
      FabTile(
        iconData: Icons.play_arrow,
        text: 'IconTube',
        onTap: () {
          if (!_home.isLoading)
            ExtendedNavigator.of(context)
                .pushFeedPlayer(index: 0, urls: _home.userMedia);
        },
      ),
      FabTile(
        iconData: Icons.add,
        text: 'קבוצה חדשה',
        onTap: () {
          final iconStore = sl<CreateIconStore>();
          final categoryStore = sl<CreateCategoryStore>();
          iconStore.clear();
          categoryStore.clear();
          return ExtendedNavigator.of(context)
              .pushSelectIconScreen(mode: SelectIconMode.fromGroup);
        },
      ),
    ];
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
      onTap: () {
        onTap();
      },
      child: SizedBox(
        height: 80,
        child: Observer(
          builder: (_) {
            return Column(
              children: [
                Icon(iconData, color: white, size: 40),
                SizedBox(height: 8),
                CustomText(text,
                    style: replayTitle.copyWith(
                      color: white,
                      fontSize: 10,
                    )),
              ],
            );
          },
        ),
      ),
    );
  }
}
