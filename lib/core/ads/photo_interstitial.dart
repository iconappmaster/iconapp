import 'package:flutter_google_ad_manager/interstitial_ad.dart';
import 'package:get_it/get_it.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/stores/user/user_store.dart';
import '../../core/extensions/string_ext.dart';
import 'interstitial_model.dart';

const defaultAid = '477c4275-2221-47f8-bb32-dc94927c9592';
const adUnitId = '/22166703028/icon_start_splash';

class PhotoInterstitialAd {
  DFPInterstitialAd _interstitialAd;

  PhotoInterstitialAd();

  Future load(String conversationName, String adUnitId) async {
    final user = sl<UserStore>().getUser;

    final targeting = AdTargetingModel(
      ambirthyear: (DateTime.now().year - user?.age).toString(),
      amgender: user.gender.toString().parseEnum(),
      aid: defaultAid,
      icon: conversationName,
      isLat: 'true',
    );

    _interstitialAd = DFPInterstitialAd(
      isDevelop: false,
      customTargeting: targeting.toJson(),
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
    throwIf(_interstitialAd == null, '_interstitialAd must initialized');
    _interstitialAd?.show();
  }

  Future dispose() async {
    _interstitialAd?.dispose();
  }
}
