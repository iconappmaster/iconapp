import 'package:flutter/material.dart';
import 'package:flutter_google_ad_manager/ad_size.dart';
import 'package:flutter_google_ad_manager/banner.dart';

class BannerAd extends StatelessWidget {
  final String adUnitId;

  const BannerAd({Key key, @required this.adUnitId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DFPBanner(
      isDevelop: false,
      adSize: DFPAdSize.MEDIUM_RECTANGLE,
      adUnitId: adUnitId,
      onAdClosed: () {
        /// TODO add analytics
        print('add onAdClosed');
      },
      onAdFailedToLoad: (e) {
        /// TODO add analytics
        print('add onAdFailedToLoad');
      },
      onAdLoaded: () {
        /// TODO add analytics
        print('add loaded');
      },
      onAdOpened: () {
        /// TODO add analytics
        print('add opened');
      },
      onAdViewCreated: (add) {
        /// TODO add analytics
        print('add create');
      },
    );
  }
}
