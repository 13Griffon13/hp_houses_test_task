import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_task_hp_houses/core/domain/entities/failure.dart';

part 'house_guesser_state.freezed.dart';

@freezed
class HouseGuesserState with _$HouseGuesserState {
  const factory HouseGuesserState({
    Failure? error,
  }) = _HouseGuesserState;
}
