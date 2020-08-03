import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import '../../core/extensions/context_ext.dart';

class TransparentButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isEnabled;
  final Color color;

  const TransparentButton(
      {Key key,
      @required this.text,
      @required this.onPressed,
      this.color = cornflower,
      this.isEnabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorToUse = isEnabled ? color : color.withAlpha(120);

    return Container(
      height: context.heightPlusStatusbarPerc(.05),
      width: 250,
      padding: EdgeInsets.symmetric(vertical: 11),
      margin: EdgeInsets.symmetric(horizontal: 21.7),
      child: FlatButton(
          
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.7),
              side: BorderSide(color: colorToUse)),
          onPressed: onPressed,
          child: HebrewText(text, style: disconnectButton)),
    );
  }
}
