import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class CheckMarkIndicator extends StatefulWidget {
  final Widget child;
  final Function onRefresh;

  const CheckMarkIndicator({
    Key key,
    @required this.child,
    @required this.onRefresh,
  }) : super(key: key);

  @override
  _CheckMarkIndicatorState createState() => _CheckMarkIndicatorState();
}

class _CheckMarkIndicatorState extends State<CheckMarkIndicator>
    with SingleTickerProviderStateMixin {
  static const _indicatorSize = 100.0;

  /// Whether to render check mark instead of spinner
  bool _renderCompleteState = false;

  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
      offsetToArmed: _indicatorSize,
      onRefresh: widget.onRefresh,
      child: widget.child,
      completeStateDuration: const Duration(seconds: 2),
      builder: (
        BuildContext context,
        Widget child,
        IndicatorController controller,
      ) {
        return Stack(
          children: <Widget>[
            AnimatedBuilder(
              animation: controller,
              builder: (BuildContext context, Widget _) {
                /// set [_renderCompleteState] to true when controller.state become completed
                if (controller.didStateChange(to: IndicatorState.complete)) {
                  _renderCompleteState = true;

                  /// set [_renderCompleteState] to false when controller.state become idle
                } else if (controller.didStateChange(to: IndicatorState.idle)) {
                  _renderCompleteState = false;
                }
                final containerHeight = controller.value * _indicatorSize;

                return Container(
                  alignment: Alignment.center,
                  height: containerHeight,
                  child: OverflowBox(
                    maxHeight: 40,
                    minHeight: 40,
                    maxWidth: 40,
                    minWidth: 40,
                    alignment: Alignment.center,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      alignment: Alignment.center,
                      child: _renderCompleteState
                          ? const Icon(
                              Icons.check,
                              color: Colors.white,
                            )
                          : SizedBox(
                              height: 30,
                              width: 30,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white),
                                value:
                                    controller.isDragging || controller.isArmed
                                        ? controller.value.clamp(0.0, 1.0)
                                        : null,
                              ),
                            ),
                      decoration: BoxDecoration(
                        color: _renderCompleteState
                            ? Colors.greenAccent
                            : Colors.black,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                );
              },
            ),
            AnimatedBuilder(
              builder: (context, _) {
                return Transform.translate(
                  offset: Offset(0.0, controller.value * _indicatorSize),
                  child: child,
                );
              },
              animation: controller,
            ),
          ],
        );
      },
    );
  }
}

typedef IndicatorBuilder = Widget Function(
  BuildContext context,
  Widget child,
  IndicatorController controller,
);

typedef OnRefresh = Future<void> Function();

class CustomRefreshIndicator extends StatefulWidget {
  static const armedFromValue = 1.0;
  static const defaultExtentPercentageToArmed = 0.20;

  /// Duration of changing [IndicatorController] value from `<1.0` to `0.0`.
  /// When user stop dragging list before it become to armed [IndicatorState].
  final Duration draggingToIdleDuration;

  /// Duration of changing [IndicatorController] value from `<=1.5` to `1.0`.
  /// Will start just before [onRefresh] function invocation.
  final Duration armedToLoadingDuration;

  /// Duration of changing [IndicatorController] value from `1.0` to `0.0`
  /// when [onRefresh] callback was completed.
  ///
  /// Occurs after `loading` or `complete` state.
  final Duration loadingToIdleDuration;

  /// {@macro custom_refresh_indicator.complete_state}
  final Duration completeStateDuration;

  /// A check that specifies whether a [ScrollNotification] should be
  /// handled by this widget.
  ///
  /// By default, checks whether `notification.depth == 0`. Set it to something
  /// else for more complicated layouts.
  final ScrollNotificationPredicate notificationPredicate;

  /// Whether to display leading glow
  final bool leadingGlowVisible;

  /// Whether to display trailing glow
  final bool trailingGlowVisible;

  /// Number of pixels that user should drag to change [IndicatorState] from idle to armed.
  final double offsetToArmed;

  /// Value from 0.0 to 1.0 that describes the percentage of scroll container extent
  /// that user should drag to change [IndicatorState] from idle to armed.
  final double extentPercentageToArmed;

  /// Part of widget tree that contains scrollable element (like ListView).
  /// Scroll notifications from the first scrollable element will be used
  /// to calculate [IndicatorController] data.
  final Widget child;

  /// Function in wich custom refresh indicator should be implemented.
  ///
  /// IMPORTANT:
  /// IT IS NOT CALLED ON EVERY [IndicatorController] DATA CHANGE.
  ///
  /// TIP:
  /// To rebuild widget on every [IndicatorController] data change, consider
  /// using [IndicatorController] that is passed to this function as the third argument
  /// in combination with [AnimationBuilder].
  final IndicatorBuilder builder;

  /// A function that's called when the user has dragged the refresh indicator
  /// far enough to demonstrate that they want the app to refresh.
  /// The returned [Future] must complete when the refresh operation is finished.
  final OnRefresh onRefresh;

  /// Indicator controller keeps all thata related to refresh indicator.
  /// It extends [ChangeNotifier] so that it could be listen for changes.
  ///
  /// TIP:
  /// Consider using it in combination with [AnimationBuilder] as animation argument
  ///
  /// The indicator controller will be passed as the third argument to the [builder] method.
  ///
  /// To better understand this data, look at example app.
  final IndicatorController controller;

  CustomRefreshIndicator({
    Key key,
    @required this.child,
    @required this.onRefresh,
    @required this.builder,
    this.notificationPredicate = defaultScrollNotificationPredicate,
    this.controller,
    this.offsetToArmed,
    this.extentPercentageToArmed,
    this.draggingToIdleDuration = const Duration(milliseconds: 300),
    this.armedToLoadingDuration = const Duration(milliseconds: 200),
    this.loadingToIdleDuration = const Duration(milliseconds: 100),
    this.completeStateDuration,
    this.leadingGlowVisible = false,
    this.trailingGlowVisible = true,
  })  : assert(child != null, '`child` argument cannot be null.'),
        assert(builder != null, '`builder` argument cannot be null.'),
        assert(
          extentPercentageToArmed == null || offsetToArmed == null,
          'Providing `extentPercentageToArmed` argument take no effect when `offsetToArmed` is provided. '
          'Remove redundant argument.',
        ),
        super(key: key);

  @override
  _CustomRefreshIndicatorState createState() => _CustomRefreshIndicatorState();
}

class _CustomRefreshIndicatorState extends State<CustomRefreshIndicator>
    with TickerProviderStateMixin {
  bool __canStart = false;

  /// Whether custom refresh indicator can change [IndicatorState] from `idle` to `dragging`
  bool get _canStart =>
      __canStart && _customRefreshIndicatorController._refreshEnabled;
  set _canStart(bool canStart) {
    __canStart = canStart;
  }

  double _dragOffset;

  AnimationController _animationController;
  IndicatorController _customRefreshIndicatorController;

  /// Current [IndicatorController]
  IndicatorController get controller => _customRefreshIndicatorController;

  static const double _kPositionLimit = 1.5;
  static const double _kInitialValue = 0.0;

  @override
  void initState() {
    _dragOffset = 0;
    _canStart = false;

    _customRefreshIndicatorController =
        widget.controller ?? IndicatorController._();

    _animationController = AnimationController(
      vsync: this,
      upperBound: _kPositionLimit,
      lowerBound: _kInitialValue,
      value: _kInitialValue,
    )..addListener(_updateCustomRefreshIndicatorValue);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _customRefreshIndicatorController.dispose();
    super.dispose();
  }

  /// Notifies the listeners of the controller
  void _updateCustomRefreshIndicatorValue() {
    _customRefreshIndicatorController._setValue(
      _animationController?.value ?? _kInitialValue,
    );
  }

  bool _handleGlowNotification(OverscrollIndicatorNotification notification) {
    if (notification.depth != 0) return false;
    if (notification.leading) {
      if (!widget.leadingGlowVisible) notification.disallowGlow();
    } else {
      if (!widget.trailingGlowVisible) notification.disallowGlow();
    }
    return true;
  }

  bool _handleScrollStartNotification(ScrollStartNotification notification) {
    _canStart = notification.metrics.extentBefore == 0 &&
        controller.state == IndicatorState.idle;

    if (_canStart) controller._setIndicatorState(IndicatorState.dragging);

    controller._setAxisDirection(notification.metrics.axisDirection);
    return false;
  }

  bool _handleScrollUpdateNotification(ScrollUpdateNotification notification) {
    /// hide when list starts to scroll
    if (controller.state == IndicatorState.dragging ||
        controller.state == IndicatorState.armed) {
      if (notification.metrics.extentBefore > 0.0) {
        _hide();
      } else {
        _dragOffset -= notification.scrollDelta;
        _calculateDragOffset(notification.metrics.viewportDimension);
      }
      if (controller.state == IndicatorState.armed &&
          notification.dragDetails == null) {
        _start();
      }
    }
    return false;
  }

  bool _handleOverscrollNotification(OverscrollNotification notification) {
    _dragOffset -= notification.overscroll;
    _calculateDragOffset(notification.metrics.viewportDimension);
    return false;
  }

  bool _handleScrollEndNotification(ScrollEndNotification notification) {
    if (_animationController.value >= CustomRefreshIndicator.armedFromValue) {
      if (controller.state == IndicatorState.armed) {
        _start();
      }
    } else {
      _hide();
    }
    return false;
  }

  bool _handleUserScrollNotification(UserScrollNotification notification) {
    controller._setScrollingDirection(notification.direction);
    return false;
  }

  void _calculateDragOffset(double containerExtent) {
    if (controller.state == IndicatorState.hiding ||
        controller.state == IndicatorState.loading) return;

    double newValue;

    /// If [offestToArmed] is provided then it will be used otherwise
    /// [extentPercentageToArmed]
    if (widget.offsetToArmed != null) {
      newValue = _dragOffset / widget.offsetToArmed;
    } else {
      final extentPercentageToArmed = widget.extentPercentageToArmed ??
          CustomRefreshIndicator.defaultExtentPercentageToArmed;

      newValue = _dragOffset / (containerExtent * extentPercentageToArmed);
    }

    if (newValue >= CustomRefreshIndicator.armedFromValue) {
      controller._setIndicatorState(IndicatorState.armed);
    } else if (newValue > 0.0) {
      controller._setIndicatorState(IndicatorState.dragging);
    }

    /// triggers indicator update
    _animationController.value = newValue.clamp(0.0, _kPositionLimit);
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    /// if notification predicate is not matched then notification
    /// will not be handled by this widget
    if (!widget.notificationPredicate(notification)) return false;

    if (notification is ScrollStartNotification)
      return _handleScrollStartNotification(notification);
    if (!_canStart) return false;
    if (notification is ScrollUpdateNotification)
      return _handleScrollUpdateNotification(notification);
    if (notification is OverscrollNotification)
      return _handleOverscrollNotification(notification);
    if (notification is ScrollEndNotification)
      return _handleScrollEndNotification(notification);
    if (notification is UserScrollNotification)
      return _handleUserScrollNotification(notification);

    return false;
  }

  void _start() async {
    _dragOffset = 0;

    controller._setIndicatorState(IndicatorState.loading);
    await _animationController.animateTo(1.0,
        duration: widget.armedToLoadingDuration);
    await widget.onRefresh();

    if (!mounted) return;

    /// optional complete state
    if (widget.completeStateDuration != null) {
      controller._setIndicatorState(IndicatorState.complete);
      await Future.delayed(widget.completeStateDuration);
    }

    if (!mounted) return;
    controller._setIndicatorState(IndicatorState.hiding);
    await _animationController.animateTo(0.0,
        duration: widget.loadingToIdleDuration);

    if (!mounted) return;

    controller._setIndicatorState(IndicatorState.idle);
  }

  void _hide() async {
    controller._setIndicatorState(IndicatorState.hiding);
    _dragOffset = 0;
    _canStart = false;
    await _animationController.animateTo(
      0.0,
      duration: widget.draggingToIdleDuration,
      curve: Curves.ease,
    );

    if (!mounted) return;

    controller._setIndicatorState(IndicatorState.idle);
  }

  @override
  Widget build(BuildContext context) => widget.builder.call(
        context,
        NotificationListener<ScrollNotification>(
          onNotification: _handleScrollNotification,
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: _handleGlowNotification,
            child: widget.child,
          ),
        ),
        controller,
      );
}

/// Describes state of CustomRefreshIndicator
enum IndicatorState {
  /// #### [CustomRefreshIndicator] is idle (There is no action)
  ///
  /// (`CustomRefreshIndicatorData.value == 0`)
  idle,

  /// #### Whether user is dragging [CustomRefreshIndicator]
  /// ending the scroll **WILL NOT** result in `onRefresh` call
  ///
  /// (`CustomRefreshIndicatorData.value < 1`)
  dragging,

  /// #### [CustomRefreshIndicator] is armed
  /// ending the scroll **WILL** result in:
  /// - `CustomRefreshIndicator.onRefresh` call
  /// - change of status to `loading`
  /// - decreasing `CustomRefreshIndicatorData.value` to `1` in
  /// duration specified by `CustomRefreshIndicator.armedToLoadingDuration`)
  ///
  /// (`CustomRefreshIndicatorData.value >= 1`)
  armed,

  /// #### [CustomRefreshIndicator] is hiding indicator
  /// when `onRefresh` future is resolved or indicator was canceled
  /// (scroll ended when [IndicatorState] was equal to `dragging`
  /// so `value` was less than `1` or the user started scrolling through the list)
  ///
  /// (`CustomRefreshIndicatorData.value` decreases to `0`
  /// in duration specified by `CustomRefreshIndicator.draggingToIdleDuration`)
  hiding,

  /// #### [CustomRefreshIndicator] is awaiting on `onRefresh` call result
  /// When `onRefresh` will resolve [CustomRefreshIndicator] will change state
  /// from `loading` to `hiding` and decrease `CustomRefreshIndicatorData.value`
  /// from `1` to `0` in duration specified by `CustomRefreshIndicator.loadingToIdleDuration`
  ///
  /// (`CustomRefreshIndicatorData.value == 1`)
  loading,

  /// ### IMPORTANT
  /// This state is skipped by default.
  ///
  /// {@template custom_refresh_indicator.complete_state}
  /// If [CustomRefreshIndicator.completeStateDuration] argument is provided to CustomRefreshIndicator,
  /// state will changed from [loading] to [complete] for duration of [CustomRefreshIndicator.completeStateDuration].
  ///
  /// If [CustomRefreshIndicator.completeStateDuration] equals `null`, state
  /// will skip [complete] state and will immediately become [hidding].
  /// {@endtemplate}
  complete,
}

class IndicatorController extends ChangeNotifier {
  double _value;

  /// Current indicator value / progress
  double get value => _value;

  /// Creates [CustomRefreshIndicator] controller class
  factory IndicatorController({
    bool refreshEnabled,
  }) =>
      IndicatorController._(refreshEnabled: refreshEnabled);

  IndicatorController._({
    double value,
    AxisDirection direction,
    ScrollDirection scrollingDirection,
    IndicatorState state,
    bool refreshEnabled,
  })  : _currentState = state ?? IndicatorState.idle,
        _previousState = state ?? IndicatorState.idle,
        _scrollingDirection = scrollingDirection ?? ScrollDirection.idle,
        _direction = direction ?? AxisDirection.down,
        _value = value ?? 0.0,
        _refreshEnabled = refreshEnabled ?? true;

  @protected
  void _setValue(double value) {
    _value = value;
    notifyListeners();
  }

  ScrollDirection _scrollingDirection;
  void _setScrollingDirection(ScrollDirection userScrollDirection) {
    _scrollingDirection = userScrollDirection;
    notifyListeners();
  }

  /// Direction in which user is scrolling
  ScrollDirection get scrollingDirection => _scrollingDirection;

  /// Scrolling is happening in the positive scroll offset direction.
  bool get isScrollingForward => scrollingDirection == ScrollDirection.forward;

  /// Scrolling is happening in the negative scroll offset direction.
  bool get isScrollingReverse => scrollingDirection == ScrollDirection.reverse;

  /// No scrolling is underway.
  bool get isScrollIdle => scrollingDirection == ScrollDirection.idle;

  AxisDirection _direction;

  /// Sets the direction in which list scrolls
  void _setAxisDirection(AxisDirection direction) {
    _direction = direction;
    notifyListeners();
  }

  /// The direction in which list scrolls
  ///
  /// For example:
  /// ```
  /// ListView.builder(
  ///   scrollDirection: Axis.horizontal,
  ///   reverse: true,
  ///   // ***
  /// ```
  /// will have the direction of `AxisDirection.left`
  AxisDirection get direction => _direction;

  /// Whether list scrolls horrizontally
  ///
  /// (direction equals `AxisDirection.left` or `AxisDirection.right`)
  bool get isHorizontalDirection =>
      direction == AxisDirection.left || direction == AxisDirection.right;

  /// Whether list scrolls vertically
  ///
  /// (direction equals `AxisDirection.up` or `AxisDirection.down`)
  bool get isVerticalDirection =>
      direction == AxisDirection.up || direction == AxisDirection.down;

  IndicatorState _currentState;
  IndicatorState _previousState;

  /// sets indicator state and notifies listeners
  void _setIndicatorState(IndicatorState newState) {
    _previousState = _currentState;
    _currentState = newState;

    notifyListeners(updatePrevState: false);
  }

  /// Describes previous [CustomRefreshIndicator] state
  IndicatorState get previousState => _previousState;
  bool get wasArmed => _previousState == IndicatorState.armed;
  bool get wasDragging => _previousState == IndicatorState.dragging;
  bool get wasLoading => _previousState == IndicatorState.loading;
  bool get wasComplete => _previousState == IndicatorState.complete;
  bool get wasHiding => _previousState == IndicatorState.hiding;
  bool get wasIdle => _previousState == IndicatorState.idle;

  /// Describes current [CustomRefreshIndicator] state
  IndicatorState get state => _currentState;
  bool get isArmed => _currentState == IndicatorState.armed;
  bool get isDragging => _currentState == IndicatorState.dragging;
  bool get isLoading => _currentState == IndicatorState.loading;
  bool get isComplete => _currentState == IndicatorState.complete;
  bool get isHiding => _currentState == IndicatorState.hiding;
  bool get isIdle => _currentState == IndicatorState.idle;

  bool _refreshEnabled;

  /// Whether custom refresh indicator can change [IndicatorState] from `idle` to `dragging`
  bool get isRefreshEnabled => _refreshEnabled;

  /// Disables list pull to refresh
  void disableRefresh() {
    _refreshEnabled = false;
    notifyListeners();
  }

  /// Enables list pull to refresh
  void enableRefresh() {
    _refreshEnabled = true;
    notifyListeners();
  }

  /// Returns `true` when state did change [from] to [to].
  bool didStateChange({IndicatorState from, IndicatorState to}) {
    final stateChanged = _previousState != _currentState;
    if (to == null) return _previousState == from && stateChanged;
    if (from == null) return _currentState == to && stateChanged;
    if (to == null && from == null) return stateChanged;
    return _previousState == from && _currentState == to;
  }

  /// Everytime [notifyListeners] method is called, [previousState] will be set to [state] value.
  @override
  void notifyListeners({bool updatePrevState = true}) {
    if (updatePrevState) _previousState = _currentState;
    super.notifyListeners();
  }
}
