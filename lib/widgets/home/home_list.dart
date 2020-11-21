import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/ads/ad_config.dart';
import 'package:iconapp/widgets/home/conversation_tile.dart';
import '../../core/dependencies/locator.dart';
import '../../data/models/conversation_model.dart';
import '../../stores/home/home_store.dart';
import '../global/lottie_loader.dart';
import '../../core/extensions/context_ext.dart';

class ConversationsList extends StatelessWidget {
  final Function(Conversation, int) onConversationTap;
  final ScrollController controller;

  const ConversationsList(
      {Key key, @required this.onConversationTap, this.controller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final home = sl<HomeStore>();

    return Observer(
      builder: (_) => Container(
        height: context.heightPx,
        width: context.widthPx,
        child: home.isLoading && home.conversations.length == 0
            ? Align(
                alignment: Alignment.topCenter,
                child: Padding(
                    padding: EdgeInsets.only(top: 80.0), child: LottieLoader()))
            : ListView.builder(
                padding: EdgeInsets.only(bottom: 120),
                controller: controller,
                itemCount: home.conversations.length + 1,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  if (index == home.conversations.length) {
                    return ConversationBannerAd();
                  } else {
                    final conversation = home.conversations[index];
                    return ConversationTile(
                      model: conversation,
                      onTap: () {
                        home.hideNewBadge(index);
                        onConversationTap(conversation, index);
                      },
                    );
                  }
                },
              ),
      ),
    );
  }
}

class ConversationBannerAd extends StatelessWidget {
  const ConversationBannerAd({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 9.3),
      child: AdmobBanner(
        adSize: AdmobBannerSize.FULL_BANNER,
        adUnitId: kReleaseMode ? getBannerAdUnitId : AdmobBanner.testAdUnitId,
        nonPersonalizedAds: true,
        listener: (event, listner) {
          print(event);
          print(listner);
        },
      ),
    );
  }
}
