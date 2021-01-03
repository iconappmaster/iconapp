import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconapp/stores/user/user_store.dart';
import '../../core/dependencies/locator.dart';
import '../../core/theme.dart';
import '../global/cupertino_loader.dart';
import '../global/custom_text.dart';
import '../../routes/router.gr.dart';

class RedemptionScore extends HookWidget {
  final user = sl<UserStore>();
  @override
  Widget build(BuildContext context) {
    useEffect(() {
      user.getRemoteUser();
      return () => {};
    }, const []);

    return GestureDetector(
      onTap: () => ExtendedNavigator.of(context).pushRedemptionScreen(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: warmPurple,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Observer(
              builder: (_) => user.loading
                  ? CupertinoLoader(radius: 8)
                  : CustomText(
                      user.getUser?.pointBalance.toString(),
                      style: lastWritten,
                    ),
            ),
            SizedBox(width: 5),
            SvgPicture.asset(
              'assets/images/coin.svg',
              height: 18,
              width: 18,
              color: white,
            ),
          ],
        ),
      ),
    );
  }
}
