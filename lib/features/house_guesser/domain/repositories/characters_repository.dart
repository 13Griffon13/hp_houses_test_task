import 'package:dartz/dartz.dart';
import 'package:test_task_hp_houses/core/domain/entities/failure.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/entities/character_entity.dart';

abstract class CharactersRepository {
  Future<Either<Failure, List<CharacterEntity>>> getAllCharacters();
}
