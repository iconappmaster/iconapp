import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/stores/comments/comments_store.dart';
import 'package:iconapp/widgets/chat/message_text.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
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
              : Observer(
                  builder: (_) => ListView.builder(
                    padding: EdgeInsets.only(bottom: 8, right: 2),
                    physics: BouncingScrollPhysics(),
                    reverse: true,
                    controller: controller,
                    itemCount: store.comments.length,
                    itemBuilder: (context, index) => TextMessage(
                      isSwipeEnabled: false,
                      hideAvatar: true,
                      hideEmoji: true,
                      forcedColor: cornflower,
                      showPin: false,
                      controller: AutoScrollController(),
                      message: store.comments[index],
                      index: index,
                      isMe: false,
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
