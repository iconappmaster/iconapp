import 'package:flutter_google_ad_manager/interstitial_ad.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/stores/user/user_store.dart';
import '../../core/extensions/string_ext.dart';
import 'interstitial_model.dart';
import 'package:advertising_id/advertising_id.dart';



const AD_SHOWED_THRESHOLD = 5;

class PhotoInterstitialAd {
  int counter = 1;

  DFPInterstitialAd _interstitialAd;

  PhotoInterstitialAd();

  Future load(String conversationName, String adUnitId) async {

    counter++;
    if (counter == AD_SHOWED_THRESHOLD) {
  
      counter = 0;

      final user = sl<UserStore>().getUser;
      final advertisingId = await AdvertisingId.id;
      final isLimitedTrackEnabled =
          await AdvertisingId.isLimitAdTrackingEnabled;

      final targeting = AdTargetingModel(
          ambirthyear: (DateTime.now().year - user?.age ?? 12).toString(),
          amgender: user.gender.toString().parseEnum(),
          aid: advertisingId,
          icon: conversationName,
          isLat: isLimitedTrackEnabled.toString());

      _interstitialAd = DFPInterstitialAd(
        isDevelop: false,
        customTargeting: targeting.toJson(),
        adUnitId: adUnitId,
        onAdLoaded: () {
          _interstitialAd?.show();
        },
        onAdFailedToLoad: (errorCode) {
          print('interstitialAd errorCode');
        },
        onAdOpened: () {
          print('interstitialAd onAdOpened');
        },
        onAdClosed: () {
          print('interstitialAd onAdClosed');
        },
        onAdLeftApplication: () {
          print('interstitialAd onAdLeftApplication');
        },
      );

      await _interstitialAd.load();
    }
  }

  Future dispose() async {
    _interstitialAd?.dispose();
  }
}
