import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/screens/chat_settings_screen.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';

class ChangeBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Container(
        height: settingsColumnHeight,
        padding: EdgeInsets.only(left: 21, right: 21),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            HebrewText('שינוי תמונת רקע', style: chatSettings),
            ColorSelectButton()
          ],
        ),
      ),
    );
  }
}

class ColorSelectButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: purpleGradient,
      ),
    );
  }
}
