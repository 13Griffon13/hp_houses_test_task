import 'package:dartz/dartz.dart';
import 'package:test_task_hp_houses/core/domain/entities/failure.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/entities/character_entity.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/entities/houses.dart';

abstract class GuessesRepository {
  Map<String, CharacterEntity> get guesses;

  Stream<Map<String, CharacterEntity>> get guessedCharacters;

  ///Should probably work with id and check guess in API but considering the
  ///API functionality decision was made just to pass whole entity and save it
  Future<Either<Failure, CharacterEntity>> guessHouse(
    CharacterEntity character,
    House house,
  );

  Future<Either<Failure, bool>> resetGuesses();

  void close();
}
