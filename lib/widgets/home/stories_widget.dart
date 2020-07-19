import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/story_model.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import '../../core/extensions/context_ext.dart';

class StoriesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: context.heightPlusStatusbarPerc(.128),
        child: Container(
          height: context.heightPlusStatusbarPerc(.12),
          width: context.widthPx,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return StoryItem(name: 'נטלי דדון');
            },
            itemCount: 10,
          ),
        ));
  }
}

class StoryItem extends StatelessWidget {
  final bool addStory;
  final String name;

  const StoryItem({Key key, this.addStory = false, @required this.name})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: <Widget>[
            
            // Outter circle
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(shape: BoxShape.circle, color: white),

              // Inner Circle with the Avatar
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  height: 52.3,
                  width: 52.3,
                  child: CircleAvatar(
                    backgroundColor: white,
                    
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: avatarRing,
                        width: 3,
                      )),
                ),
              ),
            ),






            // Name
            SizedBox(height: 8),
            HebrewText(name, style: myStory),
          ],
        ),
      ],
    );
  }
}

final stories = [StoryModel(user: UserModel(), photos: [])];
