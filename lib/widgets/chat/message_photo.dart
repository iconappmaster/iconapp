import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:vibration/vibration.dart';
import '../../core/bus.dart';
import '../../core/dependencies/locator.dart';
import '../../core/theme.dart';
import '../../data/models/message_model.dart';
import '../../data/models/user_model.dart';
import '../../data/repositories/media_repository.dart';
import '../../routes/router.gr.dart';
import '../../stores/chat/chat_store.dart';
import 'chat_list.dart';
import 'reply_slider.dart';
import '../global/custom_text.dart';
import '../global/slidable/slidable.dart';
import '../../core/extensions/int_ext.dart';
import 'icon_bubble.dart';

class PhotoMessage extends StatefulWidget {
  final MessageModel message;
  final bool isMe;
  final int index;
  final AutoScrollController controller;

  const PhotoMessage({
    Key key,
    @required this.message,
    @required this.isMe,
    @required this.index,
    @required this.controller,
  }) : super(key: key);

  @override
  _PhotoMessageState createState() => _PhotoMessageState();
}

class _PhotoMessageState extends State<PhotoMessage> {
  SlidableController _controller;
  BuildContext _sliderContext;
  bool _isOpen = false;
  double _progress = 0.0;
  StreamSubscription<ProgressEvent> progressSubscription;

  @override
  void initState() {
    progressSubscription = sl<Bus>().on<ProgressEvent>().listen((event) {
      if (event.id != null && event.id == widget.message.id) {
        if (mounted) setState(() => _progress = event.progress);
      }
    });
    _initSlidable();
    super.initState();
  }

  void _initSlidable() {
    _controller = SlidableController(
      onSlideAnimationChanged: (s) => print(s), // do not remove
      onSlideIsOpenChanged: (isOpen) {
        if (mounted) {
          setState(() async {
            await Vibration.vibrate(duration: 150);
            _isOpen = isOpen;
            sl<ChatStore>().setReplyMessage(widget.message);
            final slide = Slidable.of(_sliderContext);
            Future.delayed(Duration(milliseconds: 250), () => slide.close());
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final store = sl<ChatStore>();

    return ScrollableTile(
      index: widget.index,
      controller: widget.controller,
      child: Replyble(
        isEnabled: store.conversation.userRole != UserRole.viewer,
        isOpen: _isOpen,
        keyName: widget.message.id.toString(),
        controller: _controller,
        builder: (context, index, animation, step) {
          _sliderContext = context;
          return ReplyButton(message: widget.message);
        },
        child: Container(
          child: Opacity(
            opacity: widget.message.status == MessageStatus.pending ? .8 : 1,
            child: Stack(
              children: [
                IconBubble(
                  isMe: widget.isMe,
                  message: widget.message,
                  onTap: () => store.conversationPhotos.length > 1
                      ? ExtendedNavigator.of(context).pushPhotoGalleryScreen(
                          galleryItems: store.conversationPhotos,
                          intialIndex: store.conversationPhotos
                              .indexWhere((m) => m.id == widget.message.id))
                      : ExtendedNavigator.of(context)
                          .pushSingleImage(url: widget.message.body),
                  child: Stack(children: [
                    Hero(
                      tag: widget.index,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          widget.message.body.startsWith('http')
                              ? SizedBox(
                                  height: 230,
                                  width:
                                      MediaQuery.of(context).size.width * .75,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(4.2),
                                    child: CachedNetworkImage(
                                      fadeInCurve: Curves.linear,
                                      fit: BoxFit.cover,
                                      progressIndicatorBuilder:
                                          (context, url, data) {
                                        return Center(
                                          child: SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 1,
                                              value: data.progress,
                                              valueColor:
                                                  AlwaysStoppedAnimation(
                                                      cornflower),
                                            ),
                                          ),
                                        );
                                      },
                                      imageUrl: widget.message.body,
                                      fadeOutDuration:
                                          const Duration(milliseconds: 250),
                                    ),
                                  ),
                                )
                              : SizedBox(
                                  height: 200,
                                  width: 250,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4.2),
                                      child: Image.file(
                                          File(widget.message.body),
                                          fit: BoxFit.cover))),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 5,
                      bottom: 5,
                      child: CustomText(
                        widget.message.status == MessageStatus.pending
                            ? ''
                            : widget.message?.timestamp?.humanReadableTime() ??
                                '',
                        style: chatMessageBody.copyWith(fontSize: 9),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Positioned(
                      right: 5,
                      bottom: 5,
                      child: CustomText(widget.message.sender?.fullName ?? '',
                          style: chatMessageName, textAlign: TextAlign.start),
                    ),
                  ]),
                ),
                if (widget.message.status == MessageStatus.pending)
                  Positioned(
                    left: 110,
                    top: 80,
                    child: Container(
                      height: 60,
                      width: 60,
                      child: Stack(fit: StackFit.loose, children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: cornflower.withOpacity(.3)),
                          ),
                        ),
                        Center(
                          child: CircularProgressIndicator(
                            value: _progress,
                            strokeWidth: 4,
                            backgroundColor: white,
                            valueColor: AlwaysStoppedAnimation(white),
                          ),
                        ),
                      ]),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    progressSubscription?.cancel();
    super.dispose();
  }
}
