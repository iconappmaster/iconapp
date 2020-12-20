import 'package:flutter/material.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/widgets/chat/chat_list.dart';
import 'package:iconapp/widgets/chat/message_video.dart';
import 'package:iconapp/widgets/global/rounded_close.dart';
import 'package:iconapp/widgets/global/user_avatar.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../caching_player.dart';
import './multi_manager/flick_multi_manager.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class FeedPlayer extends StatefulWidget {
  final List<MessageModel> media;
  final int index;
  final bool showClose;

  const FeedPlayer({
    Key key,
    @required this.media,
    @required this.index,
    this.showClose = true,
  }) : super(key: key);

  @override
  _FeedPlayerState createState() => _FeedPlayerState();
}

class _FeedPlayerState extends State<FeedPlayer> {
  FlickMultiManager flickMultiManager;
  AutoScrollController _controller;
 
  @override
  void initState() {
    super.initState();
    flickMultiManager = FlickMultiManager();
    _controller = AutoScrollController();

    _controller.scrollToIndex(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: VisibilityDetector(
          key: ObjectKey(flickMultiManager),
          onVisibilityChanged: (visibility) {
            if (visibility.visibleFraction == 0 && this.mounted) {
              flickMultiManager.pause();
            }
          },
          child: Scaffold(
            backgroundColor: Colors.black,
            body: Stack(children: [
              Container(
                child: Scroller(
                  scrollController: _controller,
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(vertical: 30),
                    controller: _controller,
                    separatorBuilder: (context, int) => Container(height: 30),
                    itemCount: widget.media.length,
                    itemBuilder: (context, index) {
                      final message = widget.media[index];

                      
                      return AutoScrollTag(
                          index: index,
                          controller: _controller,
                          key: ValueKey(index),
                          child: Container(
                              height: MediaQuery.of(context).size.height * .36,
                              margin: EdgeInsets.all(4),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    fit: StackFit.expand,
                                    children: [
                                      CachedVideoPlayer(
                                          message: message,
                                          manager: flickMultiManager),
                                      Positioned(
                                          right: 8,
                                          bottom: 8,
                                          child: UserAvatar(
                                              showPlus: false,
                                              url: message.sender?.photo?.url ??
                                                  '',
                                              onTap: () {})),
                                      Positioned(
                                          left: 16,
                                          top: 16,
                                          child: VideoSeenCounter(
                                              counter: widget.media[index]
                                                      ?.viewCount ??
                                                  0))
                                    ],
                                  ))));
                    },
                  ),
                ),
              ),
              if (widget.showClose)
                Positioned(
                  top: 40,
                  left: 8,
                  child: SizedBox(child: RoundedClose()),
                ),
            ]),
          ),
        ));
  }
}
