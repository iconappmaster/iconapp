import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/stores/analytics/analytics_consts.dart';
import 'package:iconapp/stores/analytics/analytics_firebase.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/stores/language/language_store.dart';
import 'package:iconapp/widgets/comments/comments_fab.dart';
import '../../core/extensions/context_ext.dart';
import 'package:easy_localization/easy_localization.dart';

import 'chat_dialogs.dart';

class ChatFab extends StatelessWidget {
  const ChatFab({
    Key key,
    @required ChatStore chat,
  })  : _chat = chat,
        super(key: key);

  final ChatStore _chat;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Visibility(
        visible:
            _chat.dataReady && _chat.conversation.userRole == UserRole.viewer,
        child: Positioned(
            bottom: 35,
            left: language.isLTR ? null : 16,
            right: language.isLTR ? 16 : null,
            child: CommentsFab(
              onTap: () {
                if (_chat.conversation.areCommentsActivated &&
                    _chat.conversation.isSubscribed) {
                  analytics.sendConversationEvent(
                      OPENED_COMMENTS_FOR_CONVERSATION, _chat.conversation.id);
                  showCommentsDialog(context);
                } else {
                  if (!_chat.conversation.isSubscribed) {
                    context.showFlushbar(
                        message: LocaleKeys.chat_joinGroupShowComments.tr());
                  } else {
                    context.showFlushbar(
                        message: LocaleKeys.comments_closed.tr());
                  }
                }
              },
            )),
      ),
    );
  }
}
