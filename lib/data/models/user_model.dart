import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iconapp/data/models/photo_model.dart';

part 'user_model.g.dart';
part 'user_model.freezed.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    int id,
    String fullName,
    String phone,
    String email,
    UserGender gender,
    PhotoModel photo,
    int age,
    UserType role,
    String pushToken,
    bool isPushEnabled,
    String sessionToken,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

enum UserGender { male, female, other }
enum UserType { admin, icon, viewer }