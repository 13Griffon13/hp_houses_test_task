import 'package:dartz/dartz.dart';
import 'package:test_task_hp_houses/core/domain/entities/failure.dart';
import 'package:test_task_hp_houses/core/domain/use_cases/use_case.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/entities/character_entity.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/entities/houses.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/repositories/guesses_repository.dart';

class GuessHouseUseCase extends UseCase<CharacterEntity, Params> {
  final GuessesRepository guessesRepository;

  GuessHouseUseCase({required this.guessesRepository});

  @override
  Future<Either<Failure, CharacterEntity>> call(Params params) {
    return guessesRepository.guessHouse(params.character, params.house);
  }
}

class Params {
  final CharacterEntity character;
  final House house;

  const Params({required this.character, required this.house});
}
