import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/global/lottie_loader.dart';

class ViewerPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      height: 58.7,
      child: Center(
        child: RichText(
          text: TextSpan(children: [
            TextSpan(text: 'רק ', style: chatCompose),
            TextSpan(
                text: 'מנהלי קבוצה ',
                style: chatCompose.copyWith(color: cornflower)),
            TextSpan(text: 'יכולים לשלוח הודעה', style: chatCompose),
          ]),
        ),
      ),
    );
  }
}

class PanelSubscriber extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = sl<ChatStore>();
    return Observer(
      builder: (_) => Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            color: white,
            height: 58.7,
            child: Center(
                child: FlatButton(
              child: CustomText('הצטרפות לקבוצה',
                  style: chatCompose.copyWith(color: cornflower)),
              onPressed: () => store.subscribe(), // TEST THIS - SHOULD BE FIXED
            )),
          ),
          if (store.isSubscribing)
            Positioned(
              left: 16,
              child: CircularProgressIndicator(
                strokeWidth: 1,
              ),
            ),
        ],
      ),
    );
  }
}
