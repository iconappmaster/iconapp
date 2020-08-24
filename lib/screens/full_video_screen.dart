import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/widgets/global/blur_appbar.dart';
import 'package:video_player/video_player.dart';
import 'package:path_provider/path_provider.dart';

class FullVideoScreen extends StatefulWidget {
  final String url;

  const FullVideoScreen({Key key, this.url}) : super(key: key);

  @override
  _FullVideoScreenState createState() => _FullVideoScreenState();
}

class _FullVideoScreenState extends State<FullVideoScreen> {
  VideoPlayerController _controller;
  bool isLoading = true;
  bool showReplay = false;

  @override
  void initState() {
    super.initState();

    widget.url.startsWith('http') ? _startVideoNetwork() : _startVideoLocal();
    _controller.addListener(() {
      if (_controller.value.position == _controller.value.duration) {
        setState(() => showReplay = true);
      }
    });
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
      body: Stack(children: [
        Center(
            child: isLoading
                ? CircularProgressIndicator()
                : AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller))),
        if (showReplay)
          ReplayButton(
            onPress: () async {
              setState(() => showReplay = false);
              await _controller.seekTo(Duration(seconds: 0));
              _controller.play();
            },
          ),
        BluredAppbar(
          widget: IconButton(
              icon: Icon(Icons.file_download, color: white),
              onPressed: () async {
                final String dir =
                    (await getApplicationDocumentsDirectory()).path;
                final String path = '$dir/${DateTime.now()}_video.mp4';
                final response = await Dio().download(widget.url, path);

                print(response);
              }),
        ),
      ]),
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
      icon: Icon(
        Icons.replay,
        size: 60,
      ),
    ));
  }
}
