import 'package:flutter/foundation.dart';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';

import 'ad_model.dart';

abstract class CustomAdRepository {
  Future<AdModel> getImageAd();
}

class CustomAdRepositoryImpl implements CustomAdRepository {
  final RestClient rest;

  CustomAdRepositoryImpl({@required this.rest});

  @override
  Future<AdModel> getImageAd() async {
    return await rest.getImageAd();
  }
}
