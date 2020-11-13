import 'package:flutter/material.dart';
import 'package:flutter_google_ad_manager/flutter_google_ad_manager.dart';
import 'package:iconapp/core/ads/test_devices.dart';

class DFPBannerAdd extends StatefulWidget {
  final String adUnitId;
  final DFPAdSize size;
  final bool isDeveloper;

  const DFPBannerAdd(
      {Key key,
      @required this.adUnitId,
      this.size = DFPAdSize.BANNER,
      this.isDeveloper = false})
      : super(key: key);

  @override
  _DFPBannerAddState createState() => _DFPBannerAddState();
}

class _DFPBannerAddState extends State<DFPBannerAdd> {
  // DFPBannerViewController _contoller;
  @override
  Widget build(BuildContext context) {
    return DFPBanner(
      isDevelop: true,
      testDevices: MyTestDevices(),
      adUnitId: "/22166703028/icon_start_splash",
      adSize: DFPAdSize.LARGE_BANNER,
      onAdViewCreated: (controller) {
// _contoller = controller,
      },
      onAdLoaded: () {
        print('Banner onAdLoaded');
      },
      onAdFailedToLoad: (errorCode) {
        print('Banner onAdFailedToLoad: errorCode:$errorCode');
      },
      onAdOpened: () {
        print('Banner onAdOpened');
      },
      onAdClosed: () {
        print('Banner onAdClosed');
      },
      onAdLeftApplication: () {
        print('Banner onAdLeftApplication');
      },
    );
  }

  // void _reload() {
  //   _contoller?.reload();
  // }
}
