import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:iconapp/core/firebase/crashlytics.dart';

class DynamicLink {
  Future handleDynamicLinks(Function(int) onLink) async {
    // 1. Get the initial dynamic link if the app is opened with a dynamic link
    final PendingDynamicLinkData data =
        await FirebaseDynamicLinks.instance.getInitialLink();

    // 2. handle link that has been retrieved
    _handleDeepLink(data, onLink);

    // 3. Register a link callback to fire if the app is opened up from the background
    // using a dynamic link.
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
      // 3a. handle link that has been retrieved
      _handleDeepLink(dynamicLink, onLink);
    }, onError: (OnLinkErrorException e) async {
      print('Link Failed: ${e.message}');
      Crash.report(e.message);
    });
  }

  Future _handleDeepLink(PendingDynamicLinkData data, Function onLink) async {
    final Uri deepLink = data?.link;
    if (deepLink != null) {
      print('_handleDeepLink | deeplink: $deepLink');

      // Check if we want to make a post
      var isConversation = deepLink.pathSegments.contains('conversation');

      if (isConversation) {
        // get the title of the post
        final id = int.tryParse(deepLink.queryParameters['id']);

        if (id != null) onLink(id);
      }
    }
  }
}
