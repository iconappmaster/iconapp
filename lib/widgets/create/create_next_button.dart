import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/theme.dart';
import '../../core/extensions/context_ext.dart';

class CreateNextBotton extends StatelessWidget {
  final String asset;
  final Function onTap;
  final bool isValid;
  final String validationText;

  const CreateNextBotton({
    Key key,
    @required this.asset,
    @required this.onTap,
    @required this.isValid,
    @required this.validationText,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 25,
      left: 25,
      child: FloatingActionButton(
        heroTag: 'fab8',
          child: SvgPicture.asset(asset, height: 16.3, width: 16.3),
          backgroundColor: cornflower,
          onPressed: () {
            if (isValid) {
              onTap();
            } else {
              context.showFlushbar(message: validationText);
            }
          }),
    );
  }
}
