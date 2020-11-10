import 'package:flutter/foundation.dart';
import 'package:flutter_google_ad_manager/interstitial_ad.dart';

class InterstitialAd {
  final String adUnitId;
  DFPInterstitialAd _interstitialAd;

  InterstitialAd({@required this.adUnitId}) {
    load();
  }

  Future load() async {
    _interstitialAd = DFPInterstitialAd(
      isDevelop: true,
      adUnitId: adUnitId,
      onAdLoaded: () {
        print('interstitialAd onAdLoaded');
      },
      onAdFailedToLoad: (errorCode) {
        print('interstitialAd onAdFailedToLoad: errorCode:$errorCode');
      },
      onAdOpened: () {
        print('interstitialAd onAdOpened');
      },
      onAdClosed: () {
        print('interstitialAd onAdClosed');
        _interstitialAd.load();
      },
      onAdLeftApplication: () {
        print('interstitialAd onAdLeftApplication');
      },
    );

    await _interstitialAd.load();
  }

  Future show() async {
    _interstitialAd?.show();
  }

  Future dispose() async {
    _interstitialAd?.dispose();
  }
}
