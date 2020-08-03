import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/category_model.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/widgets/chat/message_composer.dart';
import 'package:iconapp/widgets/chat/messages.dart';
import 'package:iconapp/widgets/global/blue_divider.dart';
import 'package:iconapp/widgets/home/stories_widget.dart';
import '../widgets/chat/chat_appbar.dart';

class ChatScreen extends StatefulWidget {
  final CategoryModel conversation;

  const ChatScreen({Key key, this.conversation}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ScrollController _controller = ScrollController();
  @override
  void initState() {
    sl<ChatStore>().init(widget.conversation);
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
              end: Alignment.topCenter,
            )),
            child: Column(
              children: <Widget>[
                ChatAppbar(conversation: store.getState.conversation),
                BlueDivider(color: cornflower),
                StoriesWidget(margin: storiesMargin),
                ChatList(scrollController: _controller),
                store.showMessageComposer
                    ? MessageComposer(scrollController: _controller)
                    : ComposerViewOnly()
              ],
            ),
          ),
        ]),
      ),
    );
  }

  @override
  void dispose() {
    sl<ChatStore>().dispose();
    super.dispose();
  }
}

class ComposerViewOnly extends StatelessWidget {
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

    // HebrewText(text)\),
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
                break;
              case MessageType.video:
                break;
              case MessageType.voice:
                break;
              case MessageType.system:
                break;
              case MessageType.replay:
                break;
            }
          },
        ),
      ),
    );
  }
}
