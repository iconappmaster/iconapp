// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_ads_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CustomAdsStore on _CustomAdsStoreBase, Store {
  Computed<AdModel> _$currnetAdComputed;

  @override
  AdModel get currnetAd =>
      (_$currnetAdComputed ??= Computed<AdModel>(() => super.currnetAd,
              name: '_CustomAdsStoreBase.currnetAd'))
          .value;
  Computed<bool> _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_CustomAdsStoreBase.loading'))
      .value;

  final _$_currentAdAtom = Atom(name: '_CustomAdsStoreBase._currentAd');

  @override
  AdModel get _currentAd {
    _$_currentAdAtom.reportRead();
    return super._currentAd;
  }

  @override
  set _currentAd(AdModel value) {
    _$_currentAdAtom.reportWrite(value, super._currentAd, () {
      super._currentAd = value;
    });
  }

  final _$_loadingAtom = Atom(name: '_CustomAdsStoreBase._loading');

  @override
  bool get _loading {
    _$_loadingAtom.reportRead();
    return super._loading;
  }

  @override
  set _loading(bool value) {
    _$_loadingAtom.reportWrite(value, super._loading, () {
      super._loading = value;
    });
  }

  final _$launchLinkAsyncAction = AsyncAction('_CustomAdsStoreBase.launchLink');

  @override
  Future<dynamic> /*  */launchLink() {
    return _$launchLinkAsyncAction.run(() => super.launchLink());
  }

  final _$getImageAdAsyncAction = AsyncAction('_CustomAdsStoreBase.getImageAd');

  @override
  Future<dynamic> getImageAd() {
    return _$getImageAdAsyncAction.run(() => super.getImageAd());
  }

  @override
  String toString() {
    return '''
currnetAd: ${currnetAd},
loading: ${loading}
    ''';
  }
}
