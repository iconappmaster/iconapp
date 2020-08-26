import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iconapp/core/bus.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/widgets/chat/events/slide_event.dart';
import 'package:iconapp/widgets/global/slidable/slidable.dart';

abstract class SlidableStateWidget<T extends StatefulWidget> extends State<T> {
  SlidableController controller;
  SlidableState slide;
  StreamSubscription<SlidableOpenEvent> subscription;
  BuildContext sliderContext;
  bool isOpen = false;
  Bus _eventBus;
  int index;

 
  void init() {
    _eventBus = sl<Bus>();
    subscription = _eventBus.on<SlidableOpenEvent>().listen((event) {
      if (index != event.index && sliderContext != null)
        Slidable.of(sliderContext).close();
    });

    controller = SlidableController(
      onSlideIsOpenChanged: (isOpen) {
        if (mounted) {
          setState(() {
            isOpen = isOpen;
          });
        }

        if (isOpen) _eventBus.fire(SlidableOpenEvent(index));
      },
    );
  }
}
