import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dashed/dahs_container.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/screens/story_edit_screen.dart';
import 'package:iconapp/stores/story/story_edit_store.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';

class StoryAddMediaTile extends StatelessWidget {
  final bool active;
  final double progress;

  const StoryAddMediaTile({
    Key key,
    @required this.active,
    this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double top = active ? 100 : 150;
    final edit = sl<StoryEditStore>();
    return Padding(
      padding: const EdgeInsets.all(50),
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext bc) {
                return Container(
                  child: Wrap(
                    children: <Widget>[
                      ListTile(
                          leading: Icon(Icons.photo),
                          title: Text('גלריה'),
                          onTap: () {
                            edit.addPhotoMedia();
                            Navigator.pop(context);
                          }),
                      ListTile(
                        leading: Icon(Icons.videocam),
                        title: Text('סרטון'),
                        onTap: () {
                          edit.addVideoMedia();
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              });
          // return edit.addPhotoMedia();
        },
        child: DashedContainer(
          dashColor: white,
          borderRadius: 22,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeOutQuint,
            margin: EdgeInsets.only(top: top, bottom: 50, right: 30),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: storyBorderRadius,
            ),
            child: Observer(builder: (_) {
              return Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HebrewText('הוסף תמונה או סרטון',
                        style: emptyState.copyWith(
                          color: white,
                        )),
                    SizedBox(height: 20),
                    Icon(Icons.photo, size: 50, color: white),
                    SizedBox(height: 20),
                    if (edit.isLoading)
                      CircularProgressIndicator(
                          value: progress,
                          strokeWidth: 3,
                          backgroundColor: dusk),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}