// Admob app keys
import 'dart:io';

// Admob interstitial keys
final androidInterstitialId = 'ca-app-pub-5806212644011393/9700958560';
final iosInterstitialId = 'ca-app-pub-5806212644011393/7847793171';
String get getInterstitialAdUnitId => Platform.isAndroid ? androidInterstitialId : iosInterstitialId;

// Admob banner keys
final androidBannerlId = 'ca-app-pub-5806212644011393/2014040231';
final iosBannerId = 'ca-app-pub-5806212644011393/8670770313';
String get getBannerAdUnitId => Platform.isAndroid ? androidBannerlId : iosBannerId;

// Admob rewarded keys
final androidRewardedId = 'ca-app-pub-5806212644011393/8263560291';
final iosRewardedId = 'ca-app-pub-5806212644011393/2428779688';
String get getRewardAdUnitId => Platform.isAndroid ? androidRewardedId : iosRewardedId;