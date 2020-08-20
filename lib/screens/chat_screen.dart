import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/stores/chat/chat_state.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/stores/chat_settings/chat_settings_store.dart';
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
    sl<ChatStore>()
      ..initConversation(widget.conversation)
      ..determineComposerMode()
      ..fetchMessagesAndSubscribe()
      ..setConversationViewed();

    // update the mode for the story widget
    sl<StoryStore>()..setMode(StoryMode.conversation);

    // init the settings of the chat store
    sl<ChatSettingsStore>()..init();

    _controller = ScrollController()
      ..addListener(() {
        upDirection =
            _controller.position.userScrollDirection == ScrollDirection.forward;

        // makes sure we don't call setState too much, but only when it is needed
        if (upDirection != flag) setState(() {});

        flag = upDirection;
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final chat = sl<ChatStore>();
    final story = sl<StoryStore>();
    final storiesMargin = const EdgeInsets.only(top: 24.0);

    return Scaffold(
      body: Observer(
        builder: (_) => Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: gradientList[chat?.backgroundColor ?? 0]),
              child: Column(
                children: <Widget>[
                  ChatAppbar(),
                  BlueDivider(color: cornflower),
                  StoriesList(
                      margin: storiesMargin,
                      mode: story.mode,
                      show: upDirection),
                  ChatList(scrollController: _controller),
                  _buildComposer(chat),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildComposer(ChatStore chat) {
    switch (chat.getComposerMode) {
      case ComposerMode.viewer:
        return ViewerSheet();
      case ComposerMode.icon:
        return MessageComposer(scrollController: _controller);
      case ComposerMode.showSubscribe:
        return SubscriberSheet();
    }
    return Container();
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
      child: Center(
          child: FlatButton(
        child: HebrewText('הצטרפות לקבוצה',
            style: chatCompose.copyWith(color: cornflower)),
        onPressed: () => store.fetchMessagesAndSubscribe(),
      )),
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
  void initState() {
    sl<ChatStore>().initMessages();
    super.initState();
  }

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

            switch (message.type) {
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
