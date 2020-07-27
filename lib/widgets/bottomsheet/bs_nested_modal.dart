import 'package:flutter/material.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/stores/search/search_store.dart';
import 'package:mobx/mobx.dart';
import '../../core/extensions/context_ext.dart';
import 'bs_bar.dart';
import 'bs_search_bar.dart';
import 'category_search.dart';
import 'icon_search.dart';

/// The [NestedSheetModal] holds both of the nested scroll search
/// [IconsSearchWidget] and [CategorySearchWidget]
class NestedSheetModal extends StatefulWidget {
  final ScrollController scrollController;

  const NestedSheetModal({Key key, this.scrollController}) : super(key: key);

  @override
  _NestedSheetModalState createState() => _NestedSheetModalState();
}

class _NestedSheetModalState extends State<NestedSheetModal> {
  PageController pagerController = PageController();
  SearchStore searchStore;
  ReactionDisposer _disposer;

  @override
  void initState() {
    searchStore = sl<SearchStore>();

    _disposer = reaction<SearchMode>(
      (_) => searchStore.getSearchMode,
      (mode) {
        pagerController.animateToPage(mode == SearchMode.categories ? 1 : 0,
            duration: Duration(milliseconds: 250), curve: Curves.easeIn);
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    pagerController.removeListener(() {});
    _disposer?.call();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
            controller: pagerController,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              IconsSearchWidget(controller: widget.scrollController),
              CategorySearchWidget(
                controller: widget.scrollController,
                onCategoryTapped: () => {print('asd')},
              ),
            ],
          ),
        ),
      ),
    );
  }
}