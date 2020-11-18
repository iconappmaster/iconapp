import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:iconapp/widgets/global/shimmer.dart';

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
                text: 'מנהלי קבוצה',
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
        alignment: Alignment.bottomCenter,
        children: [
          IgnorePointer(
            ignoring: store.isSubscribing,
            child: Container(
              color: darkIndigo2,
              height: 65,
              child: Center(
                child: FlatButton(
                  child: Shimmer.fromColors(
                    baseColor: white,
                    highlightColor: cornflower,
                    child: CustomText('הצטרפות לקבוצה',
                        style: chatCompose.copyWith(
                            color: store.isSubscribing
                                ? Colors.grey
                                : cornflower)),
                  ),
                  onPressed: () => store.subscribe(),
                ),
              ),
            ),
          ),
          if (store.isSubscribing)
            Positioned(
              right: 16,
              bottom: 15,
              child: CircularProgressIndicator(
                strokeWidth: 1,
              ),
            ),
        ],
      ),
    );
  }
}
