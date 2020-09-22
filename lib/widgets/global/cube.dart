import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';

/// This is a Custom page route we use to simulate the 3D Cubic transition from page to page
/// It should be used with the [Navigator]
///
/// This was taken from: https://stackoverflow.com/questions/59649977/flutter-transition-between-pages-with-effect-3d
///
class CubePageRoute extends PageRouteBuilder {
  /// The duration of the transition
  final Duration duration;

  /// The next page we will show
  final Widget enterPage;

  /// The current page we will dismiss
  final Widget exitPage;

  /// Background color used when the transition is running , it's [Colors.black] as default
  final Color backgroundColor;

  CubePageRoute({
    this.exitPage,
    this.enterPage,
    this.backgroundColor = Colors.black,
    this.duration = const Duration(
      milliseconds: 500,
    ),
  }) : super(
          transitionDuration: duration,
          pageBuilder: (context, animation, secondaryAnimation) => enterPage,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return Container(
              color: backgroundColor,
              child: Stack(
                children: <Widget>[
                  SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset.zero,
                      end: Offset(-1.0, 0.0),
                    ).animate(animation),
                    child: Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.003)
                        ..rotateY(pi / 2 * animation.value),
                      alignment: FractionalOffset.centerRight,
                      child: exitPage,
                    ),
                  ),
                  SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.003)
                        ..rotateY(pi / 2 * (animation.value - 1)),
                      alignment: FractionalOffset.centerLeft,
                      child: enterPage,
                    ),
                  )
                ],
              ),
            );
          },
        );
}

/// Signature for a function that creates a widget for a given index in a [CubePageView]
///
/// Used by [CubePageView.builder] and other APIs that use lazily-generated widgets.
///
typedef CubeWidgetBuilder = CubeWidget Function(
    BuildContext context, int index, double pageNotifier);

/// This Widget has the [PageView] widget inside.
/// It works in two modes :
///   1 - Using the default constructor [CubePageView] passing the items in `children` property.
///   2 - Using the factory constructor [CubePageView.builder] passing a `itemBuilder` and `itemCount` properties.
class CubePageView extends StatefulWidget {
  /// Called whenever the page in the center of the viewport changes.
  final ValueChanged<int> onPageChanged;

  /// An object that can be used to control the position to which this page
  /// view is scrolled.
  final PageController controller;

  /// Builder to customize your items
  final CubeWidgetBuilder itemBuilder;

  /// The number of items you have, this is only required if you use [CubePageView.builder]
  final int itemCount;

  /// Widgets you want to use inside the [CubePageView], this is only required if you use [CubePageView] constructor
  final List<Widget> children;

  /// Creates a scrollable list that works page by page from an explicit [List]
  /// of widgets.
  const CubePageView({
    Key key,
    this.onPageChanged,
    this.controller,
    @required this.children,
  })  : itemBuilder = null,
        itemCount = null,
        assert(children != null),
        super(key: key);

  /// Creates a scrollable list that works page by page using widgets that are
  /// created on demand.
  ///
  /// This constructor is appropriate if you want to customize the behavior
  ///
  /// Providing a non-null [itemCount] lets the [CubePageView] compute the maximum
  /// scroll extent.
  ///
  /// [itemBuilder] will be called only with indices greater than or equal to
  /// zero and less than [itemCount].
  CubePageView.builder({
    Key key,
    @required this.itemCount,
    @required this.itemBuilder,
    this.onPageChanged,
    this.controller,
  })  : this.children = null,
        assert(itemCount != null),
        assert(itemBuilder != null),
        super(key: key);

  @override
  _CubePageViewState createState() => _CubePageViewState();
}

class _CubePageViewState extends State<CubePageView> {
  final _pageNotifier = ValueNotifier(0.0);
  PageController _pageController;

  void _listener() {
    _pageNotifier.value = _pageController.page;
  }

  @override
  void initState() {
    _pageController = widget.controller ?? PageController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pageController.addListener(_listener);
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_listener);
    _pageController.dispose();
    _pageNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: ValueListenableBuilder<double>(
          valueListenable: _pageNotifier,
          builder: (_, value, child) => PageView.builder(
            controller: _pageController,
            onPageChanged: widget.onPageChanged,
            physics: const ClampingScrollPhysics(),
            itemCount: widget.itemCount ?? widget.children.length,
            itemBuilder: (_, index) {
              if (widget.itemBuilder != null)
                return widget.itemBuilder(context, index, value);
              return CubeWidget(
                child: widget.children[index],
                index: index,
                pageNotifier: value,
              );
            },
          ),
        ),
      ),
    );
  }
}

/// This widget has the logic to do the 3D cube transformation
/// It only should be used if you use [CubePageView.builder]
class CubeWidget extends StatelessWidget {
  /// Index of the current item
  final int index;

  /// Page Notifier value, it comes from the [CubeWidgetBuilder]
  final double pageNotifier;

  /// Child you want to use inside the Cube
  final Widget child;

  const CubeWidget({
    Key key,
    @required this.index,
    @required this.pageNotifier,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLeaving = (index - pageNotifier) <= 0;
    final t = (index - pageNotifier);
    final rotationY = lerpDouble(0, 90, t);
    final opacity = lerpDouble(0, 1, t.abs()).clamp(0.0, 1.0);
    final transform = Matrix4.identity();
    transform.setEntry(3, 2, 0.003);
    transform.rotateY(-degToRad(rotationY));
    return Transform(
      alignment: isLeaving ? Alignment.centerRight : Alignment.centerLeft,
      transform: transform,
      child: Stack(
        children: [
          child,
          Positioned.fill(
            child: Opacity(
              opacity: opacity,
              child: Container(
                child: Container(
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

num degToRad(num deg) => deg * (pi / 180.0);
num radToDeg(num rad) => rad * (180.0 / pi);
