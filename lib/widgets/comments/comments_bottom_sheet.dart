import 'package:flutter/material.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/stores/comments/comments_store.dart';
import 'package:iconapp/widgets/chat/compose/panel_compose.dart';
import 'package:iconapp/widgets/chat/message_text.dart';
import 'package:iconapp/widgets/global/lottie_loader.dart';

class CommentsBottomSheet extends StatelessWidget {
  final ScrollController chatController;
  final ScrollController scrollController;

  const CommentsBottomSheet({
    Key key,
    @required this.chatController,
    @required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = sl<CommentsStore>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: store.loading
              ? Center(child: LottieLoader())
              : ListView.builder(
                  reverse: true,
                  controller: scrollController,
                  shrinkWrap: true,
                  itemCount: store.comments.length,
                  itemBuilder: (context, index) {
                    final comment = store.comments[index];
                    return TextMessage(
                      showPin: false,
                      controller: chatController,
                      message: comment,
                      index: index,
                      isMe: false,
                    );
                  },
                ),
        ),
        Material(
          child: PanelMessageCompose(
            composerMode: ComposerPanelMode.comments,
            controller: chatController,
          ),
        ),
      ],
    );
  }
}
