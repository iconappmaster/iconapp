import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';

class RoundedClose extends StatelessWidget {
  const RoundedClose({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: Colors.grey.withOpacity(.4)),
      child: CloseButton(color: white),
    );
  }
}
