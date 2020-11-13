import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iconapp/core/ads/model/ad_webview_model.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/stores/user/user_store.dart';
import 'package:iconapp/routes/router.gr.dart';

class AdsService {
  UserStore _userStore;

  AdsService() {
    _userStore = sl<UserStore>();
  }

  // MOCK PAYLOAD
  final defaultAid = '477c4275-2221-47f8-bb32-dc94927c9592';

  String getAdsJavaScript() {
    final user = _userStore.getUser;

    final subscriber = AdSubscriber(
        id: user.id.toString(),
        birthYear: user.age.toString(),
        gender: user.gender);

    final content = AdContent(
      id: "c674e73b1b54e610VgnVCM200000650a10acRCRD",
      duration: 2295,
      prgramName: "Noa Kirl invite you to icon",
      videoURL: "https://www.domain.co.il/page.mp4",
    );

    final info = WebAdInfo(
      category: 'NoaKirl',
      aid: defaultAid,
      subscriber: subscriber,
      content: content,
    );

    return jsonEncode(info.toJson());
  }

  Future showWebInterstitial(BuildContext context) async {
    final javascript = getAdsJavaScript();
    await ExtendedNavigator.of(context).pushWebViewAdScreen(
      javaScript: javascript,
      initialUrl: 'https://akamai.advsnx.net/CDN/icon/player.html',
    );
  }
}
