import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/extensions/context_ext.dart';
import 'back_button.dart';

class BluredAppbar extends StatelessWidget {
  final Widget widget;

  const BluredAppbar({Key key, this.widget}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            height: context.heightPlusStatusbarPerc(.071),
            width: double.infinity,
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                if (widget != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child:
                        Align(alignment: Alignment.centerLeft, child: widget),
                  ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: IconBackButton(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
