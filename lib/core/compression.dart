import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';

const _photoQuality = 70;

Future<File> compressToFile(File file, String targetPath) async {
  final result = await FlutterImageCompress.compressAndGetFile(
    file.absolute.path,
    targetPath,
    quality: _photoQuality,
  );

  return result;
}
