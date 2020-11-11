import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:iconapp/data/models/user_model.dart';

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
        initialUrl: 'http://akamai.advsnx.net/CDN/icon/player.html',
        initialHeaders: {},
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
              verticalScrollBarEnabled: false,
              horizontalScrollBarEnabled: false,
              javaScriptEnabled: true,
              supportZoom: false,
              disableHorizontalScroll: true,
              disableContextMenu: true,
              
              disableVerticalScroll: true,
              debuggingEnabled: true),
        ),
        onWebViewCreated: (InAppWebViewController controller) {
          controller.evaluateJavascript(source: js);
        },
        onLoadStart: (InAppWebViewController controller, String url) {},
        onLoadStop: (InAppWebViewController controller, String url) async {},
        onProgressChanged: (InAppWebViewController controller, int progress) {},
      ),
    );
  }
}

final js = '''
{  
category: "NoaKirl",  // the icon name
    content: {  
                    id: "c674e73b1b54e610VgnVCM200000650a10acRCRD",  
                   duration: 2295,  
                    programName: "Noa Kirl invite you to icon",  // the video name
                    videoURL: "https://www.domain.co.il/page.mp4"  // the video URL to play
              },  
    subscriber: {  
                    id: "477c4275”, //ICON internal ID if the user
                    birthYear: "1990",  
                    gender: "female"  
                },  
    aid: "477c4275-2221-47f8-bb32-dc94927c9592"    // Advertising ID – IDFA/ADID
}  
''';

const defaultAid = '477c4275-2221-47f8-bb32-dc94927c9592';

class WebAdInfo {
  final String aid;
  final String category;
  final AdContent content;
  final AdSubscriber subscriber;

  WebAdInfo({
    @required this.category,
    @required this.content,
    @required this.subscriber,
    this.aid = defaultAid,
  });
}

class AdContent {
  final String id;
  final int duration;
  final String prgramName;
  final String videoURL;

  AdContent(
      {@required this.id,
      @required this.duration,
      @required this.prgramName,
      @required this.videoURL});
}

class AdSubscriber {
  final String id;
  final String birthYear;
  final UserGender gender;

  AdSubscriber({
    @required this.id,
    @required this.birthYear,
    @required this.gender,
  });
}
