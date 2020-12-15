import 'package:flutter/foundation.dart';

class CommentListOption {
  final String title;
  final int commentsMaxUserCount;

  CommentListOption({
    @required this.title,
    @required this.commentsMaxUserCount,
  });
}

final commentsOptionList = [
  CommentListOption(commentsMaxUserCount: 20, title: '20'),
  CommentListOption(commentsMaxUserCount: 50, title: '50'),
  CommentListOption(commentsMaxUserCount: 75, title: '70'),
  CommentListOption(commentsMaxUserCount: 100, title: '100'),
  CommentListOption(commentsMaxUserCount: 200, title: '200'),
  CommentListOption(commentsMaxUserCount: 100000, title: 'No limit'),
];
