import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:iconapp/stores/language/language_store.dart';
import 'package:iconapp/widgets/global/auto_direction.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import '../../core/bus.dart';
import '../../core/dependencies/locator.dart';
import '../../core/theme.dart';
import '../../data/models/message_model.dart';
import '../../data/models/user_model.dart';
import '../../data/repositories/media_repository.dart';
import '../../routes/router.gr.dart';
import '../../stores/chat/chat_store.dart';
import 'chat_list.dart';
import 'message_text.dart';
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
            HapticFeedback.lightImpact();
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
                  child: Stack(
                    children: [
                      Hero(
                        tag: widget.index,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            widget.message.body.startsWith('http')
                                ? GestureDetector(
                                    onTap: () => _onPhotoTap(store, context),
                                    child: SizedBox(
                                      height: 230,
                                      width: MediaQuery.of(context).size.width * .75,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(4.2),
                                        child: CachedNetworkImage(
                                          fadeInCurve: Curves.linear,
                                          fit: BoxFit.cover,
                                          progressIndicatorBuilder: (context, url, data) {
                                            return Center(
                                              child: SizedBox(
                                                height: 20,
                                                width: 20,
                                                child: CircularProgressIndicator(
                                                  strokeWidth: 1,
                                                  value: data.progress,
                                                  valueColor: AlwaysStoppedAnimation(cornflower),
                                                ),
                                              ),
                                            );
                                          },
                                          imageUrl: widget.message.body,
                                          fadeOutDuration: const Duration(milliseconds: 250),
                                        ),
                                      ),
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: () => _onPhotoTap(store, context),
                                    child: SizedBox(
                                      height: 200,
                                      width: 250,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(4.2),
                                        child: Image.file(
                                          File(widget.message.body),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                            if (widget.message?.messageDescription != null)
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .7,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: AutoDirection(
                                    text: widget.message?.messageDescription ?? '',
                                    child: Linkify(
                                      linkStyle: TextStyle(color: Colors.blue),
                                      text: widget.message?.messageDescription ?? '',
                                      style: chatMessageBody,
                                      onOpen: openUrl,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 5,
                        bottom: 5,
                        child: CustomText(
                            widget.message.status == MessageStatus.pending
                                ? ''
                                : widget.message?.timestamp?.humanReadableTime() ?? '',
                            style: chatMessageBody.copyWith(fontSize: 9),
                            textAlign: TextAlign.start),
                      ),
                      Positioned(
                        right: 5,
                        top: 5,
                        child: CustomText(widget.message.sender?.fullName ?? '',
                            style: chatMessageName, textAlign: TextAlign.start),
                      ),
                    ],
                  ),
                ),
                if (widget.message.status == MessageStatus.pending)
                  Positioned(
                    left: language.isLTR ? null : 130,
                    right: language.isLTR ? 130 : null,
                    top: 80,
                    child: SizedBox(
                      height: 80,
                      width: 80,
                      child: CircularProgressIndicator(
                        strokeWidth: 8.0,
                        backgroundColor: white,
                        value: _progress,
                        valueColor: AlwaysStoppedAnimation(cornflower),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future _onPhotoTap(ChatStore store, BuildContext context) {
    return store.conversationPhotos.length > 1
        ? ExtendedNavigator.of(context).pushPhotoGalleryScreen(message: widget.message)
        : ExtendedNavigator.of(context).pushSingleImage(url: widget.message.body);
  }

  @override
  void dispose() {
    progressSubscription?.cancel();
    super.dispose();
  }
}
