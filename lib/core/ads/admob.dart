import 'package:admob_flutter/admob_flutter.dart';

import 'ad_config.dart';

const AD_SHOWED_THRESHOLD = 5;

class AdMob {
  int counter = 1;

  AdmobInterstitial interstitialAd;

  Future loadInterstital() async {
    if (counter == AD_SHOWED_THRESHOLD) {
      counter++;
      await Admob.requestTrackingAuthorization();
      interstitialAd = AdmobInterstitial(
          nonPersonalizedAds: true,
          adUnitId: getInterstitialAdUnitId,
          listener: (AdmobAdEvent event, Map<String, dynamic> args) =>
              handleEvent(event, args, 'interstitialAd'));

      await interstitialAd.load();
    }
  }

  void showInterstitial() {
    interstitialAd?.show();
  }

  void handleEvent(
      AdmobAdEvent event, Map<String, dynamic> args, String adType) {
    switch (event) {
      case AdmobAdEvent.loaded:
        print('New Admob $adType Ad loaded!');
        break;
      case AdmobAdEvent.opened:
        print('Admob $adType Ad opened!');

        break;
      case AdmobAdEvent.closed:
        interstitialAd?.load();
        break;
      case AdmobAdEvent.failedToLoad:
        print('Admob $adType failed to load. :(');
        break;
      case AdmobAdEvent.rewarded:
        print('Admob $adType rewarded');
        break;
      default:
    }
  }
}
