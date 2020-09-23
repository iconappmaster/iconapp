import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';

import '../theme.dart';

extension ContextExtensions on BuildContext {
  // Returns the MediaQuery
  MediaQueryData get mq => MediaQuery.of(this);

  /// Returns if Orientation is landscape
  bool get isLandscape => mq.orientation == Orientation.landscape;

  /// Returns same as MediaQuery.of(context).size
  Size get sizePx => mq.size;

  /// Returns same as MediaQuery.of(context).size.width
  double get widthPx => sizePx.width;

  /// Returns same as MediaQuery.of(context).height
  double get heightPx => sizePx.height;

  showToast(String message, [Color iconColor = white]) {
    Flushbar(
      message: message,
      icon: Icon(Icons.info_outline, size: 28.0, color: iconColor),
    )..show(this);
  }

  showFlushbar({
    @required String message,
    Color color = pastelRed,
    String title, 
  }) {
    return Flushbar(
      padding: EdgeInsets.fromLTRB(11, 10, 11, 10),
      title: title,
      barBlur: 12,
      borderRadius: 12,
      backgroundColor: color,
      flushbarStyle: FlushbarStyle.FLOATING,
      margin: EdgeInsets.fromLTRB(34, 34, 34, 34),
      duration: Duration(seconds: 2),
      messageText: CustomText(message, style: flushbar),
    ).show(this);
  }

  
  statusbarHeight() => MediaQuery.of(this).padding.top;

  heightPlusStatusbarPerc(double height) =>
      heightPx * height + statusbarHeight();

  unFocus() => FocusScope.of(this).requestFocus(FocusNode());
}
