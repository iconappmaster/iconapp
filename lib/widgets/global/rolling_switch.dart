import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/screens/onboarding_profile.dart';
import 'dart:ui';
import 'dart:math';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';

class RollingSwitch extends StatefulWidget {
  @required
  // final bool value;
  @required
  final Function(bool) onChanged;
  final String text;
  final Color colorOn;
  final Color colorOff;
  final double textSize;
  final Duration animationDuration;
  final String iconOn;
  final String iconOff;
  final Function onTap;
  final Function onSwipe;
  final UserGender gender;
  RollingSwitch({
    this.text = "אישה",
    this.textSize = 14.0,
    this.colorOn = cornflower,
    this.colorOff = Colors.transparent,
    this.iconOff = '',
    this.iconOn = '',
    this.animationDuration = const Duration(milliseconds: 750),
    this.onTap,
    this.onSwipe,
    this.onChanged,
    this.gender,
  });

  @override
  _RollingSwitchState createState() => _RollingSwitchState();
}

class _RollingSwitchState extends State<RollingSwitch>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;
  double value = 0.0;

  bool turnState;

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this,
        lowerBound: 0.0,
        upperBound: 1.0,
        duration: widget.animationDuration);
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    animationController.addListener(() {
      if (mounted)
        setState(() {
          value = animation.value;
        });
    });
  }

  void setCurrentGender() {
    genderMap.forEach((key, value) => genderMap[key] = false);
    genderMap[widget.gender] = true;
  }

  @override
  Widget build(BuildContext context) {
    Color transitionColor = Color.lerp(widget.colorOff, widget.colorOn, value);

    // check if need to change state
    determine();

    return GestureDetector(
      onTap: () {
        setCurrentGender();
        if (widget.onTap != null) widget.onTap();
      },
      onPanEnd: (details) {
        setCurrentGender();
        if (widget.onSwipe != null) widget.onSwipe();
      },
      child: Container(
        width: 90.6,
        height: 38.3,
        decoration: BoxDecoration(
            border: Border.all(color: cornflower, width: 1.2),
            color: transitionColor,
            borderRadius: BorderRadius.circular(19.4)),
        child: Stack(
          children: <Widget>[
            _buildBackgroundText(),
            _rotatingBall(transitionColor)
          ],
        ),
      ),
    );
  }

  Widget _rotatingBall(Color transitionColor) {
    return Transform.translate(
      offset: Offset(-62 * value + 1.4, 0),
      child: Transform.rotate(
        angle: lerpDouble(0, 2 * pi, value),
        child: Container(
          height: 38.3,
          width: 38.3,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(color: cornflower),
              shape: BoxShape.circle,
              color: Color.lerp(Colors.transparent, Colors.white, value)),
          child: Stack(
            children: <Widget>[
              Center(
                child: Opacity(
                  opacity: (1 - value).clamp(0.0, 1.0),
                  child: SvgPicture.asset(
                    widget.iconOff,
                    height: 16.7,
                    color: Colors.white,
                  ),
                ),
              ),
              Center(
                  child: Opacity(
                      opacity: value.clamp(0.0, 1.0),
                      child: SvgPicture.asset(
                        widget.iconOn,
                        height: 16.7,
                        color: transitionColor,
                      ))),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackgroundText() {
    return Transform.translate(
      offset: turnState ? Offset(value + 5, 0) : Offset(value - 15, 0),
      child: Center(
        child: HebrewText(
          widget.text,
          style: genderIconText,
        ),
      ),
    );
  }

  determine() {
    if (mounted)
      setState(() {
        turnState = genderMap[widget.gender];
        turnState
            ? animationController.forward()
            : animationController.reverse();
        widget.onChanged(turnState);
      });
  }
}
