import 'package:mobx/mobx.dart';
part 'analytics_store.g.dart';

class AnalyticsStore = _AnalyticsStoreBase with _$AnalyticsStore;

abstract class _AnalyticsStoreBase with Store {
  
}

// class Analytics {
//   final FirebaseAnalytics analytics;
//   final FirebaseAnalyticsObserver observer;

//  Future<void> _sendAnalyticsEvent(String name, Map<String, dynamic> params) async {
//     await analytics.logEvent(
//       name: name,
//       parameters: params,
//     );
//     setMessage('logEvent succeeded');
//   }

//   Future<void> _testSetUserId() async {
//     await analytics.setUserId('some-user');
//     setMessage('setUserId succeeded');
//   }
// }