import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/stores/user/user_store.dart';
import '../../core/dependencies/locator.dart';
import '../../core/theme.dart';
import '../global/cupertino_loader.dart';
import '../global/custom_text.dart';
import '../../routes/router.gr.dart';

class RedemptionScoreIndicator extends HookWidget {
  final bool openRedemptionScreen;
  final user = sl<UserStore>();

  RedemptionScoreIndicator({
    this.openRedemptionScreen = true,
  });

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      user.getRemoteUser();
      return () {
        return user.getRemoteUser();
      };
    }, const []);

    return GestureDetector(
      onTap: () => openRedemptionScreen ? ExtendedNavigator.of(context).pushRedemptionScreen() : null,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: warmPurple),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Observer(
                builder: (_) => user.loading
                    ? CupertinoLoader(radius: 8)
                    : CustomText(user.getUser?.pointBalance.toString(), style: lastWritten.copyWith(fontSize: 14))),
            SizedBox(width: 5),
            Image.asset(
              'assets/images/money.png',
              height: 18,
              width: 18,
            ),
          ],
        ),
      ),
    );
  }
}
