import 'dart:io';

import 'package:iconapp/core/theme.dart';
import 'package:image_cropper/image_cropper.dart';

Future<File> crop(File file) async {
  File croppedFile = await ImageCropper.cropImage(
      sourcePath: file.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'עריכת תמונה',
          cropFrameColor: cornflower,
          activeControlsWidgetColor: cornflower,
          statusBarColor: cornflower,
          cropFrameStrokeWidth: 3,
          toolbarColor: cornflower,
          toolbarWidgetColor: white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
      iosUiSettings: IOSUiSettings(
        title: 'עריכת תמונה',
        doneButtonTitle: 'סיים',
        cancelButtonTitle: 'ביטול',
        showCancelConfirmationDialog: true,
        minimumAspectRatio: 1.0,
      ));
  return croppedFile;
}
