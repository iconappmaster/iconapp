import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../core/ads/admob/ad_config.dart';
import 'conversation_tile.dart';
import '../../core/dependencies/locator.dart';
import '../../data/models/conversation_model.dart';
import '../../stores/home/home_store.dart';
import '../global/lottie_loader.dart';
import '../../core/extensions/context_ext.dart';
import 'home_filter.dart';

class ConversationsList extends StatelessWidget {
  final Function(Conversation, int) onTap;
  final ScrollController controller;

  const ConversationsList({Key key, @required this.onTap, this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final home = sl<HomeStore>();

    return Observer(
      builder: (_) {
        final length =
            home.filterType == HomeFilterType.forYou ? home.conversations.length : home.conversationPopular.length;

        if (home.isLoading && home.conversations.length == 0) {
          return Align(
              alignment: Alignment.topCenter,
              child: Padding(padding: EdgeInsets.only(top: 80.0), child: LottieLoader()));
        }
        return Container(
          height: context.heightPx,
          width: context.widthPx,
          child: ListView.builder(
              padding: EdgeInsets.only(bottom: 120),
              controller: controller,
              itemCount: length,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final conversation = home.filterType == HomeFilterType.forYou
                    ? home.conversations[index]
                    : home.conversationPopular[index];

                return ConversationTile(
                  conversation: conversation,
                  onTap: () => onTap(conversation, index),
                );
              }),
        );
      },
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
        nonPersonalizedAds: false,
        listener: (event, listner) {
          print(event);
          print(listner);
        },
      ),
    );
  }
}
