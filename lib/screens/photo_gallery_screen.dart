import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../core/theme.dart';
import '../data/models/photo_model.dart';
import '../widgets/global/blur_appbar.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:iconapp/routes/router.gr.dart';

class PhotoGalleryScreen extends StatelessWidget {
  final List<PhotoModel> photos;
  final int intialIndex;
  const PhotoGalleryScreen({
    Key key,
    @required this.photos,
    @required this.intialIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(children: [
        Center(
            child: SizedBox(
                height: MediaQuery.of(context).size.height * .8,
                child: Swiper(
                    loop: false,
                    viewportFraction: 0.8,
                    scale: 0.9,
                    itemCount: photos.length,
                    scrollDirection: Axis.vertical,
                    index: intialIndex,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final url = photos[index].url;
                      return GestureDetector(
                        onTap: () => ExtendedNavigator.of(context)
                            .pushSingleImage(url: url),
                        child: CachedNetworkImage(
                            fadeOutDuration:
                                const Duration(milliseconds: 250),
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Center(
                                    child: SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 1,
                                          value: downloadProgress.progress,
                                          valueColor: AlwaysStoppedAnimation(
                                              cornflower),
                                        ))),
                            fit: BoxFit.cover,
                            imageUrl: url),
                      );
                    }))),
        BluredAppbar(),
      ]),
    );
  }
}
