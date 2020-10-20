import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/stores/comments/comments_store.dart';
import 'package:iconapp/widgets/chat/compose/panel_compose.dart';
import 'package:iconapp/widgets/comments/comments_fab.dart';
import 'package:iconapp/widgets/global/lottie_loader.dart';

import 'comments_list.dart';

class CommentsBottomSheet extends StatelessWidget {
  final ScrollController scrollController;

  const CommentsBottomSheet({
    Key key,
    @required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = sl<CommentsStore>();
    final radius = Radius.circular(20);
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 35.0),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: radius,
                topRight: radius,
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * .6,
                decoration: BoxDecoration(
                  gradient: purpleGradient,
                ),
                child: Observer(
                  builder: (_) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                          child: store.loading
                              ? Center(child: LottieLoader())
                              : CommentsList(controller: scrollController)),
                      Material(
                        color: Colors.transparent,
                        child: PanelMessageCompose(
                          composerMode: ComposerPanelMode.comments,
                          scrollController: scrollController,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              left: 30,
              top: 0,
              child: CommentsFab(onTap: () => Navigator.pop(context))),
        ],
      ),
    );
  }
}
