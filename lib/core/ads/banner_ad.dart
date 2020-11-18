import 'package:flutter/material.dart';

class BannerAd extends StatelessWidget {
  final String adUnitId;

  const BannerAd({Key key, @required this.adUnitId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final targetingInfo = MobileAdTargetingInfo(
    //   keywords: <String>['flutterio', 'beautiful apps'],
    //   contentUrl: 'https://flutter.io',
    //   childDirected: false,
    //   nonPersonalizedAds: true,
    // );

    // final mobile = BannerAd(
    //   adUnitId: 'ca-app-pub-5806212644011393/2014040231',
    //   size: AdSize.smartBanner,
    //   targetingInfo: targetingInfo,
    //   listener: (MobileAdEvent event) {
    //     print("BannerAd event is $event");
    //   },
    // );
    // return DFPBanner(
    //   isDevelop: false,
    //   adSize: DFPAdSize.MEDIUM_RECTANGLE,
    //   adUnitId: 'ca-app-pub-5806212644011393/2014040231',
    //   onAdClosed: () {
    //     print('add onAdClosed');
    //   },
    //   onAdFailedToLoad: (e) {
    //     print('add onAdFailedToLoad');
    //   },
    //   onAdLoaded: () {
    //     print('add loaded');
    //   },
    //   onAdOpened: () {
    //     print('add opened');
    //   },
    //   onAdViewCreated: (add) {
    //     print('add create');
    //   },
    // );
  }
}