import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';

class LikeBubble extends StatelessWidget {
  final String likeAsset;
  final int count;
  final EdgeInsets padding;

  const LikeBubble({
    Key key,
    this.likeAsset,
    this.count,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.all(0),
      child: Container(
        height: 20,
        padding: EdgeInsets.symmetric(horizontal: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: cornflower, borderRadius: BorderRadius.circular(13.3)),
        child: Row(
          children: [
            SvgPicture.asset(
              likeAsset != null
                  ? likesMap[likeAsset]
                  : 'assets/images/emoji_add.svg',
              height: 16,
              width: 16,
            ),
            SizedBox(width: 3),
            if (count != null)
              HebrewText(
                count.toString(),
                style: chatMessageBody,
                maxLines: 1,
              ),
          ],
        ),
      ),
    );
  }
}

final likesMap = {
  likeOneKey: 'assets/images/wow.svg',
  likeTwoKey: 'assets/images/king.svg',
  likeThreeKey: 'assets/images/smile.svg',
};

enum LikeTypes { like_1, like_2, like_3 }
