import 'package:flutter/material.dart';
import 'package:iconapp/data/models/photo_model.dart';
import 'package:iconapp/widgets/global/blur_appbar.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:iconapp/widgets/global/network_photo.dart';

class PhotoGalleryScreen extends StatelessWidget {
  final List<PhotoModel> galleryItems;
  final int intialIndex;
  const PhotoGalleryScreen({
    Key key,
    this.galleryItems,
    this.intialIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .5,
                  child: Swiper(
            viewportFraction: 0.8,
            scale: 0.9,
            itemCount: galleryItems.length,
            index: intialIndex,
            itemBuilder: (context, index) {
              final photo = galleryItems[index];
              return NetworkPhoto(url: photo.url);
            },
          ),
        ),
        BluredAppbar(),
      ]),
    );
  }
}