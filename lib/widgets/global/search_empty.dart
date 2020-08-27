import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/theme.dart';

import 'hebrew_input_text.dart';

class SearchEmpty extends StatelessWidget {
  final String text;

  const SearchEmpty({
    Key key,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 42),
      child: Material(
        color: white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/telescope.svg',
              width: 128,
              height: 124,
            ),
            SizedBox(height: 34.7),
            HebrewText(text, style: emptyState)
          ],
        ),
      ),
    );
  }
}
