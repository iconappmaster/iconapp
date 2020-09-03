import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/widgets/chat/chat_list.dart';
import 'package:iconapp/widgets/chat/chat_welcome_dialog.dart';
import 'package:iconapp/widgets/global/focus_aware.dart';
import '../core/dependencies/locator.dart';
import '../core/theme.dart';
import '../data/models/conversation_model.dart';
import '../stores/chat/chat_state.dart';
import '../stores/chat/chat_store.dart';
import '../stores/socket/socket_manager.dart';
import '../stores/story/story_store.dart';
import '../widgets/chat/panel_subscribe.dart';
import '../widgets/chat/panel_compose.dart';
import '../widgets/chat/settings/change_background.dart';
import '../widgets/global/blue_divider.dart';
import '../widgets/home/stories_widget.dart';
import '../widgets/chat/chat_appbar.dart';
import '../core/extensions/context_ext.dart';

class ChatScreen extends StatefulWidget {
  final Conversation conversation;

  const ChatScreen({Key key, @required this.conversation}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ScrollController _controller;
  bool upDirection = false, flag = true;
  ChatStore chat;

  @override
  void initState() {
    initSocket();

    chat = sl<ChatStore>();

    chat
      ..init(widget.conversation)
      ..watchMessages()
      ..watchAddLike()
      ..watchRemoveLike();

    sl<StoryStore>()..setMode(StoryMode.conversation);

    _controller = ScrollController()
      ..addListener(() {
        upDirection =
            _controller.position.userScrollDirection == ScrollDirection.forward;
        if (upDirection != flag && mounted) {
          setState(() {});
        }
        flag = upDirection;
      });

    super.initState();
  }

  Future initSocket() async {
    final socket = sl<Socket>();

    await socket.subscribeChannel(widget.conversation.id);

    socket
      ..bindMessagesChannel()
      ..bindAddLikeChannel()
      ..bindRemoveLikeChannel();
  }

  @override
  Widget build(BuildContext context) {
    final story = sl<StoryStore>();

    return Observer(builder: (_) {
      return FocusAwareWidget(
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient:
                      gradientList[chat?.conversation?.backgroundColor ?? 0],
                ),
                child: Column(
                  children: <Widget>[
                    ChatAppbar(),
                    BlueDivider(color: cornflower),
                    ChatList(scrollController: _controller),
                    initComposer(chat, _controller),
                  ],
                ),
              ),
              Positioned(
                top: context.heightPlusStatusbarPerc(.116),
                child: StoriesList(
                    margin: EdgeInsets.only(top: 10),
                    mode: story.mode,
                    show: !upDirection),
              ),
              _showWelcomeDialog(chat.conversation.name),
            ],
          ),
        ),
      );
    });
  }

  Widget _showWelcomeDialog(String conversationName) {
    return Observer(builder: (_) {
      return Visibility(
        visible: chat.showWelcomeDialog,
        child: ChatWelcomeDialog(groupName: conversationName),
      );
    });
  }

  Widget initComposer(ChatStore store, ScrollController controller) {
    return Observer(builder: (_) {
      switch (store.composerMode) {
        case ComposerMode.viewer:
          return Container();
        case ComposerMode.icon:
          return PanelMessageCompose(controller: controller);
        case ComposerMode.subscriber:
          return PanelSubscriber();
      }
      return Container();
    });
  }

  @override
  void dispose() {
    sl<ChatStore>().dispose();
    sl<Socket>().unsubscribeChannel(widget.conversation.id);
    super.dispose();
  }
}
