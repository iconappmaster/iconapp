import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewAdScreen extends StatelessWidget {
  final String initialUrl;

  const WebViewAdScreen({
    Key key,
    @required this.initialUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InAppWebView(
        initialUrl:
            'https://akamai.advsnx.net/CDN/demo.test/players/vjs/demo.html',
        initialHeaders: {},
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            supportZoom: false,
            disableHorizontalScroll: true,
            disableContextMenu: true,
            disableVerticalScroll: true,
            debuggingEnabled: true,
          ),
        ),
        onWebViewCreated: (InAppWebViewController controller) {
          controller.injectJavascriptFileFromUrl(urlFile: null);
        },
        onLoadStart: (InAppWebViewController controller, String url) {},
        onLoadStop: (InAppWebViewController controller, String url) async {},
        onProgressChanged: (InAppWebViewController controller, int progress) {},
      ),
    );
  }
}
