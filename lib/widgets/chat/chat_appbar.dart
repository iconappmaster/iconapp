
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/extensions/context_ext.dart';
import '../../core/theme.dart';
import '../global/hebrew_input_text.dart';
import 'chat_back_button.dart';

class ChatAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.heightPlusStatusbarPerc(.116),
      child: Padding(
        padding: const EdgeInsets.only(top: 34.0, right: 21.3),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ChatBackButton(),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  HebrewText('האח הגדול', style: loginBigText),
                  HebrewText('12,000 משתתפים', style: fieldLabel),
                ],
              ),
            ),
            IconButton(icon: SvgPicture.asset('assets/images/star.svg', height: 26, width: 26), onPressed: () {  },),
            IconButton(icon: SvgPicture.asset('assets/images/dots.svg', height: 26, width: 26), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}