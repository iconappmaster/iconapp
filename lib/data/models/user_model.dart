import 'package:iconapp/data/models/photo_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String firstName;
  final String lastName;
  final UserGender gender;
  final PhotoModel photo;
  final DateTime birthday;
  final UserRole role;

  UserModel(
    this.firstName,
    this.lastName,
    this.gender,
    this.photo,
    this.birthday,
    this.role,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

enum UserGender { male, female }
enum UserRole { admin, viewer }
