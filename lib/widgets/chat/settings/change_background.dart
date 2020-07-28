import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/screens/chat_settings_screen.dart';
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
                      child: ColorPicker(
                        pickedColor: (selectedGradient) {
                          print(selectedGradient);
                        },
                      ),
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
  final Function(Gradient) pickedColor;

  const ColorPicker({
    Key key,
    @required this.pickedColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 1,
      shrinkWrap: true,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      physics: BouncingScrollPhysics(),
      children: [
        purpleGradient,
        redPinkGradient,
        purpleGradient,
        redPinkGradient,
        purpleGradient,
        redPinkGradient
      ]
          .map((gradient) => GestureDetector(
                onTap: pickedColor(gradient),
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: gradient,
                  ),
                ),
              ))
          .toList(),
    );
  }
}
