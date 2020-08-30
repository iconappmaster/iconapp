import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/widgets/global/slidable/slidable.dart';
import 'package:iconapp/widgets/global/slidable/slidable_action_pane.dart';

class ReplySlider extends StatelessWidget {
  final String keyName;
  final SlidableController controller;
  final SlideActionBuilder builder;
  final Widget child;
  final bool isOpen;

  const ReplySlider({
    Key key,
    @required this.keyName,
    @required this.controller,
    @required this.builder,
    @required this.child,
    @required this.isOpen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      color: isOpen ? darkBlueGrey : Colors.transparent,
      child: Slidable.builder(
        key: Key(keyName),
        actionPane: SlidableBehindActionPane(),
        movementDuration: const Duration(milliseconds: 350),
        closeOnScroll: true,
        child: child,
        controller: controller,
        actionExtentRatio: .25,
        actionDelegate: SlideActionBuilderDelegate(
          actionCount: 1,
          builder: builder,
        ),
      ),
    );
  }
}

class ReplyButton extends StatelessWidget {
  const ReplyButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: SvgPicture.asset(
          'assets/images/reply.svg',
          height: 25,
          width: 25,
        ),
        onPressed: () async {
          final slide = Slidable.of(context);
          slide.close();
        });
  }
}