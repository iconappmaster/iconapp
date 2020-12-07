import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:iconapp/widgets/login/login_background.dart';
import '../core/extensions/context_ext.dart';
import 'package:easy_localization/easy_localization.dart';

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
                child: SvgPicture.asset('assets/images/icon_logo.svg'))),
        Positioned(
          bottom: 25,
          child: Row(
            children: [
              SizedBox(
                height: 12,
                width: 12,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(white),
                  strokeWidth: 1,
                ),
              ),
              SizedBox(width: 8),
              Material(
                color: Colors.transparent,
                child: CustomText(
                  LocaleKeys.general_loading.tr(),
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
