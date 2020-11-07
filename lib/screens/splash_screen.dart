import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:iconapp/widgets/login/login_background.dart';
import '../core/extensions/context_ext.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: <Widget>[
        LoginBackgroundImage(),
        Positioned(
          top: context.heightPx * .366,
          child: Container(
            height: context.heightPx * .268,
            width: context.widthPx * .395,
            child: SvgPicture.asset('assets/images/icon_logo.svg'),
          ),
        ),
        Positioned(
          bottom: 100,
          child: Column(
            children: [
              SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(white),
                  strokeWidth: 1,
                ),
              ),
              SizedBox(height: 16),
              Material(
                color: Colors.transparent,
                child: CustomText(
                  'טוען ...',
                  style: chatMessageBody,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
