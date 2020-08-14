import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconapp/data/models/photo_model.dart';
import 'package:photo_view/photo_view.dart';

class FullImageScreen extends StatelessWidget {
  final PhotoModel photo;

  const FullImageScreen({Key key, this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhotoView(
      imageProvider: photo.url.startsWith('http')
          ? NetworkImage(photo.url)
          : AssetImage(photo.url),
    );
  }
}
