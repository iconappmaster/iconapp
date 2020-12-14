import 'package:flutter/material.dart';
import 'package:iconapp/core/bus.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/sources/local/shared_preferences.dart';
import 'package:mobx/mobx.dart';
import '../../core/extensions/string_ext.dart';
part 'language_store.g.dart';

enum LanguageDirection { ltr, rtl }

final language = sl<LanguageStore>();

class LanguageStore = _LanguageStoreBase with _$LanguageStore;

abstract class _LanguageStoreBase with Store {
  SharedPreferencesService _sp;

  _LanguageStoreBase() {
    _sp = sl<SharedPreferencesService>();

    final ltr = LanguageDirection.ltr.toString().parseEnum();

    if (_sp.contains(StorageKey.language)) {
      _languageDirection = _sp.getString(StorageKey.language) == ltr
          ? LanguageDirection.ltr
          : LanguageDirection.rtl;
    } else {
      _languageDirection = LanguageDirection.ltr;
    }
  }

  @observable
  LanguageDirection _languageDirection;

  @computed
  LanguageDirection get direction => _languageDirection;

  @computed
  Alignment get alignment => _languageDirection == LanguageDirection.ltr
      ? Alignment.centerLeft
      : Alignment.centerRight;
  @computed
  TextDirection get textDirection =>
      isLTR ? TextDirection.ltr : TextDirection.rtl;

  @computed
  bool get isLTR => language.direction == LanguageDirection.ltr;

  @computed
  TextAlign get textAlign => language.direction == LanguageDirection.ltr
      ? TextAlign.left
      : TextAlign.right;

  @computed
  int get switchIndex => _languageDirection == LanguageDirection.ltr ? 0 : 1;

  @action
  void setLangaugeFromSwitchIndex(int index) {
    // set the current selection
    _languageDirection =
        index == 0 ? LanguageDirection.ltr : LanguageDirection.rtl;

    // persist language selection
    _sp.setString(
        StorageKey.language, _languageDirection.toString().parseEnum());

    // fire an event to change the Locale
    sl<Bus>().fire(LanguageChangedEvnet(direction: direction));
  }
}

// This event represent the selected lanaguage
class LanguageChangedEvnet {
  final LanguageDirection direction;

  const LanguageChangedEvnet({
    @required this.direction,
  });
}
