import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/widgets/home/home_staggered.dart';

import '../theme.dart';
import 'feed_player/multi_manager/flick_multi_manager.dart';
import 'feed_player/multi_manager/flick_multi_player.dart';

class CachedVideoPlayer extends StatelessWidget {
  final MessageModel message;
  final FlickMultiManager manager;

  const CachedVideoPlayer({
    Key key,
    @required this.message,
    this.manager,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _chatStore = sl<ChatStore>();
    return StreamBuilder<FileResponse>(
      stream: DefaultCacheManager().getFileStream(message.body ?? ''),
      builder: (context, snapshot) {
        _chatStore.viewedVideo(message.id);
        if (snapshot.hasData) {
          final file = (snapshot.data as FileInfo).file;
          return FlickMultiPlayer(
            file: file,
            flickMultiManager: manager,
          );
        } else {
          return Container(
              decoration: BoxDecoration(color: darkBlueGrey),
              child: ShimmerPlaceholder());
        }
      },
    );
  }
}
