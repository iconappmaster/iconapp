import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/widgets/global/back_button.dart';
import 'package:iconapp/widgets/global/blue_divider.dart';
import '../../core/extensions/context_ext.dart';

class IconAppbar extends StatelessWidget {
  final bool showBack;
  final Widget widget;

  const IconAppbar({
    Key key,
    this.showBack = false,
    this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
 
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: context.statusbarHeight()),
          padding: EdgeInsets.symmetric(horizontal: 16),
          height: context.heightPx * .08,
          width: double.infinity,
          child: Stack(
            children: <Widget>[
              if (showBack) Align(alignment: Alignment.centerRight,child: IconBackButton()),
            
              if (widget != null) widget,
              
              Align(
                alignment: Alignment.centerLeft,
                child: SvgPicture.asset('assets/images/white_logo.svg',
                    height: 23.7),
              ),
            ],
          ),
        ),
        BlueDivider(),
      ],
    );
  }
}
