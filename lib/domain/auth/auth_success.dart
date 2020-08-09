import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_success.freezed.dart';

@freezed
abstract class AuthSuccess with _$AuthSuccess {
  const factory AuthSuccess.navigateHome() = NavigateHome;
  const factory AuthSuccess.navigateProfile() = NavigateProfile;
}
