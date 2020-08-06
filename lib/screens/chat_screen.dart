import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/stores/chat/chat_state.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/widgets/chat/message_composer.dart';
import 'package:iconapp/widgets/chat/messages.dart';
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
  ScrollController _controller = ScrollController();

  @override
  void initState() {
    final store = sl<ChatStore>();
    store.initConversation(widget.conversation);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final store = sl<ChatStore>();

    final storiesMargin = const EdgeInsets.only(top: 24.0);
    return Scaffold(
      body: Observer(
        builder: (_) => Stack(children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [grape, darkIndigo],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter)),
            child: Column(
              children: <Widget>[
                ChatAppbar(),
                BlueDivider(color: cornflower),
                StoriesWidget(margin: storiesMargin),
                ChatList(scrollController: _controller),
                _buildComposer(store.getComposerMode),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildComposer(ComposerMode mode) {
    switch (mode) {
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
                style: chatCompose.copyWith(color: cornflower),
                recognizer: TapGestureRecognizer()..onTap = () => print('a')),
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
        onPressed: () => store.subscribeConversation(),
      )),
    );
  }
}

final chatListKey = GlobalKey<AnimatedListState>();

class ChatList extends StatelessWidget {
  final ScrollController scrollController;

  const ChatList({Key key, @required this.scrollController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final store = sl<ChatStore>();
    return Observer(
      builder: (_) => Expanded(
        child: AnimatedList(
          key: chatListKey,
          controller: scrollController,
          physics: BouncingScrollPhysics(),
          reverse: true,
          shrinkWrap: true,
          initialItemCount: store.getMessages.length,
          itemBuilder: (context, index, animation) {
            final message = store.getMessages[index];

            switch (message.type) {
              case MessageType.text:
                return TextMessage(message: message, animation: animation);
              case MessageType.photo:
                return PhotoMessage(message: message, animation: animation);
              case MessageType.video:
                return Container();
              case MessageType.voice:
                return Container();
              case MessageType.system:
                return Container();
              case MessageType.replay:
                return Container();
            }

            return null;
          },
        ),
      ),
    );
  }
}
