import 'package:flutter/material.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/stores/comments/comments_store.dart';
import 'package:iconapp/widgets/chat/message_text.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class CommentsList extends StatelessWidget {
  final ScrollController controller;

  const CommentsList({
    Key key,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = sl<CommentsStore>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: CustomText('תגובות', style: loginBigText),
        ),
        Expanded(
          child: store.comments.isEmpty
              ? Center(
                  child: CustomText(
                  'אין עדיין תגובות',
                  style: dialogContent,
                ))
              : ListView.builder(
                  reverse: true,
                  controller: controller,
                  itemCount: store.comments.length,
                  itemBuilder: (context, index) {
                    final comment = store.comments[index];
                    return TextMessage(
                        isSwipeEnabled: false,
                        hideAvatar: true,
                        hideEmoji: true,
                        forcedColor: cornflower,
                        showPin: false,
                        controller: AutoScrollController(),
                        message: comment,
                        index: index,
                        isMe: false);
                  },
                ),
        ),
      ],
    );
  }
}
