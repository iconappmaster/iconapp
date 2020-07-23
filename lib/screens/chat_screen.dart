import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/screens/onboarding_phone.dart';
import 'package:iconapp/widgets/global/back_button.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/home/stories_widget.dart';
import '../core/extensions/context_ext.dart';

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

class ChatAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.heightPlusStatusbarPerc(.116),
      child: Padding(
        padding: const EdgeInsets.only(top: 34.0, right: 21.3),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ChatBackButton(),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  HebrewText('האח הגדול', style: loginBigText),
                  HebrewText('האח הגדול', style: fieldLabel),
                ],
              ),
            ),
            IconButton(icon: Icon(Icons.favorite), onPressed: () {}),
            IconButton(icon: Icon(Icons.favorite), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

class ChatBackButton extends StatelessWidget {
  const ChatBackButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Row(
        children: <Widget>[
          SvgPicture.asset('assets/images/back_arrow.svg',
              height: 16.3, width: 16.3),
          SizedBox(width: 5.3),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: white,
            ),
            height: 48,
            width: 48,
          )
        ],
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

class MessageComposer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 73.7),
      color: white,
      padding: EdgeInsets.only(
        top: 16,
        bottom: 16.3,
        left: 9.3,
        right: 9.3,
      ),
      child: Center(
        child: Container(
          constraints: BoxConstraints(minHeight: 41.3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.4),
            color: paleGrey,
          ),
          child: Row(
            children: <Widget>[
              EmojiButton(),
              ComposerInput(),
              SendButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class ComposerInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final transparentBorder =
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent));
    return Expanded(
      child: TextFormField(
        key: key,
        maxLines: null,
        decoration: InputDecoration(
            hintStyle: chatCompose,
            hintText: 'הקלד/י הודעה',
            focusedBorder: transparentBorder,
            enabledBorder: transparentBorder,
            border: transparentBorder),
        onChanged: (input) => print(input),
        style: chatCompose,
      ),
    );
  }
}

class EmojiButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: SvgPicture.asset(
        'assets/images/emoji.svg',
        height: 25.7,
        width: 25.7,
      ),
    );
  }
}

class ComposeActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = 25.7;
    return Row(
      children: <Widget>[
        IconButton(
          icon: SvgPicture.asset('assets/images/camera.svg',
              height: size, width: size),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset('assets/images/photo.svg',
              height: size, width: size),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset('assets/images/microphone.svg',
              height: size, width: size),
          onPressed: () {},
        ),
      ],
    );
  }
}

class SendButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2, right: 7.3),
      child: SizedBox(
        height: 37.7,
        width: 37.7,
        child: FloatingActionButton(
          elevation: 0,
          onPressed: () {},
          backgroundColor: cornflower,
          child: SvgPicture.asset(
            'assets/images/send_icon.svg',
            height: 20.7,
            width: 20.7,
          ),
        ),
      ),
    );
  }
}
