import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../widgets/chat/chat_list.dart';
import '../widgets/chat/chat_welcome_dialog.dart';
import '../widgets/global/focus_aware.dart';
import '../core/dependencies/locator.dart';
import '../core/theme.dart';
import '../data/models/conversation_model.dart';
import '../stores/chat/chat_state.dart';
import '../stores/chat/chat_store.dart';
import '../stores/socket/socket_manager.dart';
import '../stores/story/story_store.dart';
import '../widgets/chat/panel_subscribe.dart';
import '../widgets/chat/compose/panel_compose.dart';
import '../widgets/chat/settings/change_background.dart';
import '../widgets/global/blue_divider.dart';
import '../widgets/story/story_list.dart';
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
  bool _upDirection = false, _flag = true;

  ChatStore _chat;
  StoryStore _story;
  Socket _socket;

  @override
  void initState() {

    initSocket();

    _chat = sl<ChatStore>();
    _story = sl<StoryStore>();
    _socket = sl<Socket>();

    _chat
      ..init(widget.conversation)
      ..watchMessages()
      ..watchAddLike()
      ..watchRemoveLike();

    _story.setStoryMode(StoryMode.conversation);

    _controller = ScrollController()
      ..addListener(() {
        _upDirection =
            _controller.position.userScrollDirection == ScrollDirection.forward;
        if (_upDirection != _flag && mounted) {
          setState(() {});
        }
        _flag = _upDirection;
      });

    super.initState();
  }

  Future initSocket() async {
    _socket = sl<Socket>();
    await _socket.subscribeChannel(widget.conversation.id.toString());

    _socket
      ..bindMessagesEvent()
      ..bindAddLikeEvent()
      ..bindRemoveLikeEvent();
  }

  @override
  Widget build(BuildContext context) {
    return FocusAwareWidget(
      child: Scaffold(
        body: Stack(
          children: [
            Observer(builder: (_) {
              return Container(
                decoration: BoxDecoration(
                    gradient: gradientList[
                        _chat?.conversation?.backgroundColor ?? 0]),
                child: Column(
                  children: <Widget>[
                    ChatAppbar(),
                    BlueDivider(color: cornflower),
                    ChatList(scrollController: _controller),
                    initComposer(_controller),
                  ],
                ),
              );
            }),
            Positioned(
                top: context.heightPlusStatusbarPerc(.07),
                child: StoriesList(mode: _story.mode, show: !_upDirection)),
            _showWelcomeDialog(_chat.conversation?.name ?? ''),
          ],
        ),
      ),
    );
  }

  Widget _showWelcomeDialog(String conversationName) {
    return Observer(builder: (_) {
      return Visibility(
        visible: _chat.showWelcomeDialog,
        child: ChatWelcomeDialog(groupName: conversationName),
      );
    });
  }

  Widget initComposer(ScrollController controller) {
    return Observer(builder: (_) {
      switch (_chat.composerMode) {
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
    _chat.dispose();
    _socket.unsubscribeChannel(widget.conversation.id);
    super.dispose();
  }
}
