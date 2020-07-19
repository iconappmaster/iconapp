import 'package:device_simulator/device_simulator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/widgets/global/focus_aware.dart';
import 'package:iconapp/widgets/onboarding/onboarding_appbar.dart';
import '../core/extensions/context_ext.dart';

const debugEnableDeviceSimulator = false;

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DeviceSimulator(
      enable: debugEnableDeviceSimulator,
      child: FocusAwareWidget(
        child: Container(
          decoration: BoxDecoration(gradient: purpleGradient),
          child: Observer(
            builder: (_) => Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                IconAppbar(showBack: false),
                DraggableScrollableSheet(
                  initialChildSize: 0.1315,
                  minChildSize: 0.1315,
                  maxChildSize: .8,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return SingleChildScrollView(
                      controller: scrollController,
                      child:
                          CustomScrollViewContent(controller: scrollController),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Content of the DraggableBottomSheet's child SingleChildScrollView
class CustomScrollViewContent extends StatefulWidget {
  final ScrollController controller;

  const CustomScrollViewContent({Key key, @required this.controller})
      : super(key: key);

  @override
  _CustomScrollViewContentState createState() =>
      _CustomScrollViewContentState();
}

class _CustomScrollViewContentState extends State<CustomScrollViewContent> {
  bool _showFab = true;

  void handleScroll() async {
    widget.controller.addListener(() {
      if (widget.controller.position.userScrollDirection ==
          ScrollDirection.reverse) {
        print('up');
        hideFloationButton();
      } else {
        showFloationButton();
        print('down');
      }
    });
  }

  @override
  void initState() {
    handleScroll();
    super.initState();
  }

  void showFloationButton() {
    setState(() {
      _showFab = true;
    });
  }

  void hideFloationButton() {
    setState(() {
      _showFab = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        margin: EdgeInsets.only(top: context.heightPlusStatusbarPerc(.00)),
        child: Card(
          elevation: 0.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.3)),
          margin: const EdgeInsets.all(0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
            ),
            child: CustomInnerContent(),
          ),
        ),
      ),
      Visibility(
        visible: _showFab,
        child: Positioned(
          left: context.widthPx * .069,
          child: SizedBox(
            height: 53,
            width: 53,
            child: FloatingActionButton(
              elevation: 3,
              child: SvgPicture.asset(
                'assets/images/plus.svg',
                height: 20.3,
                width: 20.3,
              ),
              backgroundColor: cornflower,
              onPressed: () {},
            ),
          ),
        ),
      )
    ]);
  }

  @override
  void dispose() {
    widget.controller.removeListener(() {});
    super.dispose();
  }
}

class CustomInnerContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: context.heightPlusStatusbarPerc(.109),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 16,
                right: 35,
                child: IconButton(
                  icon: SvgPicture.asset(
                    'assets/images/icon_search.svg',
                    height: 35,
                    width: 19.3,
                  ),
                  onPressed: () {},
                ),
              ),
              Positioned(
                top: 16,
                right: 109,
                child: IconButton(
                  icon: SvgPicture.asset(
                    'assets/images/category_filter.svg',
                    height: 35,
                    width: 19.3,
                  ),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
        // CustomExploreBerlin(),
        // SizedBox(height: 16),
        // CustomHorizontallyScrollingRestaurants(),
        // SizedBox(height: 24),
        // CustomFeaturedListsText(),
        // SizedBox(height: 16),
        CustomFeaturedItemsGrid(),
        SizedBox(height: 24),
        CustomRecentPhotosText(),
        SizedBox(height: 16),
        CustomRecentPhotoLarge(),
        SizedBox(height: 12),
        CustomRecentPhotosSmall(),
        SizedBox(height: 16),
      ],
    );
  }
}

class CustomExploreBerlin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Explore Berlin",
            style: TextStyle(fontSize: 22, color: Colors.black45)),
        SizedBox(width: 8),
        Container(
          height: 24,
          width: 24,
          child: Icon(Icons.arrow_forward_ios, size: 12, color: Colors.black54),
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(16)),
        ),
      ],
    );
  }
}

class CustomHorizontallyScrollingRestaurants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomRestaurantCategory(),
            SizedBox(width: 12),
            CustomRestaurantCategory(),
            SizedBox(width: 12),
            CustomRestaurantCategory(),
            SizedBox(width: 12),
            CustomRestaurantCategory(),
            SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}

class CustomFeaturedListsText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      //only to left align the text
      child: Row(
        children: <Widget>[
          Text("Featured Lists", style: TextStyle(fontSize: 14))
        ],
      ),
    );
  }
}

class CustomFeaturedItemsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.count(
        //to avoid scrolling conflict with the dragging sheet
        physics: NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(0),
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        shrinkWrap: true,
        children: <Widget>[
          CustomFeaturedItem(),
          CustomFeaturedItem(),
          CustomFeaturedItem(),
          CustomFeaturedItem(),
        ],
      ),
    );
  }
}

class CustomRecentPhotosText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        children: <Widget>[
          Text("Recent Photos", style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

class CustomRecentPhotoLarge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomFeaturedItem(),
    );
  }
}

class CustomRecentPhotosSmall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomFeaturedItemsGrid();
  }
}

class CustomRestaurantCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.grey[500],
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}

class CustomFeaturedItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey[500],
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
