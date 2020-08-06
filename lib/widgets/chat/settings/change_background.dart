import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/screens/chat_settings_screen.dart';
import 'package:iconapp/stores/chat_settings/chat_settings_store.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/global/next_button.dart';

class ChangeBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class ColorSelectButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = sl<ChatSettingsStore>();
    return GestureDetector(
      onTap: () async {
        await showDialog(
            context: context,
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              contentPadding: EdgeInsets.all(16),
              elevation: 10,
              title: HebrewText('צבע רקע', style: changeColorTitle),
              content: Container(
                height: 300,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 200,
                      width: 300,
                      child: ColorPicker(onBackgroundChanged: (index) {
                        print(index);
                        selectedColorIndex = index;
                        store.changeChatBackground(index);
                        // ExtendedNavigator.of(context).pop();
                      }),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: NextButton(
                        height: 60,
                        onClick: () => Navigator.pop(context),
                        title: 'אישור',
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
      child: Container(
        margin: EdgeInsets.only(left: 10),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: purpleGradient,
        ),
      ),
    );
  }
}

class ColorPicker extends StatelessWidget {
  final Function(int) onBackgroundChanged;

  const ColorPicker({
    Key key,
    @required this.onBackgroundChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 1),
      physics: BouncingScrollPhysics(),
      itemCount: gradientList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            ExtendedNavigator.of(context).pop();
            onBackgroundChanged(index);
          },
          child: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: convertIndexToGradient(index),
            ),
          ),
        );
      },
    );
  }
}

final gradientList = [
  purpleGradient,
  redPinkGradient,
  purpleGradient,
  redPinkGradient,
  purpleGradient,
  redPinkGradient
];

int selectedColorIndex = 0;

Gradient convertIndexToGradient(int colorIndex) {
  switch (colorIndex) {
    case 0:
      return purpleGradient;
    case 1:
      return purpleGradient;
    case 2:
      return purpleGradient;
    case 3:
      return purpleGradient;
    case 4:
      return purpleGradient;
    case 5:
  }

  return null;
}
