import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:iconapp/widgets/global/shimmer.dart';
import 'package:easy_localization/easy_localization.dart';

class ViewerPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      height: 58.7,
      child: Center(
          child:
              CustomText(LocaleKeys.chat_viewerPanel.tr(), style: chatCompose)),
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
              height: 105,
              child: Center(
                child: FlatButton(
                  child: Shimmer.fromColors(
                    baseColor: white,
                    highlightColor: cornflower,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 32.0),
                      child: CustomText(LocaleKeys.chat_subsribe.tr(),
                          style: chatCompose.copyWith(
                              color: store.isSubscribing
                                  ? Colors.grey
                                  : cornflower)),
                    ),
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
