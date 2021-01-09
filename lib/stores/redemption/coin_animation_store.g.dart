// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_animation_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CoinAnimationStore on _CoinAnimationStoreBase, Store {
  Computed<bool> _$showCoinsComputed;

  @override
  bool get showCoins =>
      (_$showCoinsComputed ??= Computed<bool>(() => super.showCoins,
              name: '_CoinAnimationStoreBase.showCoins'))
          .value;

  final _$_showCoinsAtom = Atom(name: '_CoinAnimationStoreBase._showCoins');

  @override
  bool get _showCoins {
    _$_showCoinsAtom.reportRead();
    return super._showCoins;
  }

  @override
  set _showCoins(bool value) {
    _$_showCoinsAtom.reportWrite(value, super._showCoins, () {
      super._showCoins = value;
    });
  }

  final _$_CoinAnimationStoreBaseActionController =
      ActionController(name: '_CoinAnimationStoreBase');

  @override
  void setShowCoins(bool showCoin) {
    final _$actionInfo = _$_CoinAnimationStoreBaseActionController.startAction(
        name: '_CoinAnimationStoreBase.setShowCoins');
    try {
      return super.setShowCoins(showCoin);
    } finally {
      _$_CoinAnimationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showCoins: ${showCoins}
    ''';
  }
}
