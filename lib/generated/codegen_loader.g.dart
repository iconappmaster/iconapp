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
    "phoneSubtitle": "מה מספר הטלפון שלך?",
    "onboarding_enter_code": "הזן/י את הקוד שנשלח אליך ב- SMS",
    "phone_counting": "הקוד יגיע בעוד {} שניות",
    "phone_too_short": "אנא הקלד/י מספר טלפון בן 7 ספרות.",
    "profile_name": "שם מלא",
    "profile_age": "גיל",
    "profile_female": "אישה",
    "profile_male": "גבר",
    "profile_other": "אחר",
    "wrong_name": "אנא ציין שם ושם משפחה",
    "wrong_age": ""
  }
};
  static const Map<String,dynamic> en_US = {
  "action_continue": "continue",
  "policy": {
    "terms": "bla ",
    "link": "bla",
    "prefix": " bla"
  },
  "onboarding": {
    "phoneTitle": "bla",
    "phoneSubtitle": "bla",
    "onboarding_enter_code": "bla",
    "phone_counting": "bla"
  }
};
  static const Map<String, Map<String,dynamic>> mapLocales = {"he_HE": he_HE, "en_US": en_US};
}
