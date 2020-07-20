import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/stores/search/search_store.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:mobx/mobx.dart';
import '../../core/extensions/context_ext.dart';
import 'bs_bar.dart';
import 'bs_search_bar.dart';

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
      (mode) => pagerController.animateToPage(
          mode == SearchMode.categories ? 1 : 0,
          duration: Duration(milliseconds: 250),
          curve: Curves.easeIn),
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
    return Observer(
      builder: (_) => Container(
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
                  onTap: () => {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IconsSearchWidget extends StatelessWidget {
  final ScrollController controller;
  final Function onTap;
  const IconsSearchWidget({
    Key key,
    @required this.controller,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      itemBuilder: (context, index) {
        return Material(
          child: InkWell(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 28.7),
              height: 70,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.3),
                    child: Image.network(
                      'https://www.stripesandpearls.com/wp-content/uploads/2012/10/596252-41.jpg',
                      height: 41,
                      width: 41,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      HebrewText('גיא פינס', style: categoryName),
                      HebrewText('פעיל לפני 3 דקות', style: status),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      itemCount: 12,
    );
  }
}

class CategorySearchWidget extends StatelessWidget {
  final ScrollController controller;
  final Function onTap;

  const CategorySearchWidget({
    Key key,
    @required this.controller,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      itemBuilder: (context, index) {
        return Material(
          child: InkWell(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 28.7),
              height: 70,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  SvgPicture.asset(
                    'assets/images/entertainment.svg',
                    height: 41,
                    width: 41,
                  ),
                  SizedBox(width: 14),
                  HebrewText('עולם הבידור', style: categoryName),
                ],
              ),
            ),
          ),
        );
      },
      itemCount: 12,
    );
  }
}
