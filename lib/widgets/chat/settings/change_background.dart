import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
          CustomText('שינוי תמונת רקע', style: chatSettings),
          ColorSelectButton()
        ],
      ),
    );
  }
}

class ColorSelectButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = sl<ChatSettingsStore>();
    return GestureDetector(
      onTap: () async => await _onTap(context, settings),
      child: Observer(
        builder: (_) => Container(
          margin: EdgeInsets.only(left: 10),
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            border: Border.all(color: blueberry2, width: .3),
            borderRadius: BorderRadius.circular(5),
            gradient: gradientList[settings?.selectedColor ?? 0],
          ),
        ),
      ),
    );
  }

  Future _onTap(BuildContext context, ChatSettingsStore settings) async {
    await showDialog(
        context: context,
        child: AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          contentPadding: const EdgeInsets.all(16),
          elevation: 10,
          title: CustomText('בחר/י צבע רקע', style: changeColorTitle),
          content: Container(
            height: 300,
            child: Stack(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(8),
                    height: 200,
                    width: 300,
                    child: ColorPickerList(
                        onBackgroundChanged: (index) =>
                            settings.changeBackground(index))),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: NextButton(
                    height: 60,
                    onClick: () => Navigator.pop(context),
                    title: 'סגור',
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class ColorPickerList extends StatelessWidget {
  final Function(int) onBackgroundChanged;

  const ColorPickerList({
    Key key,
    @required this.onBackgroundChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount: 3,
          childAspectRatio: 1),
      physics: BouncingScrollPhysics(),
      itemCount: gradientList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            ExtendedNavigator.of(context).pop();
            onBackgroundChanged(index);
          },
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: gradientList[index],
            ),
          ),
        );
      },
    );
  }
}

final gradientList = [
  grapeDarkIndigo,
  coblatBlueTopaz,
  pinkRedDustyOrange,
  darkishBlueApple,
  softBluePurply,
  mustardPurple
];
