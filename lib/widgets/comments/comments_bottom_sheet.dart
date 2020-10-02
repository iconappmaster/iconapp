import 'package:flutter/material.dart';
import 'package:iconapp/widgets/chat/compose/panel_compose.dart';

import '../../core/extensions/context_ext.dart';

class CommentsBottomSheet extends StatelessWidget {
  final ScrollController controller;

  const CommentsBottomSheet({
    Key key,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.heightPx * .6),
      child: NestedScrollView(
          controller: ScrollController(),
          physics: ScrollPhysics(parent: PageScrollPhysics()),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    // Container(
                    //   color: Colors.red,
                    //   height: context.heightPx * .4,
                    // ),
                    // Container(
                    //   color: Colors.yellow,
                    //   height: context.heightPx * .1,
                    // )
                  ],
                ),
              ),
            ];
          },
          body: Column(
            children: [
              Container(
                color: Colors.green,
                height: context.heightPx * .252,
              ),
              Material(
                  child: PanelMessageCompose(
                composerMode: ComposerPanelMode.comments,
                controller: controller,
              ))
            ],
          )),
    );
  }
}
