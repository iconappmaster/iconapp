import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/screens/onboarding_phone.dart';
import 'package:iconapp/widgets/chat/message_composer.dart';
import 'package:iconapp/widgets/home/stories_widget.dart';
import '../widgets/chat/chat_appbar.dart';

class ChatScreen extends StatelessWidget {
  final ConversationModel conversation;

  const ChatScreen({Key key, this.conversation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [grape, darkIndigo],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        )),
        child: Column(
          children: <Widget>[
            ChatAppBar(),
            BlueDivider(color: cornflower),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: StoriesWidget()),
            ChatList(),
            MessageComposer(),
          ],
        ),
      ),
    );
  }
}


class ChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container());
  }
}
