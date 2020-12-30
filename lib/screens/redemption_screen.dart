import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/stores/redemption_store.dart';
import 'package:iconapp/widgets/create/create_app_bar.dart';
import 'package:iconapp/widgets/global/cupertino_loader.dart';
import '../core/extensions/context_ext.dart';

class RedemptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final style = hint.copyWith(color: white.withOpacity(.7), fontSize: 15);
    final store = sl<RedemptionStore>();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: purpleGradient,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBarWithDivider(
              title: 'Redemption',
              isArrowDirectionDown: true,
              subtitle: 'Here you can redeem with your credit',
            ),
            Container(
                height: context.heightPlusStatusbarPerc(.3),
                child: Center(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Balance', style: style),
                    SizedBox(height: 10),
                    Icon(Icons.money_sharp, color: white, size: 40),
                    SizedBox(height: 10),
                    Text(store?.userPointBalance.toString(), style: dialogTitle),
                  ],
                ))),
            Text('Redemption products', style: style),
            Expanded(
              child: Observer(builder: (_) {
                return Container(
                  child: store.loading
                      ? Center(child: CupertinoLoader())
                      : ListView.builder(
                          itemCount: store.redemptionProducts?.length,
                          itemBuilder: (context, index) {
                            return Container();
                          },
                        ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
