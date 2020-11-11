import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import '../../stores/login/login_store.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../core/extensions/context_ext.dart';

class SmsCounter extends StatelessWidget {
  final LoginStore store;

  const SmsCounter({
    Key key,
    @required this.store,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Visibility(
        visible: store.isPinCodeMode,
        child: Positioned(
          top: context.heightPlusStatusbarPerc(.408),
          child: CustomText(
            LocaleKeys.onboarding_phoneCounting
                .tr(args: [store.displayCountdown]),
            style: loginSmallText,
          ),
        ),
      ),
    );
  }
}
