import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/data/models/photo_model.dart';
import 'package:iconapp/data/models/user_model.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

/// Used for category search
@freezed
abstract class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    final int id,
    final int categoryId,
    final UserModel createdBy,
    final String createAt,
    final String name,
    final PhotoModel photo,
    final PhotoModel backgroundPhoto,
    final MessageModel lastMessage,
    final int unreadMessageCount,
    final List<UserModel> users,
    final List<MessageModel> messages,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
