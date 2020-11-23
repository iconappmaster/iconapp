import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

class Analytics {
   FirebaseAnalytics analytics;
   FirebaseAnalyticsObserver observer;

  AnalyticsFirebase() {
    analytics =  FirebaseAnalytics();
    observer =  FirebaseAnalyticsObserver(analytics: analytics);
  }

  

 Future<void> sendAnalyticsEvent(String name, Map<String, dynamic> params) async {
    await analytics.logEvent(
      name: name,
      parameters: params,
    );
  
  }

  Future<void> setUserId() async {
    await analytics.setUserId('some-user');

  }
}