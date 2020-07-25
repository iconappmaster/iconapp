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
    "enterCode": "הזן/י את הקוד שנשלח אליך ב- SMS",
    "phoneCounting": "הקוד יגיע בעוד {} שניות",
    "phone_tooShort": "אנא הקלד/י מספר טלפון בן 7 ספרות.",
    "profileName": "שם מלא",
    "profileAge": "גיל",
    "profileFemale": "אישה",
    "profileMale": "גבר",
    "profileOther": "אחר",
    "wrongName": "אנא ציין שם ושם משפחה",
    "wrongAge": ""
  },
  "create": {
    "groupNameHint": "הקלד/י כאן את נושא הקבוצה",
    "groupNameDescription": "בחר/י נושא לקבוצה החדשה. כדאי להוסיף גם אייקון.",
    "groupNameAppbarTitle": "נושא הקבוצה",
    "groupSelectCategoryAppbarTitle": "בחר/י קטגוריה",
    "groupSelectContactAppbarTitle": "בחר/י משתתפים לקבוצה"
  }
};
  static const Map<String,dynamic> en_US = {
  "action_continue": "continue",
  "general": {
    "server_error": "תקלה בשרת, אנא נסה שנית"
  },
  "policy": {
    "terms": "bla ",
    "link": "bla",
    "prefix": " bla"
  },
  "onboarding": {
    "phoneTitle": "bla",
    "phoneSubtitle": "bla",
    "onboarding_enter_code": "bla",
    "phone_counting": "bla",
    "wrongCode": "קוד שגוי, אנא נסה שנית"
  }
};
  static const Map<String, Map<String,dynamic>> mapLocales = {"he_HE": he_HE, "en_US": en_US};
}
