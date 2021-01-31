import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/core/video/feed_player/feed_player.dart';
import 'package:iconapp/screens/home_screen.dart';
import 'package:iconapp/stores/home/home_store.dart';
import 'home_list.dart';
import 'home_staggered.dart';
import 'icon_fab.dart';

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
                    onRefresh: () => refreshData(),
                    child: home.viewMode == ViewHomeMode.list
                        ? ConversationsList(
                            controller: controller,
                            onTap: (model, index) => onTileTap(
                              model,
                              context,
                              index,
                            ),
                          )
                        : HomeStaggered(
                            onTap: (model, index) => onTileTap(
                              model,
                              context,
                              index,
                            ),
                          ),
                  ),
                  Positioned(
                    bottom: 62,
                    right: 12,
                    child: Observer(
                      builder: (_) {
                        return CupertinoSlidingSegmentedControl(
                          thumbColor: lightishRed,
                          backgroundColor: blueberry2,
                          groupValue: home?.viewMode == ViewHomeMode.list ? 1 : 0,
                          children: {
                            0: Icon(Icons.line_style, color: white),
                            1: Icon(Icons.list, color: white),
                          },
                          onValueChanged: (index) {
                            HapticFeedback.lightImpact();

                            persistViewMode(home);
                            home.switchViewMode();
                            home.setTabMode(TabMode.conversation);
                          },
                        );
                      },
                    ),
                  ),
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
