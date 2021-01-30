import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:video_compress/video_compress.dart';

const _photoQuality = 70;

Future<File> compressPhotoToFile(File file, String targetPath) async {
  final result = await FlutterImageCompress.compressAndGetFile(
    file.absolute.path,
    targetPath,
    quality: _photoQuality,
  );

  return result;
}

Future<File> compressVideo(File file) async {
  if (Platform.isAndroid) {
    MediaInfo mediaInfo = await VideoCompress.compressVideo(
      file.path,
      quality: VideoQuality.DefaultQuality,
      includeAudio: true,
      startTime: 0,
      deleteOrigin: true,
    );
    return mediaInfo.file;
  }

  return file;
}
