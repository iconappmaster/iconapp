import 'package:flutter/foundation.dart';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';

import 'ad_model.dart';

abstract class CustomAdRepository {
  Future<AdModel> getImageAd();
  Future adTapped(int adId);
  Future adViewed(int adId);
}

class CustomAdRepositoryImpl implements CustomAdRepository {
  final RestClient rest;

  CustomAdRepositoryImpl({@required this.rest});

  @override
  Future<AdModel> getImageAd() async {
    return await rest.getImageAd();
  }

  @override
  Future adTapped(int adId) async {
    return await rest.adTapped(adId);
  }

  @override
  Future adViewed(int adId) async {
    return await rest.adViewed(adId);
  }
}
