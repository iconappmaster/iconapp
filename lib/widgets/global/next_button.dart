import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';
import '../../core/extensions/context_ext.dart';
import 'hebrew_input_text.dart';
import '../../generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class NextButton extends StatelessWidget {
  final Function onClick;
  final bool enabled;
  const NextButton({
    Key key,
    @required this.onClick,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      height: context.heightPx * .094,
      width: context.widthPx * .81,
      decoration: BoxDecoration(
          color: enabled ? cornflower : cornflower.withOpacity(.3),
          borderRadius: BorderRadius.circular(2.7)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: enabled ? onClick : () => {},
          child: Center(
            child: HebrewText(
              LocaleKeys.action_continue.tr(),
              style: button,
            ),
          ),
        ),
      ),
    );
  }
}
