import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/ads/provider_ads/store/custom_ads_store.dart';
import 'package:iconapp/core/dependencies/locator.dart';

class CustomAd extends StatefulWidget {
  @override
  _CustomAdState createState() => _CustomAdState();
}

class _CustomAdState extends State<CustomAd> {
  CustomAdsStore _ads;
 
  @override
  void initState() {
    _ads = sl<CustomAdsStore>();

    initAd();

    Future.delayed(
        Duration(seconds: 4), () => ExtendedNavigator.of(context).pop());
   
   super.initState();
  }

  Future initAd() async => await _ads.getImageAd();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Observer(builder: (_) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Container(
            child: _ads.loading
                ? Center(child: CupertinoActivityIndicator(animating: true))
                : Stack(children: [
                    GestureDetector(
                      onTap: () => _ads?.launchLink(),
                      child: _ads?.currnetAd != null
                          ? CachedNetworkImage(
                              fadeInCurve: Curves.easeInOutQuart,
                              imageUrl: _ads?.currnetAd?.adUrl ?? '',
                              height: double.infinity,
                              width: double.infinity,
                              alignment: Alignment.center,
                              fit: BoxFit.contain)
                          : Container(),
                    ),
                  ]),
          ),
        );
      }),
    );
  }
}
