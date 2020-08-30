import 'package:freezed_annotation/freezed_annotation.dart';

part 'likes.freezed.dart';
part 'likes.g.dart';

@freezed
abstract class LikesCount with _$LikesCount {
  const factory LikesCount({
    @JsonKey(name: 'like_1') final int like1,
    @JsonKey(name: 'like_2') final int like2,
    @JsonKey(name: 'like_3') final int like3,
    @JsonKey(name: 'like_4') final int like4,
    @JsonKey(name: 'like_5') final int like5,
  }) = _LikesCount;

  factory LikesCount.initial() => LikesCount(
        like1: 0,
        like2: 0,
        like3: 0,
      );

  factory LikesCount.fromJson(Map<String, dynamic> json) =>
      _$LikesCountFromJson(json);
}
