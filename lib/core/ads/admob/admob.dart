import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/foundation.dart';

import 'ad_config.dart';

const INTERSTITIAL_AD_SHOWED_THRESHOLD = 4;
const REWARD_AD_SHOWED_THRESHOLD = 2;

class AdMob {
  int interstitialCounter = 4;
  int rewardCounter = 1;

  AdmobInterstitial interstitialAd;
  AdmobReward rewardAd;
  Function _rewardClosed;

  Future loadInterstital() async {
    await Admob?.requestTrackingAuthorization();
    interstitialAd = AdmobInterstitial(
        nonPersonalizedAds: false,
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
        nonPersonalizedAds: false);
    await rewardAd.load();
  }

  Future showRewardlNow() async {
    if (rewardCounter == REWARD_AD_SHOWED_THRESHOLD) {
      rewardCounter = 0;
      if (await rewardAd?.isLoaded) {
        await rewardAd?.show();
      } else {
        rewardAd
          ..load()
          ..show();
      }
    }
    rewardCounter++;
  }

  void showWithCounterInterstitial() {
    if (interstitialCounter == INTERSTITIAL_AD_SHOWED_THRESHOLD) {
      interstitialCounter = 0;
      interstitialAd?.show();
    }
    interstitialCounter++;
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
          _rewardClosed.call();
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
