import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/widgets/global/lottie_loader.dart';

import 'message_audio.dart';
import 'message_photo.dart';
import 'message_system.dart';
import 'message_text.dart';
import 'message_video.dart';

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
        child: store.getState.loading && store.getMessages.isEmpty
            ? LottieLoader()
            : ListView.builder(
                controller: widget.scrollController,
                physics: BouncingScrollPhysics(),
                reverse: true,
                shrinkWrap: true,
                padding: EdgeInsets.only(bottom: 12, top: 120),
                itemCount: store.getMessages.length,
                itemBuilder: (_, index) {
                  final message = store?.getMessages[index];
                  final isMe = store.isMe(message.sender?.id);

                  switch (message.messageType) {
                    case MessageType.text:
                      return TextMessage(
                          message: message, isMe: isMe, index: index);
                    case MessageType.photo:
                      return PhotoMessage(
                        message: message,
                        isMe: isMe,
                        index: index,
                      );
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
