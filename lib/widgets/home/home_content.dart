import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/core/video/feed_player/feed_player.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/helpers/tutorial.dart';
import 'package:iconapp/screens/home_screen.dart';
import 'package:iconapp/stores/home/home_store.dart';
import 'package:showcaseview/showcaseview.dart';
import 'home_list.dart';
import 'home_staggered.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeContent extends StatelessWidget {
  final HomeStore home;
  final ScrollController controller;

  const HomeContent({
    Key key,
    @required this.home,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        switch (home.tabMode) {
          case TabMode.conversation:
            return Expanded(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  RefreshIndicator(
                    color: white,
                    strokeWidth: 2,
                    backgroundColor: cornflower,
                    onRefresh: () => home.refreshData(),
                    child: home.viewMode == ViewHomeMode.list
                        ? ConversationsList(
                            controller: controller,
                            onTap: (model, index) => onTileTap(
                                  model,
                                  context,
                                  index,
                                ))
                        : HomeStaggered(
                            onTap: (model, index) => onTileTap(
                                  model,
                                  context,
                                  index,
                                )),
                  ),
                  Positioned(bottom: 62, right: 12, child: HomeViewModeSwitch(home: home)),
                  BlueMask(home: home),
                ],
              ),
            );

            break;

          case TabMode.media:
            return Flexible(
              child: Observer(builder: (_) {
                return FeedPlayer(
                  showClose: false,
                  media: home.userMedia,
                  index: 0,
                );
              }),
            );
            break;
        }
        return Container();
      },
    );
  }
}

/// This switch can toggle views on the home list.
/// The user will be able to choose between [ViewHomeMode.staggered] and [ViewHomeMode.list]
class HomeViewModeSwitch extends StatelessWidget {
  const HomeViewModeSwitch({
    Key key,
    @required this.home,
  })  : assert(home != null),
        super(key: key);

  final HomeStore home;

  @override
  Widget build(BuildContext context) {
    return Showcase(
      description: LocaleKeys.toturial_homeViewSwitch.tr(),
      key: showcaseHomeViewSwitche,
      child: Observer(
        builder: (_) => CupertinoSlidingSegmentedControl(
          thumbColor: lightishRed,
          backgroundColor: blueberry2,
          groupValue: home.selectedSwitchIndex,
          children: _children,
          onValueChanged: (index) {
            HapticFeedback.lightImpact();
            // persistViewMode(home);
            home.switchViewMode();
          },
        ),
      ),
    );
  }

  Map<int, Widget> get _children {
    return {
      0: Icon(Icons.line_style, color: white),
      1: Icon(Icons.list, color: white),
    };
  }
}

class BlueMask extends StatelessWidget {
  const BlueMask({
    Key key,
    @required this.home,
  }) : super(key: key);

  final HomeStore home;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Visibility(
          visible: home.isFabOpen,
          child: Container(
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                  child: Container(decoration: BoxDecoration(color: Colors.black.withOpacity(.5))))));
    });
  }
}
