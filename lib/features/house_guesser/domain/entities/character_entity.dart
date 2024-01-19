import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/entities/guesses.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/entities/houses.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/entities/wand_entity.dart';

part 'character_entity.freezed.dart';

@freezed
class CharacterEntity with _$CharacterEntity {
  const factory CharacterEntity({
    required String id,
    required String name,
    required List<String> alternateNames,
    required String species,
    required String gender,
    required House house,
    String? dateOfBirth,
    num? yearOfBirth,
    required bool wizard,
    required String ancestry,
    required String eyeColour,
    required String hairColour,
    required WandEntity wand,
    required String patronus,
    required bool hogwartsStudent,
    required bool hogwartsStaff,
    required String actor,
    required List<dynamic> alternateActors,
    required bool alive,
    required String image,
    @Default(GuessesEntity()) GuessesEntity guesses,
  }) = _CharacterEntity;
}
