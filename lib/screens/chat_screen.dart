import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/widgets/chat/message_composer.dart';
import 'package:iconapp/widgets/global/blue_divider.dart';
import 'package:iconapp/widgets/home/stories_widget.dart';
import '../widgets/chat/chat_appbar.dart';

class ChatScreen extends StatelessWidget {
  final ConversationModel conversation;

  const ChatScreen({Key key, this.conversation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = sl<ChatStore>();
    final storiesMargin = const EdgeInsets.symmetric(vertical: 24.0);
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
                ChatAppbar(
                  title: 'האח הגדול',
                  subtitle: '12,000 משתתפים',
                ),
                BlueDivider(color: cornflower),
                StoriesWidget(margin: storiesMargin),
                ChatList(),
                store.showMessageComposer
                    ? MessageComposer()
                    : ComposerViewOnly()
              ],
            ),
          ),
        ]),
      ),
    );
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

class ChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container());
  }
}
