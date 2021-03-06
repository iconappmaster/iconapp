import 'package:flutter/material.dart';
import 'package:iconapp/widgets/global/bouncing.dart';
import 'package:iconapp/core/theme.dart';
import 'custom_text.dart';
import '../../generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class NextButton extends StatelessWidget {
  final Function onClick, onError;
  final bool enabled;
  final String title;
  final double height;
  const NextButton({
    Key key,
    @required this.onClick,
    this.onError,
    this.enabled = true,
    this.title,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BouncingGestureDetector(
      onPressed: enabled ? onClick : onError,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        height: height ?? 60,
        width: MediaQuery.of(context).size.width * .75,
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: enabled ? cornflower : cornflower.withOpacity(.3), borderRadius: BorderRadius.circular(8.7)),
        child: Material(
          color: Colors.transparent,
          child: Center(
            child: CustomText(
              title ?? LocaleKeys.action_continue.tr(),
              style: button,
            ),
          ),
        ),
      ),
    );
  }
}
