import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iconapp/data/models/category_model.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    // @required List<CategoryModel> categories,
    @required bool loading,
  }) = _HomeState;

  factory HomeState.initial() => HomeState(
        loading: false,
        // categories: []
      );
}
