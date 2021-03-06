import 'package:flutter/material.dart';
import 'package:iconapp/stores/language/language_store.dart';

class CustomText extends StatelessWidget {
  const CustomText(
    this.text, {
    Key key,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.maxLength,
    this.padding = const EdgeInsets.all(0),
    this.textDirection = TextDirection.rtl,
  }) : super(key: key);

  final int maxLines;
  final int maxLength;
  final String text;
  final TextStyle style;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final EdgeInsets padding;
  final TextDirection textDirection;

  @override
  Widget build(BuildContext context) {
    final textDirection =
        language.isLTR ? TextDirection.ltr : TextDirection.rtl;
    final textAlign = language.textAlign;
    return Directionality(
      textDirection: textDirection,
      child: Padding(
        padding: padding,
        child: Text(
          text,
          textScaleFactor: 1,
          overflow: overflow,
          textAlign: textAlign,
          style: style,
          maxLines: maxLines,
        ),
      ),
    );
  }
}
