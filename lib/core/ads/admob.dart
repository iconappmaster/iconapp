import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/foundation.dart';

import 'ad_config.dart';

const AD_SHOWED_THRESHOLD = 4;

class AdMob {
  int counter = 4;

  AdmobInterstitial interstitialAd;
  AdmobReward rewardAd;

  Future loadInterstital() async {
    await Admob?.requestTrackingAuthorization();
    interstitialAd = AdmobInterstitial(
        nonPersonalizedAds: true,
        adUnitId: kReleaseMode
            ? getInterstitialAdUnitId
            : AdmobInterstitial.testAdUnitId,
        listener: (AdmobAdEvent event, Map<String, dynamic> args) =>
            handleEvent(event, args, 'interstitialAd'));

    await interstitialAd.load();
  }

  Future loadReward() async {
    rewardAd = AdmobReward(
      adUnitId: kReleaseMode ? getRewardAdUnitId : AdmobReward.testAdUnitId,
      listener: (AdmobAdEvent event, Map<String, dynamic> args) {
        if (event == AdmobAdEvent.closed) rewardAd.load();
        handleEvent(event, args, 'Reward');
      },
    );
    await rewardAd.load();
  }

  Future showRewardlNow() async {
    if (await rewardAd.isLoaded) {
      rewardAd?.show();
    } else {
      await loadReward();
      rewardAd?.show();
    }
  }

  void showWithCounterInterstitial() {
    if (counter == AD_SHOWED_THRESHOLD) {
      counter = 0;
      interstitialAd?.show();
    }
    counter++;
  }

  void showInterstitialNow() async {
    if (await interstitialAd.isLoaded) {
      interstitialAd?.show();
    } else {
      await loadInterstital();
      interstitialAd?.show();
    }
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
        if (adType == 'Reward') {
          rewardAd.load();
        } else if (adType == 'interstitialAd') {
          interstitialAd?.load();
        }
        print('Admob $adType Ad loaded!');
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
