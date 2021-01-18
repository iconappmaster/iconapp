import 'dart:async';
import 'dart:ui';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconapp/core/ads/admob/admob.dart';
import 'package:iconapp/core/video/caching_player.dart';
import 'package:iconapp/core/video/feed_player/multi_manager/flick_multi_manager.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import '../../core/bus.dart';
import '../../core/dependencies/locator.dart';
import '../../core/theme.dart';
import '../../data/models/message_model.dart';
import '../../data/models/user_model.dart';
import '../../data/repositories/media_repository.dart';
import '../../stores/chat/chat_store.dart';
import '../global/custom_text.dart';
import '../global/slidable/slidable.dart';
import '../global/slidable_widget.dart';
import 'reply_slider.dart';
import 'chat_list.dart';
import 'icon_bubble.dart';

class VideoMessage extends StatefulWidget {
  final MessageModel message;
  final bool isMe;
  final int index;
  final AutoScrollController controller;
  final FlickMultiManager videoManager;

  const VideoMessage({
    Key key,
    @required this.message,
    @required this.isMe,
    @required this.index,
    @required this.controller,
    @required this.videoManager,
  }) : super(key: key);

  @override
  _VideoMessageState createState() => _VideoMessageState();
}

class _VideoMessageState extends SlidableStateWidget<VideoMessage> {
  SlidableController _controller;
  BuildContext _sliderContext;
  bool _isOpen = false;
  double _progress = 0.0;
  StreamSubscription<ProgressEvent> progressSubscription;

  @override
  void initState() {
    super.init();
    _initSlidable();
    super.initState();
  }

  void _initSlidable() {
    progressSubscription = sl<Bus>().on<ProgressEvent>().listen((event) {
      if (event.id != null && event.id == widget.message.id) {
        if (mounted)
          setState(
            () => _progress = event.progress,
          );
      }
    });
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
    final ads = sl<AdMob>();
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
        child: Stack(alignment: Alignment.center, children: [
          IconBubble(
            isMe: widget.isMe,
            message: widget.message,
            onTap: () async {
              store.viewedVideo(widget.message.id);
              await ads.showWithCounterInterstitial();

              if (store.conversationVideos.length > 1) {
                ExtendedNavigator.of(context).pushFeedPlayer(
                    media: store.conversationVideos,
                    index: store.conversationVideos.indexWhere((m) => m.id == widget.message.id));
              } else {
                ExtendedNavigator.of(context).pushDefaultVideoPlayer(url: widget.message?.body ?? '');
              }
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width * .5,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(4.2),
                        child: CachedVideoPlayer(message: widget.message, manager: widget.videoManager))),
                Positioned(
                    right: 5,
                    bottom: 5,
                    child: CustomText(widget.message.sender?.fullName ?? '',
                        style: chatMessageBody.copyWith(fontSize: 12), textAlign: TextAlign.start)),
                if (widget.message?.viewCount != null)
                  Positioned(right: 5, top: 5, child: VideoSeenCounter(counter: widget.message?.viewCount)),
              ],
            ),
          ),
          Visibility(
            visible: widget.message.status == MessageStatus.pending,
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(
                  value: _progress,
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(cornflower),
                  backgroundColor: white),
            ),
          ),
          Visibility(
            visible: widget.message.status == MessageStatus.compressing,
            child: Positioned(
              left: 122,
              top: 91,
              child: SizedBox(
                height: 55,
                width: 55,
                child: CircularProgressIndicator(
                  strokeWidth: 6,
                  valueColor: AlwaysStoppedAnimation<Color>(cornflower),
                  backgroundColor: white,
                ),
              ),
            ),
          ),
          Visibility(
            visible: widget.message.status == MessageStatus.compressing,
            child: Positioned(
              left: 100,
              top: 175,
              child: CustomText(
                'Compressing',
                style: flushbar,
              ),
            ),
          )
        ]),
      ),
    );
  }
}

class VideoSeenCounter extends StatelessWidget {
  final int counter;

  const VideoSeenCounter({Key key, @required this.counter}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 1),
            child: Row(
              children: [
                Icon(Icons.remove_red_eye, color: white),
                SizedBox(width: 3),
                CustomText(counter.toString(), style: loginSmallText)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
