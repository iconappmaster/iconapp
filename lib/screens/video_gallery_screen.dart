import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/ads/admob/admob.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/screens/full_video_screen.dart';
import 'package:iconapp/widgets/global/blur_appbar.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:video_player/video_player.dart';
import 'package:iconapp/routes/router.gr.dart';

class VideoGalleryScreen extends StatefulWidget {
  final List<MessageModel> videos;
  final int intialIndex;

  const VideoGalleryScreen({
    Key key,
    @required this.videos,
    @required this.intialIndex,
  }) : super(key: key);

  @override
  _VideoGalleryScreenState createState() => _VideoGalleryScreenState();
}

class _VideoGalleryScreenState extends State<VideoGalleryScreen> {
  VideoPlayerController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(children: [
        Center(
          child: Swiper(
            loop: false,
            viewportFraction: 0.8,
            scale: 0.95,
            onIndexChanged: (index) => print(index),
            itemCount: widget.videos.length,
            scrollDirection: Axis.vertical,
            index: widget.intialIndex,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final url = widget.videos[index].body;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () async {
                    await sl<AdMob>().showRewardlNow();
                    ExtendedNavigator.of(context).pushVideoScreen(url: url);
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      VideoScreen(
                        showReplay: false,
                        controller: _controller,
                        url: url,
                        showToolbar: false,
                        mute: true,
                      ),
                      SvgPicture.asset('assets/images/play_button.svg',
                          height: 46, width: 46),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        BluredAppbar(),
      ]),
    );
  }
}
