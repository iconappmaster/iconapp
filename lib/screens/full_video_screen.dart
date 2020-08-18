import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FullVideoScreen extends StatefulWidget {
  final String url;

  const FullVideoScreen({Key key, this.url}) : super(key: key);

  @override
  _FullVideoScreenState createState() => _FullVideoScreenState();
}

class _FullVideoScreenState extends State<FullVideoScreen> {
  VideoPlayerController _controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    widget.url.startsWith('http') ? _startVideoNetwork() : _startVideoLocal();
  }

  void _startVideoNetwork() {
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        setState(() {
          isLoading = false;
          _controller.play();
        });
      });
  }

  void _startVideoLocal() {
    _controller = VideoPlayerController.file(File(widget.url))
      ..initialize().then((_) => setState(() {
            isLoading = false;
            _controller.play();
          }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller))),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
