import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:iconapp/data/sources/remote/firebase_consts.dart';

abstract class MediaRepository {
  Future<String> uploadSinglePhoto(File original, String path, String fileName);
  Future<String> uploadAudio();
  Future<String> uploadVideo();
}

class MediaRepositoryImpl implements MediaRepository {
  @override
  Future<String> uploadSinglePhoto(File image, String firebasePath, String fileName) async {
    final storage = FirebaseStorage(storageBucket: firebaseStorageBucket);

    // upload original photo
    final storageRefOriginal =
        storage.ref().child(firebasePath).child(fileName);

    final originalTask = storageRefOriginal.putFile(image);
    await originalTask.onComplete;
    final originalUrl = await storageRefOriginal.getDownloadURL();
    
    return originalUrl;
  }

  @override
  Future<String> uploadAudio() {
    throw UnimplementedError();
  }

  @override
  Future<String> uploadVideo() {
    throw UnimplementedError();
  }
}
