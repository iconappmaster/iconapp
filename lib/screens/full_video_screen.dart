import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/widgets/global/rounded_close.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  final bool mute;
  final String url;
  final bool showToolbar;
  final VideoPlayerController controller;
  final bool canDismiss;
  final bool showReplay;
  const VideoScreen({
    Key key,
    @required this.url,
    this.showToolbar = true,
    this.mute = false,
    this.controller,
    this.canDismiss = false,
    this.showReplay = false,
  }) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  VideoPlayerController _controller;
  bool showReplay;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    showReplay = widget?.showReplay ?? false;

    if (widget.controller != null) {
      _controller = widget.controller;
    }

    widget.url.startsWith('http') ? _startVideoNetwork() : _startVideoLocal();
    _controller.addListener(() {
      if (_controller.value.position == _controller.value.duration && mounted) {
        setState(() => showReplay = true);
      }
    });
  }

  void _startVideoNetwork() {
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        if (widget.mute) {
          _controller.setVolume(0);
        }

        if (mounted)
          setState(() {
            isLoading = false;
            _controller.play();
          });
      });
  }

  void _startVideoLocal() {
    _controller = VideoPlayerController.file(File(widget.url))
      ..initialize().then((_) {
        if (widget.mute) {
          _controller.setVolume(0);
        }

        if (mounted)
          setState(() {
            isLoading = false;
            _controller.play();
          });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: isLoading
                ? CircularProgressIndicator()
                : AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
          ),
          if (widget.showToolbar)
            Positioned(
              top: 32,
              right: 16,
              child: RoundedClose(),
            ),
          if (showReplay)
            ReplayButton(
              onPress: () async {
                if (mounted) setState(() => showReplay = false);
                await _controller.seekTo(Duration(seconds: 0));
                _controller.play();
              },
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class ReplayButton extends StatelessWidget {
  final Function onPress;
  const ReplayButton({
    Key key,
    @required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: Colors.black38.withOpacity(.5)),
        child: IconButton(
          onPressed: onPress,
          icon: Icon(
            Icons.replay,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }
}
