import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconapp/stores/analytics/analytics_consts.dart';
import 'package:iconapp/stores/analytics/analytics_firebase.dart';
import '../global/custom_text.dart';
import '../global/base_dialog.dart';
import '../global/next_button.dart';
import '../../core/theme.dart';
import '../../core/extensions/context_ext.dart';
import 'package:launch_review/launch_review.dart';

class ForceUpdateDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      height: context.heightPlusStatusbarPerc(.27),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Positioned(
            top: 14.3,
            child: CustomText(
              'גרסה חדשה זמינה',
              style: dialogTitle,
            ),
          ),
          Positioned(
              top: 48,
              child: Container(
                height: context.heightPlusStatusbarPerc(.28),
                width: context.widthPx * .66,
                child: SingleChildScrollView(
                  child: CustomText(
                      'אנא עדכן את האפליקציה לגרסה חדשה כדי להמשיך',
                      style: dialogContent,
                      textAlign: TextAlign.start),
                ),
              )),
          Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: NextButton(
                    height: 44,
                    title: 'לחנות',
                    onClick: () {
                      analytics.sendAnalyticsEvent(FORCE_UPDATE_SHOW, {});
                      LaunchReview.launch(
                          writeReview: false,
                          androidAppId: 'com.icon.iconapp',
                          iOSAppId: '1528197266');
                    })),
          )
        ],
      ),
    );
  }
}
