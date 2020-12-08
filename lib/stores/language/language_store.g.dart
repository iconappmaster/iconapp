// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LanguageStore on _LanguageStoreBase, Store {
  Computed<LanguageDirection> _$directionComputed;

  @override
  LanguageDirection get direction => (_$directionComputed ??=
          Computed<LanguageDirection>(() => super.direction,
              name: '_LanguageStoreBase.direction'))
      .value;
  Computed<Alignment> _$alignmentComputed;

  @override
  Alignment get alignment =>
      (_$alignmentComputed ??= Computed<Alignment>(() => super.alignment,
              name: '_LanguageStoreBase.alignment'))
          .value;
  Computed<bool> _$isLTRComputed;

  @override
  bool get isLTR => (_$isLTRComputed ??=
          Computed<bool>(() => super.isLTR, name: '_LanguageStoreBase.isLTR'))
      .value;
  Computed<TextAlign> _$textAlignComputed;

  @override
  TextAlign get textAlign =>
      (_$textAlignComputed ??= Computed<TextAlign>(() => super.textAlign,
              name: '_LanguageStoreBase.textAlign'))
          .value;
  Computed<int> _$switchIndexComputed;

  @override
  int get switchIndex =>
      (_$switchIndexComputed ??= Computed<int>(() => super.switchIndex,
              name: '_LanguageStoreBase.switchIndex'))
          .value;

  final _$_languageDirectionAtom =
      Atom(name: '_LanguageStoreBase._languageDirection');

  @override
  LanguageDirection get _languageDirection {
    _$_languageDirectionAtom.reportRead();
    return super._languageDirection;
  }

  @override
  set _languageDirection(LanguageDirection value) {
    _$_languageDirectionAtom.reportWrite(value, super._languageDirection, () {
      super._languageDirection = value;
    });
  }

  final _$_LanguageStoreBaseActionController =
      ActionController(name: '_LanguageStoreBase');

  @override
  void setLangaugeFromSwitchIndex(int index) {
    final _$actionInfo = _$_LanguageStoreBaseActionController.startAction(
        name: '_LanguageStoreBase.setLangaugeFromSwitchIndex');
    try {
      return super.setLangaugeFromSwitchIndex(index);
    } finally {
      _$_LanguageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
direction: ${direction},
alignment: ${alignment},
isLTR: ${isLTR},
textAlign: ${textAlign},
switchIndex: ${switchIndex}
    ''';
  }
}
