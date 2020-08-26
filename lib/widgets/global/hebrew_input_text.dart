import 'package:flutter/material.dart';

class HebrewText extends StatelessWidget {
  const HebrewText(
    this.text, {
    Key key,
    this.style,
    this.textAlign = TextAlign.center,
    this.maxLines,
    this.overflow,
    this.maxLength,
    this.padding = const EdgeInsets.all(0),
  }) : super(key: key);
  final int maxLines;
  final int maxLength;
  final String text;
  final TextStyle style;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: padding,
        child: Text(
          
          text,
          
          overflow: overflow,
          textAlign: textAlign,
          style: style,
          maxLines: maxLines,

        ),
      ),
    );
  }
}
