import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';
import 'package:tutorial_coach_mark/animated_focus_light.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

TutorialCoachMark tutorialCoachMark;
final conversationTutorial = List<TargetFocus>();

final menuKey = GlobalKey();

void _initTarget() {
  conversationTutorial
    ..add(TargetFocus(
      identify: "Chat Menu Target",
      keyTarget: menuKey,
      color: darkIndigo,
      contents: [
        ContentTarget(
            align: AlignContent.bottom,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("תפריט הגדרות", style: nameWhite),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      "בתור אייקון ואדמין בקבוצה, תוכל לסגור ולפתוח את התגובות בקבוצה, להוסיף או להוריד אייקונים אחרים מהקבוצה, ואם אתה אדמין למנות אייקונים אחרים לאדמין ",
                      style: pinCode,
                    ),
                  )
                ],
              ),
            ))
      ],
      shape: ShapeLightFocus.RRect,
      radius: 5,
    ));
}

void showChatTutorial(BuildContext context) {
  _initTarget();

  tutorialCoachMark = TutorialCoachMark(context,
      targets: conversationTutorial,
      textSkip: "סגור",
      paddingFocus: 10,
      opacityShadow: 0.8,
      onFinish: () {}, onClickTarget: (target) {
    print(target);
  }, onClickSkip: () {
    print("skip");
  })
    ..show();
}
