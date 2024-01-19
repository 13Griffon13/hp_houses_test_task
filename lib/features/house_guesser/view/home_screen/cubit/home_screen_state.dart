import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_task_hp_houses/core/domain/entities/failure.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/entities/character_entity.dart';

part 'home_screen_state.freezed.dart';

@freezed
class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState({
    CharacterEntity? selectedCharacter,
    Failure? error,
  }) = _HomeScreenState;
}
