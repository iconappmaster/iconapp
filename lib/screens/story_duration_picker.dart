import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/stores/story/story_edit_store.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:iconapp/widgets/global/list_wheel.dart';
import 'package:vibration/vibration.dart';

class StoryDurationPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final story = sl<StoryEditStore>();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 6.0,
            sigmaY: 6.0,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                color: Colors.black45,
                child: Center(
                    child: WheelChooser.integer(
                        initValue: story.storyDuration,
                        selectTextStyle: dialogTitle,
                        unSelectTextStyle: dialogContent,
                        magnification: 3,
                        onValueChanged: (v) async {
                          Vibration.vibrate(duration: 200);
                          return story.updateStoryDuration(v);
                        },
                        minValue: 1,
                        maxValue: 12)),
              ),
              Positioned(
                  right: 9.5,
                  top: 37,
                  child: CloseButton(
                    color: white,
                  )),
              Positioned(
                top: 50,
                child: CustomText(
                  'משך הסיפור בשעות',
                  style: dialogTitle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
