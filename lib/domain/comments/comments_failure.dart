import 'package:freezed_annotation/freezed_annotation.dart';

part 'comments_failure.freezed.dart';

@freezed
abstract class CommentsFailure with _$CommentsFailure {
  const factory CommentsFailure.serverError(String error) = CommentServerFailure;
  const factory CommentsFailure.exceededMaxCount() = ExceededMaxCount;
  const factory CommentsFailure.messageEmpty() = MessageEmpty;
}
