import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:iconapp/widgets/global/rounded_close.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class DefaultVideoPlayer extends StatefulWidget {
  final String url;
  const DefaultVideoPlayer({Key key, @required this.url}) : super(key: key);

  @override
  _DefaultVideoPlayerState createState() => _DefaultVideoPlayerState();
}

class _DefaultVideoPlayerState extends State<DefaultVideoPlayer> {
  FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(widget.url),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VisibilityDetector(
        key: ObjectKey(flickManager),
        onVisibilityChanged: (visibility) {
          if (visibility.visibleFraction == 0 && this.mounted) {
            flickManager.flickControlManager.autoPause();
          } else if (visibility.visibleFraction == 1) {
            flickManager.flickControlManager.autoResume();
          }
        },
        child: Stack(children: [
          Container(
            child: FlickVideoPlayer(
              flickManager: flickManager,
              flickVideoWithControls:
                  FlickVideoWithControls(controls: FlickPortraitControls()),
              flickVideoWithControlsFullscreen: FlickVideoWithControls(
                videoFit: BoxFit.contain,
                controls: FlickLandscapeControls(),
              ),
            ),
          ),
          Positioned(
            top: 32,
            right: 16,
            child: RoundedClose(),
          ),
        ]),
      ),
    );
  }
}
