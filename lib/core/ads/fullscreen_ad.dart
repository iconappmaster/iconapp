import 'package:flutter/foundation.dart';
import 'package:flutter_google_ad_manager/interstitial_ad.dart';

class InterstitialAd {
  final String adUnitId;
  DFPInterstitialAd _interstitialAd;

  InterstitialAd({@required this.adUnitId}) {
    load();
  }

  Future load() async {
    var payload = {
      'ambirthyear': '1970',
      'amgender': 'male',
      'aid': '477c4275-2221-47f8-bb32-dc94927c9592',
      'isLat': 'false',
      'icon': 'kirl'
    };

    _interstitialAd = DFPInterstitialAd(
      
      isDevelop: false,
      customTargeting: payload,
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
