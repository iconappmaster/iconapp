import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/stores/language/language_store.dart';
import 'package:iconapp/widgets/global/back_button.dart';
import 'package:iconapp/widgets/global/blue_divider.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import '../../core/extensions/context_ext.dart';

class AppBarWithDivider extends StatelessWidget {
  final bool showBack;
  final String title;
  final String subtitle;
  final Function onBackTap;
  final bool isArrowDirectionDown;
  final Widget widget;

  const AppBarWithDivider({
    Key key,
    this.showBack = true,
    @required this.title,
    this.subtitle,
    this.onBackTap,
    this.isArrowDirectionDown = false,
    this.widget,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: context.statusbarHeight()),
          height: (subtitle != null && subtitle.isNotEmpty) ? 75 : 65,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Positioned(top: 20.7, child: CustomText(title, style: createGroupTitle)),
              if (subtitle != null)
                Positioned(
                    top: 49.7, child: CustomText(subtitle, style: fieldLabel.copyWith(color: white.withOpacity(.7)))),
              Positioned(
                top: 8,
                right: language.isLTR ? null : 2,
                left: language.isLTR ? 2 : null,
                child: IconBackButton(
                  onBackTap: onBackTap,
                  isArrowDirectionDown: isArrowDirectionDown,
                ),
              ),
              if (widget != null)
                Positioned(
                  top: 20,
                  left: language.isLTR ? null : 16,
                  right: language.isLTR ? 16 : null,
                  child: widget,
                ),
            ],
          ),
        ),
        BlueDivider(color: cornflower.withOpacity(.4)),
      ],
    );
  }
}
