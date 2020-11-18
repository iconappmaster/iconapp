import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter_google_ad_manager/interstitial_ad.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/stores/user/user_store.dart';
import '../../core/extensions/string_ext.dart';
import 'interstitial_model.dart';
import 'package:advertising_id/advertising_id.dart';

const AD_SHOWED_THRESHOLD = 5;

class InterstitialAdMob {
  int counter = 1;

  DFPInterstitialAd _interstitialAd;

  InterstitialAdMob();

  Future load(String conversationName, String adUnitId) async {
    final targetingInfo = MobileAdTargetingInfo(
      keywords: <String>['flutterio', 'beautiful apps'],
      contentUrl: 'https://flutter.io',
      childDirected: false,
      testDevices: <String>[]
    );

    final interstitial = InterstitialAd(
      adUnitId: adUnitId,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("InterstitialAd event is $event");
      },
    );

    interstitial
      ..load()
      ..show(
        anchorType: AnchorType.bottom,
        anchorOffset: 0.0,
        horizontalCenterOffset: 0.0,
      );
    // counter++;
    // if (counter == AD_SHOWED_THRESHOLD) {

    //   counter = 0;

    //   final user = sl<UserStore>().getUser;
    //   final advertisingId = await AdvertisingId.id;
    //   final isLimitedTrackEnabled =
    //       await AdvertisingId.isLimitAdTrackingEnabled;

    //   final targeting = AdTargetingModel(
    //       ambirthyear: (DateTime.now().year - user?.age ?? 12).toString(),
    //       amgender: user.gender.toString().parseEnum(),
    //       aid: advertisingId,
    //       icon: conversationName,
    //       isLat: isLimitedTrackEnabled.toString());

    //   _interstitialAd = DFPInterstitialAd(
    //     isDevelop: false,
    //     customTargeting: targeting.toJson(),
    //     adUnitId: adUnitId,
    //     onAdLoaded: () {
    //       _interstitialAd?.show();
    //     },
    //     onAdFailedToLoad: (errorCode) {
    //       print('interstitialAd errorCode');
    //     },
    //     onAdOpened: () {
    //       print('interstitialAd onAdOpened');
    //     },
    //     onAdClosed: () {
    //       print('interstitialAd onAdClosed');
    //     },
    //     onAdLeftApplication: () {
    //       print('interstitialAd onAdLeftApplication');
    //     },
    //   );

    //   await _interstitialAd.load();
    // }
  }

  Future dispose() async {
    _interstitialAd?.dispose();
  }
}
