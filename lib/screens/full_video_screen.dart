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
  const VideoScreen({
    Key key,
    @required this.url,
    this.showToolbar = true,
    this.mute = false,
    this.controller,
  }) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  VideoPlayerController _controller;

  bool isLoading = true;
  bool showReplay = false;

  @override
  void initState() {
    super.initState();

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
    return Dismissible(
      background: Container(color: Colors.black),
      onDismissed: (_) => ExtendedNavigator.of(context).pop(),
      key: Key('video'),
      direction: DismissDirection.up,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(children: [
          Center(
            child: isLoading
                ? CircularProgressIndicator()
                : AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
          ),
          if (showReplay)
            ReplayButton(
              onPress: () async {
                if (mounted) setState(() => showReplay = false);
                await _controller.seekTo(Duration(seconds: 0));
                _controller.play();
              },
            ),
          if (widget.showToolbar)
            Positioned(
              top: 32,
              right: 16,
              child: RoundedClose(),
            ),
        ]),
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
        child: IconButton(
      onPressed: onPress,
      icon: SvgPicture.asset('assets/images/reply_button.svg'),
    ));
  }
}
