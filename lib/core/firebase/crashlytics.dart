import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/stores/user/user_store.dart';

class Crash {
  static report(String msg) {
    final crashlytics = FirebaseCrashlytics.instance;
    crashlytics.log(msg);

    final user = sl<UserStore>()?.getUser;
    if (user != null) {
      crashlytics.log(user?.fullName ?? '');
      crashlytics.setUserIdentifier(user?.id.toString() ?? '');
    }
  }
}
