import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';
import '../../core/extensions/context_ext.dart';
import 'bs_bar.dart';
import 'bs_search_bar.dart';

class NestedSheetModal extends StatelessWidget {
  final ScrollController scrollController;

  const NestedSheetModal({Key key, this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   color: white,
      //   borderRadius: BorderRadius.only(
      //       topLeft: Radius.circular(13.7), topRight: Radius.circular(13.7)),
      // ),
      margin: EdgeInsets.only(top: context.heightPx * .08),
      child: NestedScrollView(
        controller: ScrollController(),
        physics: ScrollPhysics(parent: PageScrollPhysics()),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  BottomSheetBar(),
                  SearchBar(),
                ],
              ),
            ),
          ];
        },
        body: Container(
          color: white,
          child: PageView(
            children: <Widget>[
              ListView.builder(
                controller: scrollController,
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    color: index % 2 == 0 ? Colors.red : Colors.orange,
                  );
                },
                itemCount: 12,
              ),
              ListView.builder(
                controller: scrollController,
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    color: index % 2 == 0 ? Colors.blue : Colors.lime,
                  );
                },
                itemCount: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
