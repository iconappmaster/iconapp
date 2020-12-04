import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/widgets/global/bouncing.dart';

class RoundedClose extends StatelessWidget {
  const RoundedClose({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BouncingGestureDetector(
      onPressed: () => ExtendedNavigator.of(context).pop(),
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: Colors.grey.withOpacity(.7)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.close,
            color: white,
          ),
        ),
      ),
    );
  }
}
