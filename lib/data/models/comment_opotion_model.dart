import 'package:flutter/foundation.dart';

class CommentListOption {
  final String title;
  final int commentsMaxUserCount;

  CommentListOption({
    @required this.title,
    @required this.commentsMaxUserCount,
  });
}

final commentsOption = [
  CommentListOption(commentsMaxUserCount: 20, title: 'עד 20'),
  CommentListOption(commentsMaxUserCount: 50, title: 'עד 50'),
  CommentListOption(commentsMaxUserCount: 75, title: 'עד 70'),
  CommentListOption(commentsMaxUserCount: 100, title: 'עד 100'),
  CommentListOption(commentsMaxUserCount: 200, title: 'עד 200'),
  CommentListOption(commentsMaxUserCount: 0, title: 'ללא הגבלת משתתפים'),
];
