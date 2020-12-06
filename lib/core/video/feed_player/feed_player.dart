import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:iconapp/widgets/chat/chat_list.dart';
import 'package:iconapp/widgets/global/rounded_close.dart';
import 'package:iconapp/widgets/home/home_staggered.dart';
import 'package:visibility_detector/visibility_detector.dart';
import './multi_manager/flick_multi_manager.dart';
import './multi_manager/flick_multi_player.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class FeedPlayer extends StatefulWidget {
  final List<String> urls;
  final int index;
  final bool showClose;
  const FeedPlayer({
    Key key,
    @required this.urls,
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
                    itemCount: widget.urls.length,
                    itemBuilder: (context, index) => AutoScrollTag(
                      index: index,
                      controller: _controller,
                      key: ValueKey(index),
                      child: Container(
                        height: 300,
                        margin: EdgeInsets.all(4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: StreamBuilder<FileResponse>(
                            stream: DefaultCacheManager()
                                .getFileStream(widget.urls[index] ?? ''),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final file = (snapshot.data as FileInfo).file;

                                return FlickMultiPlayer(
                                    file: file,
                                    flickMultiManager: flickMultiManager);
                              } else
                                return ShimmerPlaceholder();
                            },
                          ),
                        ),
                      ),
                    ),
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
