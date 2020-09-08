import 'dart:io';
import 'package:flutter/material.dart';
import 'package:iconapp/data/models/photo_model.dart';
import 'package:iconapp/widgets/global/blur_appbar.dart';
import 'package:photo_view/photo_view.dart';

class FullPhotoScreen extends StatelessWidget {
  final PhotoModel photo;

  const FullPhotoScreen({Key key, this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(children: [
        PhotoView(
            backgroundDecoration: BoxDecoration(color: Colors.black),
            imageProvider: photo.url.startsWith('http')
                ? NetworkImage(photo.url)
                : FileImage(File(photo.url))),
        BluredAppbar(),
      ]),
    );
  }
}
