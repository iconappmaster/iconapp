import 'dart:io';
import 'package:flutter/services.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../portrait_controls.dart';
import './flick_multi_manager.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FlickMultiPlayer extends StatefulWidget {
  const FlickMultiPlayer({
    Key key,
    this.url,
    this.file,
    @required this.flickMultiManager,
    this.withControls = true,
    this.withFullScreen = true,
    this.mute = false,
  }) : super(key: key);
  final File file;
  final String url;
  final bool withControls, withFullScreen, mute;
  final FlickMultiManager flickMultiManager;

  @override
  _FlickMultiPlayerState createState() => _FlickMultiPlayerState();
}

class _FlickMultiPlayerState extends State<FlickMultiPlayer> {
  FlickManager flickManager;

  @override
  void initState() {
    if (widget.file == null) {
      flickManager = FlickManager(
          videoPlayerController: VideoPlayerController.network(widget.url)
            ..setLooping(true),
          autoPlay: false);

      widget.flickMultiManager.init(flickManager);

      if (widget.mute) {
        widget.flickMultiManager.mute();
      }
    } else {
      flickManager = FlickManager(
          videoPlayerController: VideoPlayerController.file(widget.file)
            ..setLooping(true),
          autoPlay: false);

      widget.flickMultiManager.init(flickManager);

      if (widget.mute) {
        widget.flickMultiManager.mute();
      }
    }

    super.initState();
  }

  @override
  void dispose() {
    widget.flickMultiManager.remove(flickManager);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ObjectKey(flickManager),
      onVisibilityChanged: (visiblityInfo) {
        if (visiblityInfo.visibleFraction > 0.9) {
          widget.flickMultiManager.play(flickManager);
        }
      },
      child: Container(
          child: FlickVideoPlayer(
              flickManager: flickManager,
              wakelockEnabledFullscreen: true,
              flickVideoWithControls: FlickVideoWithControls(
                backgroundColor: plusBorder,
                playerLoadingFallback: Positioned.fill(
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                          right: 10,
                          top: 10,
                          child: Container(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                  backgroundColor: cornflower, strokeWidth: 1)))
                    ],
                  ),
                ),
                controls: widget.withControls
                    ? FeedPlayerPortraitControls(
                        flickMultiManager: widget.flickMultiManager,
                        flickManager: flickManager)
                    : null,
              ),
              preferredDeviceOrientationFullscreen: [
                DeviceOrientation.portraitUp
              ],
              flickVideoWithControlsFullscreen: widget.withFullScreen
                  ? FlickVideoWithControls(
                      videoFit: BoxFit.contain,
                      playerLoadingFallback:
                          Center(child: CustomText('Cant load the video')),
                      controls: FlickLandscapeControls(),
                      iconThemeData: IconThemeData(size: 50, color: white),
                      textStyle: TextStyle(fontSize: 34, color: white))
                  : null)),
    );
  }
}