// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'redemption_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RedemptionStore on _RedemptionStoreBase, Store {
  Computed<List<RedemptionProductModel>> _$redemptionProductsComputed;

  @override
  List<RedemptionProductModel> get redemptionProducts =>
      (_$redemptionProductsComputed ??= Computed<List<RedemptionProductModel>>(
              () => super.redemptionProducts,
              name: '_RedemptionStoreBase.redemptionProducts'))
          .value;
  Computed<int> _$userCreditsComputed;

  @override
  int get userCredits =>
      (_$userCreditsComputed ??= Computed<int>(() => super.userCredits,
              name: '_RedemptionStoreBase.userCredits'))
          .value;

  final _$_prodcutsAtom = Atom(name: '_RedemptionStoreBase._prodcuts');

  @override
  ObservableList<RedemptionProductModel> get _prodcuts {
    _$_prodcutsAtom.reportRead();
    return super._prodcuts;
  }

  @override
  set _prodcuts(ObservableList<RedemptionProductModel> value) {
    _$_prodcutsAtom.reportWrite(value, super._prodcuts, () {
      super._prodcuts = value;
    });
  }

  final _$setPointsAsyncAction = AsyncAction('_RedemptionStoreBase.setPoints');

  @override
  Future<dynamic> setPoints(String creditActionId) {
    return _$setPointsAsyncAction.run(() => super.setPoints(creditActionId));
  }

  final _$getRedemptionProductsAsyncAction =
      AsyncAction('_RedemptionStoreBase.getRedemptionProducts');

  @override
  Future<dynamic> getRedemptionProducts() {
    return _$getRedemptionProductsAsyncAction
        .run(() => super.getRedemptionProducts());
  }

  @override
  String toString() {
    return '''
redemptionProducts: ${redemptionProducts},
userCredits: ${userCredits}
    ''';
  }
}
