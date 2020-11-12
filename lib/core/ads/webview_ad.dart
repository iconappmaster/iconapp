import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:iconapp/core/firebase/crashlytics.dart';
import 'package:iconapp/widgets/global/rounded_close.dart';

class WebViewAdScreen extends StatelessWidget {
  final String initialUrl;
  final String javaScript;

  const WebViewAdScreen({
    Key key,
    @required this.initialUrl,
    @required this.javaScript,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          InAppWebView(
              initialUrl: initialUrl,
              initialHeaders: {},
              initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(
                debuggingEnabled: true,
                disableHorizontalScroll: true,
                disableContextMenu: true,
                disableVerticalScroll: true,
              )),
              onWebViewCreated: (controller) =>
                  onWebViewCreate(controller, context),
              onLoadStart: (InAppWebViewController controller, String url) {},
              onLoadStop:
                  (InAppWebViewController controller, String url) async {},
              onProgressChanged:
                  (InAppWebViewController controller, int progress) {}),
          Positioned(
            top: 45,
            right: 25,
            child: RoundedClose(),
          ),
        ],
      ),
    );
  }

  void onWebViewCreate(
      InAppWebViewController controller, BuildContext context) {
    controller
      ..evaluateJavascript(source: javaScript)
      ..addJavaScriptHandler(
          handlerName: 'onVideoEnded',
          callback: (_) => ExtendedNavigator.of(context).pop())
      ..addJavaScriptHandler(
        handlerName: 'onError',
        callback: (error) => Crash.report(error),
      );
  }
}
