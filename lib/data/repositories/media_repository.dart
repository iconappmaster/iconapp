import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:iconapp/data/sources/remote/firebase_consts.dart';

abstract class MediaRepository {
  Future<String> uploadSinglePhoto(File original, String path, String fileName);
  Future<String> uploadAudio(File original, String path, String fileName);
  Future<String> uploadVideo(File original, String path, String fileName);
}

class MediaRepositoryImpl implements MediaRepository {
  @override
  Future<String> uploadSinglePhoto(
      File image, String path, String fileName) async {
    final photoPath = "$path/photos/";
    return await upload(photoPath, fileName, image);
  }

  @override
  Future<String> uploadVideo(File video, String path, String fileName) async {
    final videoPath = "$path/videos/";
    return await upload(videoPath, fileName, video);
  }

  @override
  Future<String> uploadAudio(File original, String path, String fileName) {
    throw UnimplementedError();
  }

  // Uploads the file to Firebase storage !Need to handle error
  Future upload(String path, String fileName, File image) async {
    final storage = FirebaseStorage(storageBucket: firebaseStorageBucket);
    final storageRefOriginal = storage.ref().child(path).child(fileName);
    final originalTask = storageRefOriginal.putFile(image);
    await originalTask.onComplete;
    return await storageRefOriginal.getDownloadURL();
  }
}
