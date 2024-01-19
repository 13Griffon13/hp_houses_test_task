import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_task_hp_houses/features/house_guesser/data/models/wand_model.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/entities/character_entity.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/entities/houses.dart';

part 'character_model.freezed.dart';

part 'character_model.g.dart';

@freezed
class CharacterModel with _$CharacterModel {
  const CharacterModel._();

  const factory CharacterModel({
    required String id,
    required String name,
    required List<String>? alternateNames,
    required String species,
    required String gender,
    required String house,
    String? dateOfBirth,
    num? yearOfBirth,
    required bool wizard,
    required String ancestry,
    required String eyeColour,
    required String hairColour,
    required WandModel wand,
    required String patronus,
    required bool hogwartsStudent,
    required bool hogwartsStaff,
    required String actor,
    required List<dynamic>? alternateActors,
    required bool alive,
    required String image,
  }) = _CharacterModel;

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);

  CharacterEntity get entity => CharacterEntity(
        id: id,
        name: name,
        alternateNames: alternateNames ?? [],
        species: species,
        gender: gender,
        house: House.fromString(house),
        dateOfBirth: dateOfBirth,
        yearOfBirth: yearOfBirth,
        wizard: wizard,
        ancestry: ancestry,
        eyeColour: eyeColour,
        hairColour: hairColour,
        wand: wand.entity,
        patronus: patronus,
        hogwartsStudent: hogwartsStudent,
        hogwartsStaff: hogwartsStaff,
        actor: actor,
        alternateActors: alternateActors ?? [],
        alive: alive,
        image: image,
      );
}
