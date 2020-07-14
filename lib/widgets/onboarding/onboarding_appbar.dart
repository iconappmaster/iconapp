import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/screens/onboarding_phone.dart';
import 'package:iconapp/widgets/global/back_button.dart';
import '../../core/extensions/context_ext.dart';

class OnboardingAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final padding = EdgeInsets.fromLTRB(
      context.widthPx * .052,
      context.heightPx * .031,
      context.widthPx * .074,
      context.heightPx * .031,
    );

    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: context.statusbarHeight()),
          padding: padding,
          height: context.heightPx * .099,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconBackButton(),
              SvgPicture.asset(
                'assets/images/white_logo.svg',
                height: 23.7,
              ),
            ],
          ),
        ),
        BlueDivider(),
      ],
    );
  }
}
