import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';
import '../../core/extensions/context_ext.dart';
import 'hebrew_input_text.dart';

class NextButton extends StatelessWidget {
  final Function onClick;

  const NextButton({
    Key key,
    @required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: context.widthPx * .8,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [purpleFont, purpleFont],
        ),
      ),
      child: Center(
          child: HebrewText(
        'המשך',
        style: TextStyle(
          color: white,
          fontSize: 20,
        ),
      )),
    );
  }
}
