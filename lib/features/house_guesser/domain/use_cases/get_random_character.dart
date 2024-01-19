import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:test_task_hp_houses/core/domain/entities/failure.dart';
import 'package:test_task_hp_houses/core/domain/use_cases/use_case.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/entities/character_entity.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/repositories/characters_repository.dart';

class GetRandomCharacterUseCase extends UseCase<CharacterEntity, void> {
  final CharactersRepository charactersRepository;

  GetRandomCharacterUseCase({required this.charactersRepository});

  @override
  Future<Either<Failure, CharacterEntity>> call([void params]) async {
    final allCharacters = await charactersRepository.getAllCharacters();
    return allCharacters.fold(
      (l) => left(l),
      (r) {
        if (r.isNotEmpty) {
          return right(r[Random().nextInt(r.length)]);
        } else {
          return left(const Failure(name: 'Empty list'));
        }
      },
    );
  }
}
