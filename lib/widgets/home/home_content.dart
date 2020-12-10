import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/core/video/feed_player/feed_player.dart';
import 'package:iconapp/screens/home_screen.dart';
import 'package:iconapp/stores/home/home_store.dart';

import 'home_list.dart';
import 'home_staggered.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({
    Key key,
    @required HomeStore home,
    @required ScrollController controller,
  })  : _home = home,
        _controller = controller,
        super(key: key);

  final HomeStore _home;
  final ScrollController _controller;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        switch (_home.tabMode) {
          case TabMode.conversation:
            return Expanded(
              child: RefreshIndicator(
                color: white,
                strokeWidth: 2,
                backgroundColor: cornflower,
                onRefresh: () => refreshData(),
                child: _home.viewMode == ViewHomeMode.list
                    ? ConversationsList(
                        controller: _controller,
                        onTap: (model, index) =>
                            onTileTap(model, context, index))
                    : HomeStaggered(
                        onTap: (model, index) => onTileTap(
                          model,
                          context,
                          index,
                        ),
                      ),
              ),
            );
            break;

          case TabMode.media:
            return Flexible(
              child: FeedPlayer(
                showClose: false,
                urls: _home.userMedia,
                index: 0,
              ),
            );
            break;
        }
        return Container();
      },
    );
  }
}
