import 'package:flutter/material.dart';
import 'package:iconapp/widgets/chat/chat_list.dart';
import 'package:iconapp/widgets/global/rounded_close.dart';
import 'package:visibility_detector/visibility_detector.dart';
import './multi_manager/flick_multi_manager.dart';
import './multi_manager/flick_multi_player.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class FeedPlayer extends StatefulWidget {
  final List<String> urls;
  final int index;
  const FeedPlayer({Key key, this.urls, this.index}) : super(key: key);

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
                    itemCount: widget.urls.length,
                    itemBuilder: (context, index) {
                      return AutoScrollTag(
                        index: index,
                        controller: _controller,
                        key: ValueKey(index),
                        child: Container(
                          height: 450,
                          margin: EdgeInsets.all(2),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: FlickMultiPlayer(
                              url: widget.urls[index],
                              flickMultiManager: flickMultiManager,
                              image: widget.urls[index],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
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
