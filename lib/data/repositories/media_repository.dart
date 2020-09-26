import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:iconapp/core/bus.dart';
import 'package:iconapp/core/compression.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/firebase/crashlytics.dart';
import 'package:iconapp/data/sources/remote/firebase_consts.dart';
import 'package:path_provider/path_provider.dart';

abstract class MediaRepository {
  Future<String> uploadSinglePhoto(
      File original, String path, String fileName, int messageId);
  Future<String> uploadAudio(
      File original, String path, String fileName, int messageId);
  Future<String> uploadVideo(
      File original, String path, String fileName, int messageId);
}

class MediaRepositoryImpl implements MediaRepository {
  @override
  Future<String> uploadSinglePhoto(
      File image, String path, String fileName, int messageId) async {
    final photoPath = "$path/photos/";

    final compressed = await _compressPhoto(image);

    return await upload(photoPath, fileName, compressed, messageId);
  }

  @override
  Future<String> uploadVideo(
      File video, String path, String fileName, int messageId) async {
    final videoPath = "$path/videos/";

    final info = await compressVideo(video);

    // flutterVideoCompress.compressProgress$.subscribe((event) { });
    
    return await upload(
      videoPath,
      fileName,
      info.file,
      messageId,
    );
  }

  @override
  Future<String> uploadAudio(
    File audio,
    String path,
    String fileName,
    int messageId,
  ) async {
    final audioPath = "$path/audio/";

    return await upload(
      audioPath,
      fileName,
      audio,
      messageId,
    );
  }

  // Uploads the file to Firebase storage !Need to handle error
  Future upload(String path, String fileName, File file,
      [int messageId]) async {
    final storage = FirebaseStorage(storageBucket: firebaseStorageBucket);
    final storageRefOriginal = storage.ref().child(path).child(fileName);

    final uploadTask = storageRefOriginal.putFile(file);
    _emitProgress(uploadTask, messageId);
    await uploadTask.onComplete;
    return await storageRefOriginal.getDownloadURL();
  }

  Future<File> _compressPhoto(File image) async {
    File compressed;
    try {
      final appDocDirectory = await getApplicationDocumentsDirectory();
      compressed = await compressPhotoToFile(image,
          "${appDocDirectory.path}/compressed_${DateTime.now().millisecondsSinceEpoch}.jpg");
    } on Exception catch (e) {
      Crash.report(e.toString());
    }
    return compressed;
  }

  void _emitProgress(StorageUploadTask uploadTask, int messageId) {
    uploadTask.events.listen((event) {
      final snapshot = event.snapshot;

      double progressPercent = snapshot != null
          ? snapshot.bytesTransferred / snapshot.totalByteCount
          : 0;

      sl<Bus>().fire(ProgressEvent(progress: progressPercent, id: messageId));
    });
  }
}

class ProgressEvent {
  final int id;
  final double progress;

  ProgressEvent({
    @required this.progress,
    this.id,
  });
}
