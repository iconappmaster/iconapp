import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

int useCountDown(int countSec) {
  return use(_CounterTimer(countSec: countSec));
}

class _CounterTimer extends Hook<int> {
  final int countSec;

  const _CounterTimer({
    @required this.countSec,
  });

  @override
  __CounterTimerState createState() => __CounterTimerState();
}

class __CounterTimerState extends HookState<int, _CounterTimer> {
  Timer _timer;
  int _currentNumber = 0;

  @override
  void initHook() {
    super.initHook();

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _currentNumber = timer.tick;
        if (hook.countSec - _currentNumber == 0) {
          _timer.cancel();
        }
      });
    });
  }

  @override
  int build(BuildContext context) {
    return _currentNumber - hook.countSec == 0 ? 0 : hook.countSec - _currentNumber;
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
