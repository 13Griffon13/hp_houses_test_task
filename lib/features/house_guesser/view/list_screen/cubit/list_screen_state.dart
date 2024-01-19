import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_task_hp_houses/core/domain/entities/failure.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/entities/character_entity.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/entities/guesses.dart';

part 'list_screen_state.freezed.dart';

@freezed
class ListScreenState with _$ListScreenState {
  const factory ListScreenState({
    @Default(GuessesEntity()) GuessesEntity totalGuesses,
    @Default([]) List<CharacterEntity> characters,
    List<CharacterEntity>? searchResult,
    @Default('') String searchRequest,
    Failure? error,
  }) = _ListScreenState;
}
