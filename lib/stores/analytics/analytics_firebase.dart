import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import '../../core/dependencies/locator.dart';
import '../../data/models/user_model.dart';
import '../../core/extensions/string_ext.dart';
import '../../main.dart';

final analytics = sl<Analytics>();

class Analytics {
  FirebaseAnalytics client;
  FirebaseAnalyticsObserver observer;

  Analytics() {
    client = FirebaseAnalytics();
    observer = FirebaseAnalyticsObserver(analytics: client);
  }

  Future<void> sendAnalyticsEvent(
      String name, Map<String, dynamic> params) async {
    await client.logEvent(
      name: name,
      parameters: params,
    );
   
    logger.i('logEvent: $name');
  }

  Future<void> sendConversationEvent(String name, int conversationId) async {
    await client.logEvent(
      name: name,
      parameters: <String, dynamic>{
        'conversationId': conversationId,
      },
    );
    logger.i('sendConversationEvent: $name, conversationId: $conversationId');
  }

  Future<void> userFinishedOnboarind(UserModel user) async {
    client
      ..setUserProperty(name: 'full_name', value: user.fullName)
      ..setUserProperty(name: 'age', value: user.age.toString())
      ..setUserProperty(
          name: 'gender', value: user.gender.toString().parseEnum());
    logger.i('userFinishedOnboarind: ${user.id}');
  }

  Future<void> setUserId(int userId) async {
    await client.setUserId(userId.toString());
    logger.i('setUserId $userId');
  }
}
