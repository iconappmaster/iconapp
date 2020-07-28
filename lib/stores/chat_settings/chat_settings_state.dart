import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/user_model.dart';
part 'chat_settings_state.freezed.dart';

@freezed
abstract class ChatSettingsState with _$ChatSettingsState {
  const factory ChatSettingsState({
    @required bool loading,
    @required bool notifications,
    @required ChatBackground background,
    @required List<UserModel> participants,
  }) = _ChatState;

  factory ChatSettingsState.initial() => ChatSettingsState(
      loading: false,
      background: ChatBackground.purple,
      notifications: true,
      participants: []);
}

enum ChatBackground { blue, green, purple }
