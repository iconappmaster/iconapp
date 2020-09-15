import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';

Future<File> compressToFile(File file, String targetPath) async {
  final result = await FlutterImageCompress.compressAndGetFile(
    file.absolute.path,
    targetPath,
    quality: 50,
    
  );

  print(file.lengthSync());
  print(result.lengthSync());

  return result;
}
