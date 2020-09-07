import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/story_image.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/screens/full_video_screen.dart';
import 'package:iconapp/screens/story_edit_screen.dart';
import 'package:iconapp/stores/story/story_edit_store.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/global/network_photo.dart';
import '../../core/extensions/string_ext.dart';

class StoryMediaTile extends StatelessWidget {
  final bool active;
  final StoryImageModel story;

  StoryMediaTile({
    Key key,
    @required this.active,
    @required this.story,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double blur = active ? 30 : 0;
    final double offset = active ? 20 : 0;
    final double top = active ? 100 : 200;

    final decoration = BoxDecoration(
      color: white,
      borderRadius: storyBorderRadius,
      boxShadow: [
        BoxShadow(
            color: Colors.black87,
            blurRadius: blur,
            offset: Offset(offset, offset))
      ],
    );

    final store = sl<StoryEditStore>();

    return Stack(
      fit: StackFit.expand,
      children: [
        AnimatedContainer(
          child: story.imageType == MediaType.photo.toString().parseEnum()
              ? ClipRRect(
                  borderRadius: storyBorderRadius,
                  child: NetworkPhoto(
                    url: story.photo?.url ?? '',
                  ))
              : ClipRRect(
                  borderRadius: storyBorderRadius,
                  child: VideoScreen(url: story.photo.url, showToolbar: false),
                ),
          duration: Duration(milliseconds: 400),
          curve: Curves.easeOutQuint,
          margin: EdgeInsets.only(
            top: top,
            bottom: 40,
            right: 40,
          ),
          decoration: decoration,
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Visibility(
              visible: story.description != null,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: HebrewText(
                  story.description,
                  style: systemMessage,
                  maxLines: 1,
                ),
              ),
            )),
        AnimatedPositioned(
            duration: Duration(milliseconds: 150),
            top: top + 15,
            left: 15,
            child: IconButton(
              icon: Icon(
                Icons.text_format,
                color: white,
                size: 22,
              ),
              onPressed: () async {
                final description =
                    await ExtendedNavigator.of(context).pushDescriptionScreen(
                  type: story.imageType == "photo"
                      ? MediaType.photo
                      : MediaType.video,
                  url: story.photo?.url ?? '',
                );

                store.updateStory(story.copyWith(description: description));
              },
            )),
        AnimatedPositioned(
            duration: Duration(milliseconds: 150),
            top: top + 15,
            right: 40,
            child: IconButton(
              icon: Icon(Icons.close, color: white, size: 22),
              onPressed: () => store.deleteStory(story),
            )),
      ],
    );
  }
}
