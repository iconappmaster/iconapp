import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iconapp/core/bus.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/data/models/photo_model.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/data/repositories/media_repository.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/widgets/chat/reply_slider.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/global/like_menu/likes_menu.dart';
import 'package:iconapp/widgets/global/network_photo.dart';
import 'package:iconapp/widgets/global/slidable/slidable.dart';

import '../../core/extensions/int_ext.dart';
import 'icon_bubble.dart';

class PhotoMessage extends StatefulWidget {
  final MessageModel message;
  final bool isMe;
  final int index;

  const PhotoMessage({
    Key key,
    @required this.message,
    @required this.isMe,
    @required this.index,
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
          setState(() {
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
    
    final photos = store.conversation.messages
        .where((photo) => photo.messageType == MessageType.photo)
        .map((photo) => PhotoModel(id: photo.id, url: photo.body))
        .toList();
    
    return Likeble(
      isMe: widget.isMe,
      message: widget.message,
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
                  onTap: () => ExtendedNavigator.of(context).pushNamed(
                    Routes.fullPhotoScreen,
                    arguments: FullPhotoScreenArguments(
                        galleryItems: photos,
                        intialIndex: photos.indexWhere(
                          (photo) => photo.id == widget.message.id,
                        )),
                  ),
                  child: Stack(children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        widget.message.body.startsWith('http')
                            ? SizedBox(
                                height: 200,
                                width: 240,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(4.2),
                                    child:
                                        NetworkPhoto(url: widget.message.body)))
                            : SizedBox(
                                height: 200,
                                width: 200,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(4.2),
                                    child: Image.file(File(widget.message.body),
                                        fit: BoxFit.cover))),
                      ],
                    ),
                    Positioned(
                      left: 5,
                      bottom: 5,
                      child: HebrewText(
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
                      child: HebrewText(widget.message.sender?.fullName ?? '',
                          style: chatMessageName, textAlign: TextAlign.start),
                    ),
                  ]),
                ),
                if (widget.message.status == MessageStatus.pending)
                  Positioned(
                    left: 100,
                    top: 80,
                    child: CircularProgressIndicator(
                      value: _progress,
                      strokeWidth: 2,
                      backgroundColor: white,
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
