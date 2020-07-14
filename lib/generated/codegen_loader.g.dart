// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

    static const Map<String,dynamic> he_HE = {
  "action_continue": "המשך",
  "policy": {
    "terms": "כניסה לאפליקציה מהווה אישור ",
    "link": "לתנאי השימוש",
    "prefix": " שלנו"
  },
  "onboarding": {
    "phoneTitle": "כדי להתחבר לקבוצות הצ׳אט אנחנו\nצריכים את מספר הטלפון שלך",
    "phoneSubtitle": "מה מספר הטלפון שלך?"
  }
};
  static const Map<String,dynamic> en_US = {
  "action_continue": "continue"
};
  static const Map<String, Map<String,dynamic>> mapLocales = {"he_HE": he_HE, "en_US": en_US};
}
