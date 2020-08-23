import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/stores/chat/chat_state.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/stores/story/story_store.dart';
import 'package:iconapp/widgets/chat/message_composer.dart';
import 'package:iconapp/widgets/chat/messages.dart';
import 'package:iconapp/widgets/chat/settings/change_background.dart';
import 'package:iconapp/widgets/global/blue_divider.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/home/stories_widget.dart';
import '../widgets/chat/chat_appbar.dart';

class ChatScreen extends StatefulWidget {
  final Conversation conversation;

  const ChatScreen({Key key, @required this.conversation}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ScrollController _controller;
  bool upDirection = true, flag = true;

  @override
  void initState() {
    sl<ChatStore>()..init(widget.conversation);
    sl<StoryStore>()..setMode(StoryMode.conversation);
    _controller = ScrollController()
      ..addListener(() {
        upDirection =
            _controller.position.userScrollDirection == ScrollDirection.forward;
        if (upDirection != flag) setState(() {});
        flag = upDirection;
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final chat = sl<ChatStore>();
    final story = sl<StoryStore>();

    return Observer(builder: (_) {
      return Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient:
                      gradientList[chat.conversation.backgroundColor ?? 0]),
              child: Column(
                children: <Widget>[
                  ChatAppbar(),
                  BlueDivider(color: cornflower),
                  StoriesList(
                    margin: EdgeInsets.only(top: 10),
                    mode: story.mode,
                    show: upDirection,
                  ),
                  ChatList(scrollController: _controller),
                  initComposer(chat, _controller),
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  Widget initComposer(ChatStore store, ScrollController controller) {
    return Observer(builder: (_) {
      switch (store.composerMode) {
        case ComposerMode.viewer:
          return ViewerSheet();
        case ComposerMode.icon:
          return MessageComposer(controller: controller);
        case ComposerMode.subscriber:
          return SubscriberSheet();
      }
      return Container();
    });
  }

  @override
  void dispose() {
    sl<ChatStore>().dispose();
    super.dispose();
  }
}

class ViewerSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      height: 58.7,
      child: Center(
        child: RichText(
          text: TextSpan(children: [
            TextSpan(text: 'רק ', style: chatCompose),
            TextSpan(
                text: 'מנהלי קבוצה ',
                style: chatCompose.copyWith(color: cornflower)),
            TextSpan(text: 'יכולים לשלוח הודעה', style: chatCompose),
          ]),
        ),
      ),
    );
  }
}

class SubscriberSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = sl<ChatStore>();
    return Container(
      color: white,
      height: 58.7,
      child: Stack(alignment: Alignment.center, children: [
        if (store.getState.loading)
          Positioned(
            left: 16,
            child: CircularProgressIndicator(
              strokeWidth: 1,
            ),
          ),
        Center(
            child: FlatButton(
          child: HebrewText('הצטרפות לקבוצה',
              style: chatCompose.copyWith(color: cornflower)),
          onPressed: () => store.subscribe(), // TEST THIS - SHOULD BE FIXED
        )),
      ]),
    );
  }
}

final chatListKey = GlobalKey<AnimatedListState>();

class ChatList extends StatefulWidget {
  final ScrollController scrollController;

  const ChatList({Key key, @required this.scrollController}) : super(key: key);

  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    final store = sl<ChatStore>();

    return Observer(
      builder: (_) => Expanded(
        child: ListView.builder(
          key: chatListKey,
          controller: widget.scrollController,
          physics: BouncingScrollPhysics(),
          reverse: true,
          shrinkWrap: true,
          padding: EdgeInsets.only(bottom: 12),
          itemCount: store.getMessages.length,
          itemBuilder: (_, index) {
            final message = store?.getMessages[index];
            final isMe = store.isMe(message.sender?.id);

            switch (message.messageType) {
              case MessageType.text:
                return TextMessage(message: message, isMe: isMe);
              case MessageType.photo:
                return PhotoMessage(message: message, isMe: isMe);
              case MessageType.video:
                return VideoMessage(message: message, isMe: isMe);
              case MessageType.voice:
                return VoiceMessage(message: message, isMe: isMe);
              case MessageType.system:
                return SystemMessage(title: message.body);
            }

            return Container();
          },
        ),
      ),
    );
  }
}
