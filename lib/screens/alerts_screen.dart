import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/alerts_model.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/stores/alerts/alert_store.dart';
import 'package:iconapp/widgets/global/back_button.dart';
import 'package:iconapp/widgets/global/basic_tile.dart';
import 'package:iconapp/widgets/global/bouncing.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:iconapp/widgets/global/network_photo.dart';
import 'package:iconapp/widgets/onboarding/base_onboarding_widget.dart';
import '../core/extensions/context_ext.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/widgets/global/timeago.dart' as timeago;
import 'package:easy_localization/easy_localization.dart';

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
        return store.alerts.isEmpty
            ? AlertsEmptyState()
            : ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => AlertDivider(),
                padding: EdgeInsets.all(16),
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final alert = store.alerts[index];

                  switch (alert.alertType) {
                    case AlertType.request_to_join_conversation:
                      return RequestToJoinTile(alert: store.alerts[index]);

                    default:
                      return AlertTile(alert: store.alerts[index]);
                  }
                },
                itemCount: store.alerts.length,
              );
      }),
    );
  }
}

class RequestToJoinTile extends StatelessWidget {
  final AlertModel alert;

  const RequestToJoinTile({
    Key key,
    @required this.alert,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = sl<AlertStore>();
    return BasicTile(
      left: SizedBox(
        width: MediaQuery.of(context).size.width * .5,
        child: CustomText(alert.alertMessage, style: alertTileTitle),
      ),
      right: Row(
        children: [
          ElevatedButton(
            child: CustomText('Accept'),
            onPressed: () async {
              final conversationId = alert.conversation.id;
              final alertId = alert.id;
              await store.acceptRequestToJoinConversation(
                conversationId,
                alertId,
              );
              context.showToast('You accepted the Request!');
            },
            style: ElevatedButton.styleFrom(primary: apple),
          ),
          SizedBox(width: 3),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: cornflower),
            child: CustomText('Deny'),
            onPressed: () async {
              final conversationId = alert.conversation.id;
              final alertId = alert.id;
              await store.denyRequestToJoinConversation(
                conversationId,
                alertId,
              );
              context.showToast('You denied the request!');
            },
          )
        ],
      ),
    );
  }
}

class AlertsEmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: CustomText(
      LocaleKeys.alerts_empty.tr(),
      style: lastWritten,
    ));
  }
}

class AlertTile extends StatelessWidget {
  final AlertModel alert;

  const AlertTile({Key key, @required this.alert}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = sl<AlertStore>();
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          store.clearSpecificAlert(alert.id);
          ExtendedNavigator.of(context)
            ..pushChatScreen(conversation: alert.conversation)
            ..pop();
        },
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: NetworkPhoto(
                  imageUrl: alert.conversation?.backgroundPhoto?.url ?? '',
                  height: 44,
                  width: 44,
                ),
              ),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * .7,
                      child: CustomText(alert.alertMessage, style: alertTileTitle)),
                  SizedBox(height: 10),
                  CustomText(
                    timeago.format(DateTime.fromMillisecondsSinceEpoch(alert.timestamp * 1000), locale: 'he'),
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
      height: context.heightPlusStatusbarPerc(.08),
      child: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconBackButton(),
            CustomText(LocaleKeys.alerts_messages.tr(), style: alertTitle),
            Spacer(),
            SizedBox(
              height: 30,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                backgroundColor: Colors.transparent,
                side: BorderSide(color: blueberry2, width: .7),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.7)),
              ),
                child: CustomText(LocaleKeys.alerts_cleanAll.tr(), style: myStory.copyWith(color: white)),
                onPressed: () => store.clearAll(),
            ),),
          ],
        ),
      ),
    );
  }
}

class BellAlert extends StatelessWidget {
  final Function onPressed;

  const BellAlert({
    Key key,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = sl<AlertStore>();
    return BouncingGestureDetector(
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 30,
            width: 25,
            child: Stack(
              children: [
                SvgPicture.asset('assets/images/bell.svg', height: 22, width: 22, color: lightMustard),
                BellCountBubble(alerts: store),
              ],
            ),
          ),
          CustomText(
            LocaleKeys.alerts_alert.tr(),
            style: replayTitle.copyWith(
              color: lightMustard,
              fontSize: 10,
            ),
          )
        ],
      ),
    );
  }
}

class BellCountBubble extends StatelessWidget {
  const BellCountBubble({
    Key key,
    @required this.alerts,
  }) : super(key: key);

  final AlertStore alerts;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Visibility(
        visible: alerts.alertsCount > 0,
        child: Positioned(
          left: 0,
          top: 0,
          child: Container(
            height: 8,
            width: 8,
            decoration: BoxDecoration(
              color: cornflower,
              shape: BoxShape.circle,
            ),
            child: Center(
                child: CustomText(
              alerts.alertsCount.toString(),
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
    return Divider(color: blueberry2, thickness: .3, indent: 0, endIndent: 0, height: 1);
  }
}
