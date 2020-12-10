import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/stores/comments/comments_store.dart';
import 'package:iconapp/widgets/comments/comments_bottom_sheet.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'chat_welcome_dialog.dart';

Future showCommentsDialog(BuildContext context) {
  final comments = sl<CommentsStore>();

  comments
    ..setCommentsViewed()
    ..setCommentsBadge(false);

  return showMaterialModalBottomSheet(
    backgroundColor: Colors.transparent,
    duration: const Duration(milliseconds: 300),
    context: context,
    isDismissible: true,
    builder: (context, scrollController) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: CommentsBottomSheet(scrollController: scrollController)),
  );
}

Widget showWelcomeDialog(String conversationName) {
  final chat = sl<ChatStore>();
  return Observer(builder: (_) {
    return Visibility(
      visible: chat.showWelcomeDialog,
      child: ChatWelcomeDialog(groupName: conversationName),
    );
  });
}
