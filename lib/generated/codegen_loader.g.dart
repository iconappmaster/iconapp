// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

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
  "action_save": "שמור",
  "action_close": "סגור",
  "policy": {
    "terms": "כניסה לאפליקציה מהווה אישור ",
    "link": "לתנאי השימוש",
    "prefix": " שלנו",
    "title": "תנאי שימוש"
  },
  "search": {
    "empty_state": "לא מצאנו את מה שחיפשת\nנסה/י להקליד משהו אחר"
  },
  "general": {
    "server_error": "תקלה בשרת, אנא נסה שנית",
    "iGotIt": "הבנתי, תודה!"
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
    "wrongAge": "מעל גיל 10",
    "wrongCode": "קוד שגוי, אנא נסה שנית"
  },
  "create": {
    "groupNameHint": "הקלד/י כאן את נושא הקבוצה",
    "groupNameDescription": "בחר/י נושא לקבוצה החדשה. כדאי להוסיף גם אייקון.",
    "groupNameAppbarTitle": "נושא הקבוצה",
    "categoriesSubtitle": "בחר/י קטגוריה",
    "iconSubtitle": "בחר/י משתתפים לקבוצה",
    "newGroupTitle": "יצירת קבוצה חדשה",
    "iconValidation": "יש לבחור יותר מאייקון אחד",
    "categoryValidation": "יש לבחור יותר מקטגוריה אחת",
    "addUser": "הוספת משתתף",
    "chooseUserToGroup": "בחר/י משתתף לקבוצה"
  },
  "welcome": {
    "title": "ברוכים הבאים לאייקון",
    "content": "ברוך הבא ל-Icon! אצלנו תהיה חלק מקהילות\nועולמות תוכן המדברים אליך. קבוצות הצ'אט שלנו מנוהלות\nעל ידי אייקונים, מובילי דעה ויוצרי תוכן המובילים בתחומם\nהקהל הרחב יוכל לצפות בשיחות המתקיימות 24/7 ולהגיב באמצעות חייכנים. מנהל הקבוצה יוכל לפתוח את הקבוצה לשילוב הקהל בשיחה כשיבחר. מהיום אתה חלק מקבוצות האייקונים האהובים עליך."
  },
  "chat": {
    "messageInputHint": "הקלד/י הודעה",
    "welcomeTitle": "ברוך הבא ל {}",
    "welcomeContent": "איזה כיף! הצטרפת לקבוצה הראשונה שלך.\nבקבוצות תיחשף לשיחות צ׳אט והודעות בין אייקונים.\nתוכל להגיב להודעות ולסטורי באמצעות חייכנים ואימוג׳ים.\nאתה יכול להצטרף לכל קבוצה שמעניינת אותך ואפילו לבחור לעקוב אחר אייקון ספציפי בקבוצות בהן הוא פעיל.\nאתה נכנס למימד חדש, ודא שהאייקונים ידעו שאתה שם."
  },
  "disconnect": {
    "content": "אנחנו נתגעגע אלייך, {} {} {} רוצה לצאת מכל הצ׳אטים שלך?"
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
