import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/alerts_model.dart';
import 'package:iconapp/stores/alerts/alert_store.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/global/lottie_loader.dart';
import 'package:iconapp/widgets/global/network_photo.dart';
import 'package:iconapp/widgets/onboarding/base_onboarding_widget.dart';
import '../core/extensions/context_ext.dart';
import 'package:iconapp/routes/router.gr.dart';

class AlertScreen extends StatelessWidget {
  AlertScreen() {
    sl<AlertStore>().getAlerts();
  }
  @override
  Widget build(BuildContext context) {
    return BaseGradientBackground(
      child: Container(
        child: Column(children: [
          AlertAppbar(),
          AlertDivider(),
          AlertList(),
        ]),
      ),
    );
  }
}

class AlertList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = sl<AlertStore>();
    return Expanded(
      child: Observer(builder: (_) {
        return store.loading
            ? Center(child: LottieLoader())
            : ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => AlertDivider(),
                padding: EdgeInsets.all(16),
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    AlertTile(alert: store.alerts[index]),
                itemCount: store.alerts.length,
              );
      }),
    );
  }
}

class AlertTile extends StatelessWidget {
  final AlertModel alert;

  const AlertTile({Key key, @required this.alert}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          ExtendedNavigator.of(context)
              .pushChatScreen(conversation: alert.conversation);
        },
        child: SizedBox(
          height: context.heightPlusStatusbarPerc(.1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: NetworkPhoto(
                  url: alert.conversation?.backgroundPhoto?.url ?? '',
                  height: 44,
                  width: 44,
                ),
              ),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(alert.alertMessage, style: alertTileTitle),
                  SizedBox(height: 10),
                  CustomText(
                    alert.timestamp.toString(),
                    style: loginSmallText.copyWith(color: iris),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AlertAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = sl<AlertStore>();
    return Container(
      
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: context.heightPlusStatusbarPerc(.1),
      child: Padding(
        padding: const EdgeInsets.only(top:25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () => ExtendedNavigator.of(context).pop(),
              icon: SvgPicture.asset('assets/images/back_arrow.svg',
                  height: 16.3, width: 16.3),
            ),
            CustomText('הודעות', style: alertTitle),
            Spacer(),
            SizedBox(
              height: 30,
              child: OutlineButton(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                onPressed: () => store.clearAll,
                color: Colors.transparent,
                borderSide: BorderSide(color: blueberry2, width: .7),
                child: CustomText('נקה הכל', style: myStory),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.7)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BellAlert extends StatelessWidget {
  final Function onTap;

  const BellAlert({
    Key key,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = sl<AlertStore>();
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: SizedBox(
        height: 25,
        width: 25,
        child: Stack(
          children: [
            SvgPicture.asset('assets/images/bell.svg'),
            BellCountBubble(store: store)
          ],
        ),
      ),
    );
  }
}

class BellCountBubble extends StatelessWidget {
  const BellCountBubble({
    Key key,
    @required this.store,
  }) : super(key: key);

  final AlertStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Visibility(
        visible: store.alerts?.isNotEmpty,
        child: Positioned(
          left: 0,
          top: 0,
          child: Container(
            height: 16,
            width: 16,
            decoration: BoxDecoration(
              gradient: redPinkGradient,
              shape: BoxShape.circle,
            ),
            child: Center(
                child: CustomText(
              store.alerts.length.toString(),
              maxLines: 1,
              style: likeStyle,
            )),
          ),
        ),
      );
    });
  }
}

class AlertDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
        color: blueberry2, thickness: .3, indent: 0, endIndent: 0, height: 1);
  }
}
