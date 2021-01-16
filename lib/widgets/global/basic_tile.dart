import 'package:flutter/material.dart';

class BasicTile extends StatelessWidget {
  final Widget left;
  final Widget right;
  final bool compact;
  final Function onTap;

  const BasicTile({
    Key key,
    this.left = const Spacer(),
    this.right = const Spacer(),
    this.compact = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6),
        child: Container(
          height: compact ? 24 : 75,
          decoration: CupertinoBorderBoxDecoration,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: left),
              right,
            ],
          ),
        ),
      ),
    );
  }
}

const BoxDecoration CupertinoBorderBoxDecoration = BoxDecoration(border: CupertinoBorderSeparator);

const Border CupertinoBorderSeparator = Border(
  bottom: BorderSide(
    color: Colors.black26,
    width: 0.0, // One physical pixel.
    style: BorderStyle.solid,
  ),
);
