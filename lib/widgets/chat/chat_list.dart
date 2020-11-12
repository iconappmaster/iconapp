import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/widgets/global/lottie_loader.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'message_audio.dart';
import 'message_photo.dart';
import 'message_system.dart';
import 'message_text.dart';
import 'message_video.dart';

class ChatList extends StatefulWidget {
  final AutoScrollController scrollController;

  const ChatList({
    Key key,
    @required this.scrollController,
  }) : super(key: key);

  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  ChatStore store;
  @override
  void initState() {
    store = sl<ChatStore>();

    widget.scrollController.addListener(
      () {
        final controller = widget.scrollController;
        if (controller.offset >= controller.position.maxScrollExtent &&
            !controller.position.outOfRange) {
          store.fetchMore();
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Expanded(
        child: store.getState.loading && store.getMessages.isEmpty
            ? LottieLoader()
            : Scroller(
                scrollController: widget.scrollController,
                child: ListView.builder(
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
                            controller: widget.scrollController,
                            message: message,
                            isMe: isMe,
                            index: index);

                      case MessageType.photo:
                        return PhotoMessage(
                          controller: widget.scrollController,
                          message: message,
                          isMe: isMe,
                          index: index,
                        );

                      case MessageType.photo:
                        return PhotoMessage(
                          controller: widget.scrollController,
                          message: message,
                          isMe: isMe,
                          index: index,
                        );

                      case MessageType.video:
                        return VideoMessage(
                          showAd: true,
                          controller: widget.scrollController,
                          index: index,
                          message: message,
                          isMe: isMe,
                        );
                      case MessageType.voice:
                        return VoiceMessage(
                            controller: widget.scrollController,
                            index: index,
                            message: message,
                            isMe: isMe);
                      case MessageType.system:
                        return SystemMessage(
                          title: message.body,
                        );
                      case MessageType.loading:
                        return Center(
                            child: SizedBox(
                          height: 25,
                          width: 25,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation(white),
                          ),
                        ));
                        break;
                    }
                    return Container();
                  },
                ),
              ),
      ),
    );
  }
}

class ScrollableTile extends StatelessWidget {
  final AutoScrollController controller;
  final int index;
  final Widget child;

  const ScrollableTile({
    Key key,
    this.index,
    this.controller,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: controller,
      index: index,
      child: child,
      highlightColor: cornflower,
    );
  }
}

class Scroller extends StatelessWidget {
  final Widget child;

  final ScrollController scrollController;

  const Scroller({
    Key key,
    @required this.child,
    @required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(highlightColor: cornflower),
        child: Scrollbar(
            isAlwaysShown: false, controller: scrollController, child: child));
  }
}
