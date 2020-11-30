import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/stores/home/home_store.dart';
import 'package:iconapp/widgets/global/network_photo.dart';

class HomeStaggered extends StatelessWidget {
  final home = sl<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      staggeredTileBuilder: (int index) => StaggeredTile.count(
          2, home.conversations[index]?.media?.mediaType == 'video' ? 2 : 1),
      crossAxisCount: 4,
      itemCount: home.conversations.length,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      itemBuilder: (BuildContext context, int index) {
        final conversation = home.conversations[index];

        switch (conversation?.media?.mediaType) {
          case 'photo':
            return StaggeredPhotoTile(conversation: conversation);

          case 'video':
            return StaggeredVideoTile();

          default:
            return StaggeredPhotoTile(conversation: conversation);
        }
      },
    );
  }
}

class StaggeredPhotoTile extends StatelessWidget {
  final Conversation conversation;

  const StaggeredPhotoTile({
    Key key,
    @required this.conversation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Stack(children: [
      NetworkPhoto(imageUrl: conversation?.backgroundPhoto?.url ?? ''),
    ]);
  }
}

class StaggeredVideoTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
