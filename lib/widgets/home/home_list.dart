import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/stores/story/story_store.dart';
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
    final home = sl<HomeStore>();
    final story = sl<StoryStore>();

    final addPadding = story.isUserIcon || story.stories.isNotEmpty;

    return Observer(
      builder: (_) => Expanded(
          child: Container(
        height: context.heightPx,
        width: context.widthPx,
        child: home.isLoading && home.conversations.length == 0
            ? Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 80.0),
                  child: LottieLoader(),
                ))
            : ListView.builder(
                controller: controller,
                itemCount: home.conversations.length,
                padding: EdgeInsets.only(
                  bottom: context.heightPlusStatusbarPerc(.2),
                  top: addPadding ? context.heightPlusStatusbarPerc(.1) : 0,
                ),
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final conversation = home.conversations[index];
                  return ConversationTile(model: conversation, onTap: () {
                    home.resetCount(index);
                    onConversationTap(conversation);
                  },);
                },
              ),
      )),
    );
  }
}
