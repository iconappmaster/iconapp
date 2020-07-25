
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/theme.dart';

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
              ComposeActionButton(),
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
   
    return Row(
      children: <Widget>[
        _buildActionButton('assets/images/microphone.svg', (){}),
        _buildActionButton('assets/images/photo.svg', (){}),
        _buildActionButton('assets/images/camera.svg', (){}),
         
      ],
    );
  }
  Widget _buildActionButton(String asset, Function onTap) {
    final size = 25.7;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.7),
      child: InkWell(
          onTap: onTap,
              child: SvgPicture.asset(asset,
                    height: size, width: size),
      ),
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
            height: 15.3,
            width: 15.3,
          ),
        ),
      ),
    );
  }
}
