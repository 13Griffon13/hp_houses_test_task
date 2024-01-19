import 'package:dartz/dartz.dart';
import 'package:test_task_hp_houses/core/domain/entities/failure.dart';
import 'package:test_task_hp_houses/features/house_guesser/data/models/character_model.dart';
import 'package:test_task_hp_houses/features/house_guesser/data/service/hp_api_service.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/entities/character_entity.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/repositories/characters_repository.dart';

class ApiCharactersRepository extends CharactersRepository {
  final HPApiService apiService;

  ApiCharactersRepository({
    required this.apiService,
  });

  @override
  Future<Either<Failure, List<CharacterEntity>>> getAllCharacters() async {
    try {
      final result = await apiService.getCharacters();
      final parsed =
          result.map((e) => CharacterModel.fromJson(e).entity).toList();
      return right(parsed);
    } catch (e) {
      return left(Failure.fromObject(e));
    }
  }
}
