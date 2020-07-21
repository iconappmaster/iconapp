import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/screens/onboarding_phone.dart';
import 'package:iconapp/widgets/global/back_button.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import '../../core/extensions/context_ext.dart';

class CreateGroupAppbar extends StatelessWidget {
  final bool showBack;

  const CreateGroupAppbar({Key key, this.showBack = true}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: context.statusbarHeight()),
          height: 100,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Positioned(
                  top: 20.7,
                  child:
                      HebrewText('יצירת קבוצה חדשה', style: createGroupTitle)),
              Positioned(
                  top: 51.7,
                  child:
                      HebrewText('בחר/י משתתפים לקבוצה ', style: fieldLabel)),
              Positioned(top: 8, right: 26.7, child: IconBackButton()),
            ],
          ),
        ),
        BlueDivider(),
      ],
    );
  }
}
