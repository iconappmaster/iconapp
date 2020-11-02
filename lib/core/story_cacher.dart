import 'dart:async';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:iconapp/data/models/photo_model.dart';
import 'package:iconapp/data/models/story_model.dart';

class StoryCacheManager {
  // Map to have the story id and it's photos
  final _cachedImages = Map<int, List<PhotoModel>>();

  Map<int, List<PhotoModel>> get cachedImages => _cachedImages;

  Future downloadStories(List<StoryModel> stories) async {
    final List<PhotoModel> _photos = [];
    final cache = await DefaultCacheManager();

    stories.forEach((story) {
      story.storyImages.forEach((image) async {
        final fileInfo = await cache.getSingleFile(image.photo.url);
        final cachedImage =
            image.photo.copyWith(url: fileInfo.path);

        _photos.add(cachedImage);
        _cachedImages[story.id] = _photos;
      });

      _photos.clear();
    });
  }
}
