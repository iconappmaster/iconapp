import 'package:dio/dio.dart';
import 'package:iconapp/core/ads/provider_ads/model/ad_model.dart';
import 'package:iconapp/core/ads/provider_ads/model/ad_repository.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/firebase/crashlytics.dart';
import 'package:iconapp/stores/analytics/analytics_consts.dart';
import 'package:iconapp/stores/analytics/analytics_firebase.dart';
import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';
part 'custom_ads_store.g.dart';

class CustomAdsStore = _CustomAdsStoreBase with _$CustomAdsStore;

abstract class _CustomAdsStoreBase with Store {
  CustomAdRepository _repository;

  _CustomAdsStoreBase() {
    _repository = sl<CustomAdRepository>();
  }

  @observable
  AdModel _currentAd;

  @observable
  bool _loading = false;

  @computed
  AdModel get currnetAd => _currentAd;

  @computed
  bool get loading => _loading;

  @action
  Future launchLink() async {
    final url = _currentAd.linkUrl;
    if (await canLaunch(url)) {
      
      analytics
          .sendAnalyticsEvent(CUSTOM_AD_LINK_CLICKED, {'ad_id': _currentAd.id});

      launch(url);
    }
  }

  @action
  Future getImageAd() async {
    try {
      final ad = await _repository.getImageAd();
      _currentAd = ad;
      analytics.sendAnalyticsEvent(CUSTOM_AD_SEEN, {'ad_id': ad.id});
    } on DioError catch (e) {
      Crash.report(e.message);
    }
  }
}
