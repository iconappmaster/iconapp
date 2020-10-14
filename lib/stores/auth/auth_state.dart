import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iconapp/data/models/conversation_model.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = Initial;
  const factory AuthState.onboarding() = Onboarding;
  const factory AuthState.authenticated() = Authenticated;
  const factory AuthState.unauthenticated() = Unauthenticated;
  const factory AuthState.fromNotificationOpenChat(Conversation conversation) = OpenChat;
}