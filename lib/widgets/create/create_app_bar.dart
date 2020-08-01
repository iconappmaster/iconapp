import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/widgets/global/back_button.dart';
import 'package:iconapp/widgets/global/blue_divider.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import '../../core/extensions/context_ext.dart';

class CreateGroupAppbar extends StatelessWidget {
  final bool showBack;
  final String title;
  final String subtitle;
  final Function onBackTap;

  const CreateGroupAppbar({
    Key key,
    this.showBack = true,
    @required this.title,
    this.subtitle,
    this.onBackTap,
  }) : super(key: key);
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
                  top: 20.7, child: HebrewText(title, style: createGroupTitle)),
              if (subtitle != null)
                Positioned(
                    top: 51.7, child: HebrewText(subtitle, style: fieldLabel)),
              Positioned(
                  top: 8,
                  right: 26.7,
                  child: IconBackButton(
                    onBackTap: onBackTap,
                  )),
            ],
          ),
        ),
        BlueDivider(color: cornflower),
      ],
    );
  }
}
