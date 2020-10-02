import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/widgets/home/conversation_tile.dart';
import '../../core/dependencies/locator.dart';
import '../../data/models/conversation_model.dart';
import '../../stores/home/home_store.dart';
import '../global/lottie_loader.dart';
import '../../core/extensions/context_ext.dart';

class ConversationsList extends StatelessWidget {
  final Function(Conversation) onConversationTap;
  final ScrollController controller;

  const ConversationsList(
      {Key key, @required this.onConversationTap, this.controller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final store = sl<HomeStore>();
    return Observer(
      builder: (_) => Positioned(
        top: context.heightPlusStatusbarPerc(.12),
        child: Container(
          height: context.heightPx - context.heightPlusStatusbarPerc(.11),
          width: context.widthPx,
          child: store.isLoading && store.conversations.length == 0
              ? Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80.0),
                    child: LottieLoader(),
                  ))
              : ListView.builder(
                  controller: controller,
                  itemCount: store.conversations.length,
                  padding: EdgeInsets.only(
                      bottom: context.heightPlusStatusbarPerc(.2),
                      top: context.heightPlusStatusbarPerc(.07)),
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final conversation = store.conversations[index];
                    return GestureDetector(
                      onTap: () {
                        store.resetCount(index);
                        onConversationTap(conversation);
                      },
                      child: ConversationTile(model: conversation),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
