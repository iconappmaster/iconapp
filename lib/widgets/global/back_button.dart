import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconBackButton extends StatelessWidget {
  const IconBackButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.pop(context),
          child: SvgPicture.asset(
        'assets/images/back_arrow.svg',
        height: 16.3,
        width: 16.3,
      ),
    );
  }
}
